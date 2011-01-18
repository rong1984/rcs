//
//							 Software License Agreement
//
// The software supplied herewith by Microchip Technology Incorporated 
// (the "Company") for its PICmicro® Microcontroller is intended and 
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
//-------------------------------------------------------------------------
// LEGAL NOTICE
//
//  The information contained in this document is proprietary and 
//  confidential information of Microchip Technology Inc.  Therefore all 
//  parties are required to sign a non-disclosure agreement before 
//  receiving this document.
//-------------------------------------------------------------------------
//
// Compiled using HITECH PIC C compiler V9.60 std
// 
//=========================================================================

#include "string.h"
#include "Global.h"
#include "KeyGen.h"
#include "KeeLoqAlg.h"

//--------------------------------------------------------------------
// External Variable Definitions
//--------------------------------------------------------------------
extern unsigned char  		SEED[];		// Seed value = serial number
extern unsigned int   			NextHop;  	// Resync value for 2 Chance
extern unsigned char 		COut;     		// Output timer

bank1 extern unsigned int  	Hop;     		// Hopping code sync counter
bank1 extern unsigned int  	EHop;     		// Last value of sync counter (from EEPROM)
bank1 extern unsigned int  	ETemp;    	// Second copy of sync counter

//----------------- flags defines ------------------------------------
extern bit 	FHopOK;     	// Hopping code verified OK
extern bit 	FSame;      	// Same code as previous
extern bit 	FLearn;     	// Learn mode active
extern bit	F2Chance;   	// Resync required
extern bit 	NTQ106;

#define		HopLo   	Buffer[0] 		//sync counter
#define		HopHi   	Buffer[1] 		//
#define 		DisLo   	Buffer[2] 		//discrimination bits LSB
#define 		DOK     	Buffer[3] 		//Disc. MSB + Ovf + Key
#define 		IDLo    	Buffer[4] 		//S/N LSB
#define 		IDMi    	Buffer[5] 		//S/N 
#define 		IDHi    	Buffer[6] 		//S/N MSB

//----------------------------------------------------------------------
void LoadManufCode()
{
   DKEY[0]=0xEF;   // DKEY=0123456789ABCDEF
   DKEY[1]=0xCD;
   DKEY[2]=0xAB;
   DKEY[3]=0x89;
   DKEY[4]=0x67;
   DKEY[5]=0x45;
   DKEY[6]=0x23;
   DKEY[7]=0x01;  
}
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//
// Key Generation routine
//
// Normal Learn algorithm
//
// INPUT:  Serial Number (Buffer[4..7])
//         Manufacturer code 
// OUTPUT: DKEY[0..7] computed decryption key      
//
//----------------------------------------------------------------------
void NormalKeyGen()
{
	unsigned char	HOPtemp[4]; 		// HOP temp buffer
	unsigned char	SKEYtemp[4]; 	// Temp decryption key 

        // Check if same Serial Number as last time while output active
        // it was stored in Seed 
        if (( SEED[0] != Buffer[4]) ||
            ( SEED[1] != Buffer[5]) ||
            ( SEED[2] != Buffer[6]) || 
            ( SEED[3] != (Buffer[7] & 0x0f)) ||
            (COut == 0))
        {   //If notthe same then generate key
            memcpy( (unsigned int *) HOPtemp, (unsigned int *) Buffer, 4);    // save hopping code to temp
            memcpy( SEED, &Buffer[4], 4);   	// make seed = Serial Number
            SEED[3] &= 0x0f;                		// mask out function codes       

            // compute LSb of decryption key first
            memcpy( Buffer, SEED, 4);       	// get SEED in
            Buffer[3] |= 0x20;            		// add constant 0x20, 
            LoadManufCode();           
            Decrypt();
            memcpy( SKEYtemp, Buffer, 4);   	// save result for later

            // compute MSb of decryption key 
            memcpy( Buffer, SEED, 4);       	// get SEED in
            Buffer[3] |= 0x60;            		// add constant 0x60, 
            LoadManufCode();
            Decrypt();
            memcpy( &DKEY[4], Buffer, 4);   	// move it into DKEY MSb
            memcpy( DKEY, SKEYtemp, 4);     	// add LSb

            // ready for Decrypt
            memcpy( Buffer, HOPtemp, 4);    	// restore hopping code
        }
        else // same Serial Number as last time...
        {   // just keep on using same Decription Key
        } 
} 

//----------------------------------------------------------------------
//
// Valid Decryption Check
//
// INPUT:  Serial Number (Buffer[4..7])
//         Hopping Code  (Buffer[0..3])
// OUTPUT: TRUE if discrimination bits == lsb Serial Number
//              and decrypted function code == plain text function code 
//----------------------------------------------------------------------
unsigned char DecCHK(void)
{
    
  //  if ( DisLo != IDLo)    	 // compare low 8bit of Serial Number
  //      return FALSE;		// verify discrimination bits


//    if ( ( (Buffer[3] ^ IDMi) & 0x3)!= 0) // compare 9th and 10th bit of SN 
//       return FALSE;

    // verify function code
    if ( ((Buffer[3] ^ Buffer[7]) & 0xf0)!= 0)
        return FALSE;

    return TRUE;
} 

//----------------------------------------------------------------------
//
// Hopping Code Verification
//
// INPUT:  Hopping Code  (Buffer[0..3])
//         and previous value stored in EEPROM EHop
// OUTPUT: TRUE if hopping code is incrementing and inside a safe window (16)
//
//----------------------------------------------------------------------
unsigned char ReqResync(void)
{
    F2Chance= TRUE;         // flag that a second (sequential) transmission 
    NextHop = Hop+1;        // is needed to resynchronize receiver
    return FALSE;           // cannot accept for now
}

//----------------------------------------------------------------------
// HopCHK()
//  Verify hopping code is within the acceptable window
//
//----------------------------------------------------------------------
unsigned char HopCHK(void)
{
    FHopOK = FALSE;             // Hopping Code is not verified yet
    FSame = FALSE;              // Hopping Code is not the same as previous

    // make it a 16 bit signed integer 
    Hop = ((unsigned int)HopHi << 8) + HopLo;   

    if ( F2Chance)
        if ( NextHop == Hop)
        {
            F2Chance = FALSE;       // resync success
            FHopOK = TRUE;       
            return TRUE;
        }
        
    // verify EEPROM integrity
    if ( EHop != ETemp)
        return ReqResync();         // memory corrupted need a resync
    
    // main comparison
    ETemp = Hop - EHop;             // subtract last value from new one

    if ( ETemp < 0)                 // locked region
        return FALSE;               // fail

    else if ( ETemp > 16)           // resync region
        return ReqResync();

    else                            // 0>= ETemp >16 ; open window
    {
        if ( ETemp == 0)            // same code (ETemp == 0)
            FSame = TRUE;           // rise a flag

        FHopOK = TRUE;           
        return TRUE;
    }
} 

//----------------------------------------------------------------------
// End of File : KeyGen.C
//----------------------------------------------------------------------



