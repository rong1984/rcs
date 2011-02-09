#include "htc.h"
#include "global.h"
#include "delay.h"
#include "keeloq_rx.h"
#include "keygen.h"
#include "string.h"
#include "keeloq_alg.h"
#include "table.h"

__CONFIG(MCLRDIS & INTIO & WDTDIS & WAKECNT & CP & CPD);

//--------------------------------------------------------------------
// LED & LEARN Timings
//--------------------------------------------------------------------
#define     TOUT            4               //   5 * 71ms = 350ms output delay
#define     TFLASH          5               //   4 * 71ms = 280ms half period
#define     TLEARN          255         // 255 * 71ms =  18s  learn timeout

//----------------- flags defines ------------------------------------

unsigned char     RFstate;       // Receiver state
signed char       RFcount;       // Timer counter
unsigned char     Bptr;          // Receive buffer pointer
unsigned char     BitCount;      // Received bits counter
unsigned char     RFtype;        // Determines what type of encrypted signal was received

//----------------- flags defines ------------------------------------

bit     FHopOK;         // Hopping code verified OK
bit     FSame;          // Same code as previous
bit     FLearn;         // Learn mode active
bit     F2Chance;       // Resync required
volatile bit     RFFull;             // Buffer full
volatile bit     RFBit;              // Sampled RF signal
volatile bit     RFsynch;            // Incoming trasnmission Synch level detect flag

//----------------- Encrypted Reception buffer -----------------------
unsigned char            Buffer[22];        // Decryption Work Buffer 
bank1 unsigned char      RX_Buffer[22];     // RF Receive buffer 

unsigned char            SEED[4];           // seed value = serial number
unsigned int             NextHop;           // resync value for 2 Chance
unsigned char            COut;              // output timer
unsigned char            FCode;             // Function codes and upper nibble of serial number
unsigned int             XTMR;              // 16 bit extended timer
bank1 unsigned char      CLearn, CTLearn;   // Learn timers and counter
bank1 unsigned char      CFlash, CTFlash;   // Led flashing timer and counter
bank1 unsigned int       Dato;              // Temp storage for read and write to mem.
bank1 unsigned int       Ind;               // Address pointer to record in mem.
bank1 unsigned int       Hop;               // Hopping code sync counter
bank1 unsigned int       EHop;              // Last value of sync counter (from EEPROM)
bank1 unsigned int       ETemp;             // Second copy of sync counter

unsigned char            Continue_Count;           

void init_pic16f636(void)
{
	CMCON0 = 0x07;
	PORTA = 0;
	PORTC = 0;
	TMR1L = 0;
	TMR1H = 0;
	T1CON = 0x31;
	TRISA = 0x3F;		//TRISA0 = 0 RA0 is output  LED
						//TRISA1 = 0 RA1 is output  ANT
						//TRISA2 = 1 RA2 is input   PB1
						//TRISA3 = 1 RA3 is input   PB4
						//TRISA4 = 1 RA4 is input   PB3
						//TRISA5 = 1 RA5 is input   PB2
//	TRISA1 = 0;
	TRISA5 = 0;
	TRISC = 0x00;
	TRISC0 = 1;
	TRISC1 = 1;
	TRISC2 = 1;
	TRISC3 = 1;
//    OSCCON = 0x61;		// internal 4 MHZ
    OSCCON = 0x75;		// internal 8 MHZ
//	OPTION = 0x46;
	OPTION = 0x0F;
	WPUDA = 0x3C;
#ifdef PULLUP
	WDA = 0x3C;
#else
	WDA = 0;
#endif
}

void set_learn_led(unsigned char status)
{
	if(status == ON)
	{
		TRISA1 = 0;
		LED = ON;
	}
	else
	{
		LED = OFF;
		TRISA1 = 1;
	}
}

volatile unsigned char motor_flag;
volatile unsigned char sensor_flag;
volatile unsigned char dir;
#define UP 0
#define DOWN 1

void setup(void)
{
	if(RC1 == 1)
		motor_flag = 1;
	else
		motor_flag = 0;

	if(RC0 == 1)
		sensor_flag = 1;
	else
		sensor_flag = 0;	
}

void up(void)
{
	dir = UP;
	if(motor_flag)
	{
		RC4 = 0;
		RC5 = 1;
	}
	else
	{
		RC4 = 1;
		RC5 = 0;
	}
}

