//***********************************************************************
//                             Software License Agreement
//
// The software supplied herewith by Microchip Technology Incorporated 
// (the "Company") for its PICmicro?Microcontroller is intended and 
// supplied to you, the Company’s customer, for use solely and 
// exclusively on Microchip PICmicro Microcontroller products. The 
// software is owned by the Company and/or its supplier, and is 
// protected under applicable copyright laws. All rights are reserved. 
//  Any use in violation of the foregoing restrictions may subject the 
// user to criminal sanctions under applicable laws, as well as to 
// civil liability for the breach of the terms and conditions of this 
// license.
//
// THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES, 
// WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED 
// TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
// PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT, 
// IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR 
// CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
//
//
//*********************************************************************
//  Filename:   Main.c
//*********************************************************************
//  Company:    Microchip Technology
//  Revision:   Rev 1.00
//  Date:       12/12/2008
//
//  KeeLoq Development Kit main loop and supporting routines
//  for PIC16F886
//        

//  Compiled using HiTech C compiler V9.60 std
//********************************************************************/

#include "htc.h"
#include "string.h"
#include "Global.h"
#include "lcd.h"
#include "delay.h"
#include "KeeLoq_HW.h"
#include "KeeLoq_RX.h"
#include "KeyGen.h"
#include "KeeLoqAlg.h"
#include "Table.h"

__CONFIG(CP & CPD & WDTDIS & INTIO & MCLREN & FCMDIS & PWRTDIS & LVPDIS);

//---------------------------------------------------------------------
// I/O definitions for PIC16F886
//
//               +-------- -------+
//  Reset       -|MCLR    O    RB7|-  ICSPDAT
//  LCD4        -|RA0          RB6|-  ICSPCLK
//  LCD5        -|RA1          RB5|-  RF_CLK
//  LCD6        -|RA2          RB4|-  LED4
//  LCD7        -|RA3      PRG/RB3|-  BUT3
//  RF_IN       -|RA4/T0CKI    RB2|-  BUT2
//  LCDE        -|RA5          RB1|-  BUT1
//  Vss         -|Vss      INT/RB0|-  RF_IRQ
//  LCDRW       -|OSCIN        Vdd|-  Vdd 
//  LCDRS       -|OSCOUT       Vss|-  Vss
//  LED1        -|RC0       RX/RC7|-  RF_SDO 
//  LED2        -|RC1       TX/RC6|-  RF_SEL  
//  LED3        -|RC2/CCP1     RC5|-  RF_SDI  
//  SCL         -|RC3/SCL  SDA/RC4|-  SDA   
//               +----------------+
//

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

bit                      Display_Toggle;    // Flag for toggling LCD message
unsigned char            Continue_Count;                

//--------------------------------------------------------------------
// Internal Function Prototypes
//--------------------------------------------------------------------
void     Delay(unsigned int Count);        // Delay function
void     Remote(void);                     // Decodes and determines validity of incoming transmission
void     Init_886(void);                   // General initialization
void     Display_Splash(void);             // KEK3 LCD welcome message
void     Display_Info(void);               // Keeloq info display on LCD
void     Display_Version(void);            // Software Version display        
void     tmr1_isr(void);                   // Timer 1 for general timing    

