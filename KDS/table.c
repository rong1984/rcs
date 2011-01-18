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
//*********************************************************************
//  Filename:   TABLE.c
//*********************************************************************
//  Author:     Vivien Delport & Lucio DiJasio
//  Company:    Microchip Technology
//  Revision:   Rev 2.00
//  Date:       08/07/00
//
//  EEPROM TABLE Management routines
//     simple "linear list" management method
// 
//  Compiled using HiTech C compiler V9.60 std
//********************************************************************/
#include "htc.h"
#include "Global.h"

#define MAX_USER     	8         // max number of TX that can be learned
#define EL_SIZE      	8         // single record size in bytes

//--------------------------------------------------------------------
// External Variable Definitions
//--------------------------------------------------------------------
extern bit FHopOK;     			// Hopping code verified OK
extern bit FLearn;     			// Learn mode active
extern unsigned char 	FCode;     	// Function codes and upper nibble of serial number

bank1 extern unsigned int Dato;      		// temp storage for read and write to mem.
bank1 extern unsigned int Ind;       		// address pointer to record in mem.
bank1 extern unsigned int Hop;       		// hopping code sync counter
bank1 extern unsigned int EHop;      	// last value of sync counter (from EEPROM)
bank1 extern unsigned int ETemp;		// second copy of sync counter

/*------------------------------------------------------------
; Table structure definition:
;
;  the EEPROM is filled with an array of MAX_USER user records
;  starting at address 0000
;  each record is EL_SIZE byte large and contains the following fields:
;  EEPROM access is in 16 bit words for efficiency
;
;   DatoHi  DatoLo  offset
;  +-------+--------+
;  | FCode | IDLo  |  0    XF contains the function codes (buttons) used during learning
;  +-------+--------+       and the top 4 bit of Serial Number
;  | IDHi  | IDMi    |  +2   IDHi IDMi IDLo contain the 24 lsb of the Serial Number 
;  +-------+--------+
;  | HopHi | HopLo |  +4   sync counter 
;  +-------+-------+
;  | HopHi2| HopLo2|  +6   second copy of sync counter for integrity checking
;  +-------+-------+
;
; NOTE a function code of 0f0 (seed transmission) is considered
; invalid during learning and is used here to a mark location free
;
;------------------------------------------------------------*/
#define     HopLo   Buffer[0] 	//sync counter
#define     HopHi   	Buffer[1] 	//
#define     DisLo   	Buffer[2] 	//discrimination bits LSB
#define     DOK     	Buffer[3] 	//Disc. MSB + Ovf + Key
#define     IDLo    	Buffer[4] 	//S/N LSB
#define     IDMi    	Buffer[5] 	//S/N 
#define     IDHi    	Buffer[6] 	//S/N MSB

//--------------------------------------------------------------------
// EERead ()
//--------------------------------------------------------------------
unsigned char EERead(unsigned char EE_Adress)
{
	unsigned char EE_Data;
	EEPGD = 0;
	EEADR = EE_Adress;
	RD	= 1;
	EE_Data = EEDAT;	
	return EE_Data;
}

//--------------------------------------------------------------------
// EEWrite ()
//--------------------------------------------------------------------
unsigned char EEWrite(unsigned char EE_Adress, unsigned char EE_Data)
{
	EEPGD = 0;			// Set to write EEPROM area
	EEDAT = EE_Data;		// Load Data
	EEADR = EE_Adress;	// Load Address
	
	GIE	= 0;				// Turn-off Global Interrupts
	GIE = 0;
	WREN = 1;			// Enable writes
	EECON2 = 0x55;		// Sequence necessary to unlock EEPROM
	EECON2 = 0xAA;
	WR = 1;				// Start to write

	while(WR);			// Wait for EEPROM write to complete
	return TRUE;
}

//--------------------------------------------------------------------
// RDWord ()
//--------------------------------------------------------------------
void RDword(unsigned int Ind)
{
    Dato = EERead(Ind);
    Dato += (unsigned int) EERead( Ind+1) <<8;
}

//--------------------------------------------------------------------
// RDnext ()
//--------------------------------------------------------------------
void RDnext(void)
{
    // Continue reading
    EEADR++;        // NOTE generate no carry
    Dato = ((RD=1), EEDATA);
    EEADR++;
    Dato += ((RD=1), EEDATA)<<8;
}