void down(void)
{
	dir = DOWN;
	if(motor_flag)
	{
		RC5 = 0;
		RC4 = 1;
	}
	else
	{
		RC4 = 0;
		RC5 = 1;
	}
}

void stop(void)
{
	RC4 = 0;
	RC5 = 0;
}

// Remote Routine
//
// Decrypts and interprets receive codes
// Does Normal Operation and Learn Mode
//
// INPUT:  Buffer contains the received code word
//         
// OUTPUT: S0..S3 and LearnOut 
//--------------------------------------------------------------------
void remote(void)
{
    // a frame was received and is stored in the receive buffer
    // move it to decryption Buffer, and restart receiving again
    char k;

    memcpy(Buffer, RX_Buffer, 13);        // Copy the received data to the work buffer
    RFFull = FALSE;                             // Ready to receive a new frame

    switch(RFtype)                    // Decoding
    {
        case KEELOQ:                    // Standard Keeloq frame detected
            NormalKeyGen();                       // Compute the decryption key 
            Decrypt();                                  // Decrypt the hopping code portion
/*
			switch(Buffer[3]&0xF0)
			{
				case 0x10://S1
					up();
				break;

				case 0x20://S2
					for(k=0;k<3;k++)
					{
						RC4 = ON;
						delay_ms(100);
						RC4 = OFF;
						delay_ms(100);
					}
				break;

				case 0x40://S3
					down();
				break;

				case 0x80: 
					stop();
				break;
			}
*/
        break;

        case AES:                    // AES frame detected
            // AESDecrypt();                // Decrypt AES transmission
        break;

        case XTEA:                    // XTEA fram detected
            // XTEADecrypt();                // Decrypt XTEA transmission
        break;

        default:                        // Use normal Keeloq by default
            NormalKeyGen();                       // Compute the decryption key 
            Decrypt();                                  // Decrypt the hopping code portion    
        break;
    } 

    if(DecCHK() == FALSE)                     // Check if Decription failed
    {
        return;                        // Return to main loop
    }                        

    if(FLearn)                            //If we are in learn Mode
    {
        if(Find()== FALSE)                // could not find the Serial Number in memory
        {
            if(!Insert())                     // look for new space
                return;                         // fail if no memory available
        }
        // ASSERT Ind is pointing to a valid memory location
        IDWrite();                              // write Serial Number in memory
        FHopOK = TRUE;                     // enable updating Hopping Code
        HopUpdate();                        // Write Hoping code in memory
    
        CFlash = 10;                        // request Led flashing to indicate successful learning
        CTFlash = TFLASH;                   // load period timer
        LED_SIG = TRUE;                        // start with Led on
        FLearn = FALSE;                     // terminate successfully Learn
    } // Learn
    else                             // Normal Mode of operation check if trasnmitter is learned
    {        
        if(Find()== FALSE)
        {    
            return; 
        }
        else
        {
            if(!HopCHK())                            // Check Hopping Code integrity; are we within the acceptable window?
            {    
                return;                        //  If hopping code outside of window return to main loop
            }
            if(FSame)                                 // identified same hopping code as last memorized
            {
                if(COut >0)                           // if output is still active
                    COut = TOUT;                // reload timer to keep active
                else
                    return;                         // else discard
            }
            else                                            // hopping code incrementing properly
            {
			switch(Buffer[3]&0xF0)
			{
				case 0x10://S1
					up();
				break;

				case 0x20://S2
					for(k=0;k<3;k++)
					{
						RC4 = ON;
						delay_ms(100);
						RC4 = OFF;
						delay_ms(100);
					}
				break;

				case 0x40://S3
					down();
				break;

				case 0x80: 
					stop();
				break;
			}

                HopUpdate();                           // update memory
                //LED_LEARN = ON;                //Set an Output. Note: thsi can be set according to function code
                //set_learn_led(ON);
				if(((Buffer[7] ^ FCode) & 0xf0) == 0)    // check against learned function code
                    LED_SIG = ON;
                COut = TOUT;                   // Init LED output timer
            } // recognized
        }
    } // normal mode
} // remote


