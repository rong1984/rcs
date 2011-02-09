//**********************************************************************
//
//							 Software License Agreement
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
//**********************************************************************
//  Filename:   KeeLoq_RX.c
//*********************************************************************
//  Company:    Microchip Technology
//  Revision:   Rev 2.00
//  Date:       
//
//  Interrupt based receive routine
//  Prepared to receive packets from 65bits to 175bits long
//
//  Compiled using HiTech PIC C compiler V9.60 std
//********************************************************************

#include "htc.h"
#include "keeloq_rx.h"


//--------------------------------------------------------------------
// Defines
//--------------------------------------------------------------------

#define DEFAULT_TMR0    0x98	 // This will give a 60us default int rate
	  
#define KNBIT          65             	// Number of bits for Keeloq - 1
#define XNBIT		  100		// Number of bits for XTEA -1 104
#define ANBIT	   	  160	     	// Number of bits for AES - 1 176

#define TRFreset    	0		// State table defines
#define TRFSYNC     	1
#define TRFUNO      	2
#define TRFZERO     	3
#define TRFSYNC0		4

#define HIGH_TO     	-7         	// longest high Te
#define LOW_TO       	7         	// longest low  Te
#define SHORT_HEAD   	25         // shortest Thead accepted 2,7ms
#define LONG_HEAD    	45         // longest Thead accepted 6,2ms

//--------------------------------------------------------------------
// External Variable Definitions
//--------------------------------------------------------------------
bank1 extern unsigned char 	RX_Buffer[];  	// Receive buffer 
extern unsigned char 	RFstate;   	// Receiver state
extern signed   char 		RFcount;		// Timer counter
extern unsigned char 	Bptr;		// Receive buffer pointer
extern unsigned char 	BitCount;		// Received bits counter
extern unsigned int 		XTMR;		// 16 bit extended timer
extern volatile bit     		RFsynch;		// High level detect prior to synch pulse
extern volatile bit 		RFFull;     	// Buffer full
extern volatile bit 		RFBit;		// Sampled RF signal
extern unsigned char		RFtype;		// Determines what type of encrypted signal
									// was received