void main()
{
    char i;
    Init_886();                                    // Initialize device specific registers

    for(i=0; i< 5; i++ )                           // Flash LED to indicate firmware startup
    {
        LED_DS1 = ON;
        Delay(10000);
        LED_DS1 = OFF;
        Delay(10000); 
    }

    lcd_init();                                     // Initialize LCD display
    Delay(10000); 
    Display_Splash();                               // Welcome message  
    Display_Toggle = 0;

    // Timing
    TMR1L     = 0x00;                               // Timer 1 is used for Learn and LED
    TMR1H     = 0x00;                
    TMR1IF    = 0;
    T1CON     = 0x11;                               // Turn on timer1 with 1:2 prescaler
    TMR1IE    = 1;                                  //  Enable timer 1 interrupts
 
    InitReceiver();                                 // Enable and init the receiver state machine    

    INTCON = 0x60;                                  // Enable PEIE and T0IE
    GIE = 1;                                        // Enable Global Interrupts

    // main loop
    while(1)
    {
        // LCD message toggle on Button 3
        if(!Button_3)                // This just toggles the display
        {
            Display_Toggle = !Display_Toggle;
            if(Display_Toggle)
                Display_Version();        // Between the SW  version #
            else
                Display_Splash();        // and the Welcome Message
        }

        // Is there an incoming transmission waiting?
        if(RFFull)                   // RF receive buffer contains a message
        {
            Led = ON;
            Remote();                // Get Message and decrypt
            Led = OFF;
            RFFull = 0;
        }

        // Learn Button Poll: every 64ms
        // Based on Timer1
        if(Continue_Count )
        {
            Continue_Count = 0;        // We perform the Learn button check and the LED check every 64ms.
    
            if(!Learn)                        // low -> button pressed
            {
                CLearn++;                // Pressed button counter for timeout
            
                if(CLearn == 128)              // pressing Learn button for more than 10s -> ERASE ALL  128 * 64 ms ~ 10s
                {
                    Led = OFF;                       // switch off Learn Led
                    while(!Learn);                 // wait for button release
                    Led = ON;                           // signal Led on
                    ClearMem();                    // erase all command!
  
                    COut = TOUT;                // single lomg flash pulse time /timer will switch off Led
                    CLearn = 0;                     // reset learn debounce
                    FLearn = FALSE;             // exit learn mode
                }               

                if(CLearn == 4)                //normal Learn button debounce 250ms 
                {
                    FLearn = TRUE;              // enter learn mode comand!
                    CTLearn = TLEARN;           // load timout value
                    Led = ON;                       // turn Led on
                }
            }
            else  
                CLearn=0;                       // reset counter
        
            if(COut > 0)                         // LED timing...
            {
                COut--;
                if(COut == 0)                 // If counter reaches zero then..
                {
                    Led = OFF;                      // all LEDS off
                    LED_DS1 = OFF;
                    LED_DS2 = OFF;
                    LED_DS3 = OFF;
                    LED_DS4 = OFF;
                }
            }
        
            if(CTLearn > 0)                // Learn Mode timeout after 18s (TLEARN * 72ms)
            {
                CTLearn--;                          // count down
                if(CTLearn == 0)                  // if timed out
                {
                    Led = OFF;                      // exit Learn mode
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
                    Led = OFF;                      // toggle Led
                    if(CFlash & 1)
                        Led = ON;        
                }
            }
        } // Continue_Count 
    } // main while loop
} // main()


// Delay ()
// Quick and dirty delay routine
void Delay(unsigned int Count)
{
    unsigned volatile int i;

    for(i=0;i<Count; i++)
    {
        asm("NOP");
        asm("NOP");
        asm("NOP");
        asm("NOP");
        asm("NOP");
    }
}

//--------------------------------------------------------------------
// Remote ()
//--------------------------------------------------------------------
//
// Remote Routine
//
// Decrypts and interprets receive codes
// Does Normal Operation and Learn Mode
//
// INPUT:  Buffer contains the received code word
//         
// OUTPUT: S0..S3 and LearnOut 
//--------------------------------------------------------------------
void Remote(void)
{
    // a frame was received and is stored in the receive buffer
    // move it to decryption Buffer, and restart receiving again
    char k;

    memcpy(Buffer, RX_Buffer, 13);        // Copy the received data to the work buffer
    RFFull = FALSE;                             // Ready to receive a new frame

    switch(RFtype)                    // Decoding
    {
        case KeeLoq:                    // Standard Keeloq frame detected
            NormalKeyGen();                       // Compute the decryption key 
            Decrypt();                                  // Decrypt the hopping code portion
            lcd_clear();
            lcd_goto(LCD_LINE_1);            
            lcd_puts("KLQ #");                // LCD output Standard Keeloq Serial # 
            for(k=4; k>0; k--)                // Note: The LCD output of the decrypted data is intended
            {                            // for testing and verification purposes, user may want to 
                lcd_put_char(SEED[k-1]);        // remove the LCD result display lines and only show 
            }                            // the decrypted result until the transmission is fully validated.
            DelayUs(200);
            lcd_goto(LCD_LINE_2);
            lcd_puts("Result: ");            // LCD output result
            for (k=4; k>0; k--)
            {
                lcd_put_char(Buffer[k-1]);
            }
            DelayUs(200);
        break;

        case AES:                    // AES frame detected
            // AESDecrypt();                // Decrypt AES transmission
            lcd_clear();
            lcd_goto(LCD_LINE_1);
            lcd_puts("AES# ");                // LCD output KeeLoq/AES Serial #
            for(k=0; k<6; k++)            // Note: The LCD output of the decrypted data is intended
            {                            // for testing and verification purposes, user may want to
                lcd_put_char(Buffer[k-1]);        // remove the LCD result display lines and only show 
            }                            // the decrypted result until the transmission is fully validated.
            DelayUs(200);
            lcd_goto(LCD_LINE_2);            // LCD output KeeLoq/AES decrypted result            
            for(k=6; k<15; k++)
            {
                lcd_put_char(Buffer[k-1]);
            }
            DelayUs(200);
        break;

        case XTEA:                    // XTEA fram detected
            // XTEADecrypt();                // Decrypt XTEA transmission
            lcd_clear();
            lcd_goto(LCD_LINE_1);
            lcd_puts("XTEA# ");            // LCD output KeeLoq/AES Serial #
            for(k=0; k<6; k++)            // Note: The LCD output of the decrypted data is intended
            {                            // for testing and verification purposes, user may want to
                lcd_put_char(Buffer[k-1]);        // remove the LCD result display lines and only show 
            }                            // the decrypted result until the transmission is fully validated.
            DelayUs(200);
            lcd_goto(LCD_LINE_2);            // LCD output KeeLoq/XTEA decrypted result    
            for(k=6; k<10; k++)
            {
                lcd_put_char(Buffer[k-1]);
            }
            DelayUs(200);
        break;

        default:                        // Use normal Keeloq by default
            NormalKeyGen();                       // Compute the decryption key 
            Decrypt();                                  // Decrypt the hopping code portion    
        break;
    } 

    if(DecCHK() == FALSE)                     // Check if Decription failed
    {
        lcd_clear();                    // Display "Invalid Transmitter" message
        lcd_goto(LCD_LINE_1);            // on LCD
        lcd_puts("Not a Valid ");   
        lcd_goto(LCD_LINE_2);
        lcd_puts("Transmitter ");
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
        Led = TRUE;                        // start with Led on
        FLearn = FALSE;                     // terminate successfully Learn
    } // Learn
    else                             // Normal Mode of operation check if trasnmitter is learned
    {        
        if(Find()== FALSE)
        {    
            lcd_clear();                    // Display "Transmitter Not Learned" message
            lcd_goto(LCD_LINE_1);            // on LCD
            lcd_puts("Transmitter Not ");   
            lcd_goto(LCD_LINE_2);
            lcd_puts("    Learned! ");
            return; 
        }
        else
        {
            if(!HopCHK())                            // Check Hopping Code integrity; are we within the acceptable window?
            {    
                lcd_clear();                    // Display "Not Valid Transmitter" message
                lcd_goto(LCD_LINE_1);            // on LCD
                lcd_puts("Not a valid");   
                lcd_goto(LCD_LINE_2);
                lcd_puts("  Transmitter! ");        
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
                HopUpdate();                           // update memory
                LED_DS3 = ON;                //Set an Output. Note: thsi can be set according to function code
                if(((Buffer[7] ^ FCode) & 0xf0) == 0)    // check against learned function code
                    Led = ON;
                COut = TOUT;                   // Init LED output timer
            } // recognized
        }
    } // normal mode
} // remote

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