void main(void)
{
	char i;
	init_pic16f636();

    for(i=0; i< 5; i++ )                           // Flash LED to indicate firmware startup
    {
        //set_led(ON);
		LED_SIG = ON;
        delay_ms(200);
        //set_led(OFF);
		LED_SIG = OFF;
        delay_ms(200); 
    }

    // Timing
    TMR1L     = 0x00;                               // Timer 1 is used for Learn and LED
    TMR1H     = 0x00;                
    TMR1IF    = 0;
    T1CON     = 0x11;                               // Turn on timer1 with 1:2 prescaler
    TMR1IE    = 1;                                  //  Enable timer 1 interrupts
 
    init_receiver();                                 // Enable and init the receiver state machine    

    INTCON = 0x60;                                  // Enable PEIE and T0IE
    GIE = 1;          
	
	while(1)
	{
        // Is there an incoming transmission waiting?
        if(RFFull)                   // RF receive buffer contains a message
        {
            LED_SIG = ON;
            remote();                // Get Message and decrypt
            LED_SIG = OFF;
            RFFull = 0;
        }

        // Learn Button Poll: every 64ms
        // Based on Timer1
        if(Continue_Count)
        {
            Continue_Count = 0;        // We perform the Learn button check and the LED check every 64ms.

            if(!LEARN)                        // low -> button pressed
            {
                CLearn++;                // Pressed button counter for timeout
            
                if(CLearn == 128)              // pressing Learn button for more than 10s -> ERASE ALL  128 * 64 ms ~ 10s
                {
                    LED_SIG = OFF;                       // switch off Learn Led
                    while(!LEARN);                 // wait for button release
                    LED_SIG = ON;                           // signal Led on
                    ClearMem();                    // erase all command!
  
                    COut = TOUT;                // single lomg flash pulse time /timer will switch off Led
                    CLearn = 0;                     // reset learn debounce
                    FLearn = FALSE;             // exit learn mode
                }               

                if(CLearn == 4)                //normal Learn button debounce 250ms 
                {
                    FLearn = TRUE;              // enter learn mode comand!
                    CTLearn = TLEARN;           // load timout value
                    LED_SIG = ON;                       // turn Led on
                }
            }
            else  
                CLearn=0;                       // reset counter
        
            if(COut > 0)                         // LED timing...
            {
                COut--;
                if(COut == 0)                 // If counter reaches zero then..
                {
                    LED_SIG = OFF;                      // all LEDS off
					set_learn_led(OFF);
					//LED_LEARN = OFF;
                    //LED_DS1 = OFF;
                    //LED_DS2 = OFF;
                    //LED_DS3 = OFF;
                    //LED_DS4 = OFF;
                }
            }
        
            if(CTLearn > 0)                // Learn Mode timeout after 18s (TLEARN * 72ms)
            {
                CTLearn--;                          // count down
                if(CTLearn == 0)                  // if timed out
                {
                    LED_SIG = OFF;                      // exit Learn mode
                    FLearn = FALSE;
                }
            }

            if(CFlash > 0)                     // Led Flashing 
            {
                CTFlash--;                          // count down
                if(CTFlash == 0)                  // if timed out
                {
                    CTFlash = TFLASH;           // reload timer
                    CFlash--;                       // count one flash
                    LED_SIG = OFF;                      // toggle Led
                    if(CFlash & 1)
                        LED_SIG = ON;        
                }
            }
        } // Continue_Count 
	}
}

//--------------------------------------------------------------------
// Timer 1 interrupt handling
//--------------------------------------------------------------------
void tmr1_isr(void)
{
    TMR1ON= 0;
    TMR1L = 0x00;
    TMR1H = 0x00;    
    TMR1IF = 0;        
    TMR1ON = 1;                // Turn on timer 1 1:4 prescaler
    Continue_Count = 1;    

	setup();

	if(RA3==0)
		up();
	if(RA4==0)
		stop();
	if(RA1==0)
		down();

	if(sensor_flag)
	{
		if((RC2==1)&&(dir==UP))
			stop();
		if((RC3==1)&&(dir==DOWN))
			stop();
	}
	else
	{
		if((RC3==1)&&(dir==UP))
			stop();
		if((RC2==1)&&(dir==DOWN))
			stop();
	}	
} 

//--------------------------------------------------------------------
// Interrupt Handling Routine
// This demo program uses three sources of interrupts
//  TMR0- interrupts every 60us to poll the incoming data line
//  SSP - interrupts whenever a request is made by the I2C master
//  TMR1- interrupts every 131ms to keep track of LED timing.
//--------------------------------------------------------------------
static void interrupt
Interrupt(void)
{
    if(T0IF)              //  TMR0 interrupt for data packet aquisition
        rxi();
    if(TMR1IF)            //  TMR1 interrupt for general timing 
        tmr1_isr();
}