//--------------------------------------------------------------------
// WRword ()
//--------------------------------------------------------------------
void WRword(unsigned int Ind)
{
    EEWrite( Ind, Dato); 
	GIE = 1; // write and re-enable interrupt
    EEWrite( Ind+1, Dato>>8); 
	GIE = 1; 
}

//--------------------------------------------------------------------
// Find ()
//--------------------------------------------------------------------
//
// Search through the whole table the given a record whose ID match
//
// INPUT:
//   IDHi, IDMi, IDLo,   serial number to search
//
// OUTPUT:
//   Ind                 address of record (if found)
//   EHop                sync counter value
//   ETemp               second copy of sync counter
// RETURN:               TRUE if matching record  found
//--------------------------------------------------------------------
unsigned char Find(void)
{
    unsigned char Found;
    Found = FALSE;      // init to not found

    for (Ind=0; Ind < (EL_SIZE * MAX_USER); Ind+=EL_SIZE)
    {
        RDword( Ind);       // read first Word
        FCode = (Dato>>8);
        
        if ( (FCode & 0xf0) == 0xf0)		// check if there is a function code
            continue;   // empty  

        if (IDLo != (Dato & 0xff))		// ID match?
            continue;   // fails match
        
        RDnext();       				// Read Next Word
        if ( ( (Dato & 0xff) == IDMi) && ( (Dato>>8) == IDHi))
        {
            Found = TRUE;     // match
            break;
        }
    } // for

    if (Found == TRUE)
    { 
        RDnext();               // read HopHi/Lo
        EHop = Dato;
        RDnext();               // read HopHi2/Lo2
        ETemp= Dato;
     }

     return Found;
}

//--------------------------------------------------------------------
// Insert ()
//--------------------------------------------------------------------
//
// Search through the whole table for an empty space
//
// INPUT:
//   IDHi, IDMi, IDLo,   serial number to insert
//
// OUTPUT:
//   Ind                 address of empty record
//
// RETURN:               FALSE if no empty space found
//
//--------------------------------------------------------------------
unsigned char Insert(void)
{
    for (Ind=0; Ind < (EL_SIZE * MAX_USER); Ind+=EL_SIZE)
    {
        RDword(Ind);        // read first Word
        FCode = (Dato>>8);
        // check if 1111xxxx
        if ( (FCode & 0xf0) == 0xf0)
            return TRUE;    // insert point found
    } // for        

    return  FALSE;          // could not find any empty slot
} // Insert

//--------------------------------------------------------------------
// IDWrite()
//--------------------------------------------------------------------
//
//   store IDHi,Mi,Lo + XF at current address Ind
// INPUT:
//   Ind                 point to record + offset 0 
//   IDHi, IDMi, IDLo    Serial Number
//   XF                  function code
// OUTPUT:
//
//--------------------------------------------------------------------
unsigned char IDWrite(void)
{
    if (!FLearn) 
        return FALSE;           // Guard statement: check if Learn ON

    Dato = Buffer[7];
    Dato = (Dato<<8) + IDLo;
    WRword(Ind);                // write first word

    Dato = IDHi;
    Dato = (Dato<<8) + IDMi;
    WRword(Ind+2);              // write second word
    
    return TRUE;
} // IDWrite
          
//--------------------------------------------------------------------
// HopUpdate()
//--------------------------------------------------------------------
// Upate sync counter of user record at current location
// INPUT:
//   Ind     record + offset 0
//   Hop     current sync counter
// OUTPUT:
//   none
//--------------------------------------------------------------------
unsigned char HopUpdate(void)
{
    if (!FHopOK) 
        return FALSE;           // Guard statement: check if Hop update 

    Hop = ((unsigned int)HopHi<<8) + HopLo;
    Dato = Hop;
    WRword(Ind+4);              // write at offset +4
    Dato = Hop;
    WRword(Ind+6);              // back up copy at offset +6
    FHopOK = FALSE;             // for safety disable updating hopping code
    
    return TRUE;
} // HopUpdate

//--------------------------------------------------------------------
// ClearMem()
//--------------------------------------------------------------------
// Mark all records free
// INPUT:
// OUTPUT:
// USES:
//--------------------------------------------------------------------
unsigned char ClearMem(void)
{
//    char i;
    for (Ind=0; Ind < (EL_SIZE * MAX_USER); Ind+=EL_SIZE)
    {
        Dato = 0xffff;
        WRword( Ind);
    }
  return TRUE;
} // ClearMem


//--------------------------------------------------------------------
// End of File : Table.C
//--------------------------------------------------------------------
        