//--------------------------------------------------------------------
// Initialization for 16F886 K3 dev.board specific
//--------------------------------------------------------------------
void Init_886(void)
{
    OSCCON =0x70;         // 8MHZ
    ANSEL = 0x00;         // all digital I/Os
    ANSELH= 0x00;         // analog inputs off

    // rf chip pins: these pins are for future use for
    // RF transponder applications
    TRISC5=0;                // spi SDI ( RF chip data input)
    TRISC7=1;                // spi SDO ( RF chip data output)
    TRISC6=0;                // spi chip select
    TRISA=0x00;
    TRISA4=1;                // RF input
    TRISB0=1;                // IRQ input
    TRISB5=0;                // clk

    // buttons
    TRISB1=1;                //PB1
    TRISB2=1;                //PB2
    TRISB3=1;                //PB3
    // leds
    TRISC0=0;
    TRISC1=0;
    TRISC2=0;
    TRISB4=0;
    // Enable weak pull-ups on RB3:1 for buttons
    WPUB |= 0x0E;          // 3 buttons
    RBPU = 0;              // globally enable pull-ups

    PORTA=0x10;            // init ports
    PORTB=0x0E;
    PORTC=0x00;

    //---- init port status
    INTCON = 0x60;          // Enable peripheral and t0 int.

    OPTION = 0x0F;          // prescaler assigned to WDT,
                            // TMR0 clock/4, no pull ups
}

//--------------------------------------------------------------------
// LCD display routines
//  These are general LCD messages...
//--------------------------------------------------------------------
void Display_Splash(void)
{
    lcd_clear();
    lcd_goto(LCD_LINE_1);
    lcd_puts("    KeeLoq 3 ");
    DelayUs(200);
    lcd_goto(LCD_LINE_2);
    lcd_puts("Development Kit");
}

void Display_Version(void)
{
    lcd_clear();
    lcd_goto(LCD_LINE_1);
    lcd_puts("  SW Ver. 1.0");
    DelayUs(200);
    lcd_goto(LCD_LINE_2);
    lcd_puts( "Microchip Tech.");
}

void Display_Info(void)
{
    lcd_clear();
    lcd_goto(LCD_LINE_1);
    lcd_puts("SN : ");
    DelayUs(200);
    lcd_goto(LCD_LINE_2);
    lcd_puts("HOP: ");
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
} 

//--------------------------------------------------------------------
// End of File : Main.C
//--------------------------------------------------------------------