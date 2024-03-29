//**********************************************************************
//
//							 Software License Agreement
//
// The software supplied herewith by Microchip Technology Incorporated 
// (the "Company") for its PICmicro?Microcontroller is intended and 
// supplied to you, the Company�s customer, for use solely and 
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
//  Filename:   KeeLoq_RX.H
//*********************************************************************
//  Author:     Vivien Delport
//  Company:    Microchip Technology
//  Revision:   Rev 1.00
//  Date:       
//
//  Interrupt based receive routine
//
//  Compiled using HiTech PIC C compiler V9.60 std
//********************************************************************
#define RFIn	RA0

void rxi(void);				//TMR0 Interrrupt routine. Receives incoming trasnmission
void init_receiver(void);		// Initalizes receiver routine

//defines
#define	KEELOQ	1
#define	AES		2
#define	XTEA	3

//**********************************************************************
//  End of File : KeeLoq_RX.H
//*********************************************************************