//--------------------------------------------------------------------
// Interrupt Handler
//--------------------------------------------------------------------
//static void interrupt
void rxi(void)
{
    // this routine gets called every time TMR0 overflows
    	RFBit = RFIn;           			// sampling RF pin verify!!!
	TMR0 = DEFAULT_TMR0;

    	T0IF = 0;
    	XTMR++;                    			 // extended 16 long timer update
    if (RFFull)                 			// avoid overrun
        return;

   switch( RFstate)            			// state machine main switch
    {

    	case TRFUNO:					// Have detected a high level waiting for falling edge

        if ( RFBit == 0)				// Read RF level

        { // falling edge detected  ----+
          //                            		  |
          //   	                    		  +-------      
              
                RFstate = TRFZERO;		// Falling edge detected, go back to state TRFZERO
        }
        else
        { // still high 
            RFcount--;
            if ( RFcount < HIGH_TO)						// Check for timeouot
            {											// If timeout, then check for what type of transmission detected.
		if (BitCount <KNBIT)						// Not a complete transmission so reset state machine
			{
				RFtype = 0;
				RFstate = TRFSYNC;
				Bptr = 0;
			       BitCount = 0;
				break;
			}
		if ((BitCount>=KNBIT) & (BitCount < XNBIT))			// Is this standard Keeloq?
		 	{
				RFtype = KEELOQ;
			}

		if ((BitCount>=XNBIT) & (BitCount < ANBIT))			// Is this XTEA?
			 {
				RFtype = XTEA;
			}
		if (BitCount>=ANBIT)								// Is this AES?
		 	{
				RFtype = AES;
			}

				RFstate = TRFreset;					// Reset State machine for next transmission
				RFFull = 0x01;						// Flag to let the main routine know we have a complete transmission
			
	      }//if RFcount
        }//else
        break;

    case TRFZERO:									// We've detected a low level, look for rising edge
        if ( RFBit)									// Read RF bit.
        { // rising edge detected     	+----
          //                          		|
          //                      		 ----+   

            RFstate= TRFUNO;
            RX_Buffer[Bptr] >>= 1;         					// Rotate 
            if ( RFcount >= 0)
            {
			RX_Buffer[Bptr]+=0x80;     				// Shift in bit
            }
            RFcount = 0;                						// Reset length counter
            
            if ( ( ++BitCount & 7) == 0)
                Bptr++;                 						// Advance one byte
            if (BitCount == (ANBIT+10))					// maximum number of bits
            {
                RFstate = TRFreset;     					// Finished receiving 
                RFFull = 0x1;
		  RFtype = AES;
            }    
        }
        else
        { // still low
            RFcount++;
            if ( RFcount >= LOW_TO)     // too long low
            {											// If timeout, then check for what type of transmission detected.

            RX_Buffer[Bptr] >>= 1;         					// Rotate 
            if ( RFcount >= 0)							//shift in last receive bit
            {
			RX_Buffer[Bptr]+=0x80;     				// Shift in bit
            }

		if (BitCount <KNBIT)						// Not a valid complete transmission so reset state machine
			{
				RFtype = 0;
				RFstate = TRFSYNC;
				Bptr = 0;
			       BitCount = 0;
				break;
			}
		if (BitCount>=KNBIT & BitCount < XNBIT)			// Is this standard Keeloq?
		 	{
				RFtype = KEELOQ;
			}

		if (BitCount>=XNBIT & BitCount < ANBIT)			// Is this AES?
			 {
				RFtype = XTEA;
			}
		if (BitCount>=ANBIT)							// Is this XTEA?
		 	{
				RFtype = AES;
			}

				RFstate = TRFreset;					// Reset State machine for next transmission
				RFFull = 0x01;						// Flag to let the main routine know we have a complete transmission
		}
            }
        
        break;

    case TRFSYNC:										// Expect header before looking for bits
        if ( RFBit)
        { // rising edge detected  	+---+               	    +---..
          //                       		|     |  <-Theader->   |   
          //                           			+------------------+

			if ( ( RFcount < SHORT_HEAD) || ( RFcount >= LONG_HEAD))
            {	
                RFstate = TRFreset;
		  RFcount = 0;
                break;                  		// too short/long, no header
            }
            else
            {
                RFcount =0;             		// restart counter
                RFstate= TRFUNO;		// Header detected, start reading bits
			}
        }
        else
        { // still low
		   RFcount++;
        }
        break;


	case TRFSYNC0:		  		// Wait for high level before looking for synch header
	   if (!RFsynch)      				// High level detected?
          {
            if (RFBit)    				// High level detected reset counters and wait for sync header
		    {
	       RFsynch = 1;
		    }  //RFbit
          } //RFsynch
	    else
          {
            if (!RFBit)   				// low level synch pulse is probably detected
              {
			   RFstate = TRFSYNC;
			   RFsynch = 0;
              }
           }
         break;


    case TRFreset:					// Reset state machine
    default:
        RFstate = TRFSYNC0;        		// reset state machine in all other cases
        RFcount = 0;
        Bptr = 0;
        BitCount = 0;
        RFsynch = 0;
        break;
        
    } // switch
} // rxi 

void init_receiver()
{
    TMR0 = 0;
    T0CS = 0;
    T0IF = 0;
    T0IE = 1;                   			// TMR0 overflow interrupt
    GIE = 1;                    			// enable interrupts
    RFstate = TRFreset;         		// reset state machine in all other cases
    RFFull = 0;                 			// start with buffer empty
    XTMR = 0;                   			// start extended timer
	RFtype = 0;						// Type of incoming data (Keeloq, AES, XTEA)
 }            

//**********************************************************************
//  End of File : KeeLoq_RX.c
//*********************************************************************
        

    
    
