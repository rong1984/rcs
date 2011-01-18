//**********************************************************************
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
//
//**********************************************************************
//  Filename:   Ultra Low Power Wakeup routine
//*********************************************************************


unsigned char Find(void);				//Looks for learned transmitter S/N
unsigned char Insert(void);			//Inserts new transmitter info in empty EEPROM space
unsigned char IDWrite(void);			//Saves S/N, function code and hop counter info
unsigned char HopUpdate(void);		// Update sync counter on current transmitter
unsigned char ClearMem(void);			// Erases all transmitters' information



//**********************************************************************
//  End of File : Table.H
//*********************************************************************
