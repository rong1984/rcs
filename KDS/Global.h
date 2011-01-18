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
//**********************************************************************
//  Filename:   Global.H
//*********************************************************************
//  Company:    Microchip Technology
//  Revision:   Rev 1.00
//  Date:       
//
//  Global Variables
//
//  Compiled using HiTech PIC C compiler V9.60 std
//********************************************************************

#define TRUE    1
#define FALSE   0
#define ON      1
#define OFF     0

#define S0  5   //  Buffer[3] function codes
#define S1  6   //  Buffer[3] function codes
#define S2  7   //  Buffer[3] function codes
#define S3  4   //  Buffer[3] function codes
#define VFlag  7//  Buffer[8] low battery flag

// -----------------global variables ---------------------------




#define BIT_TEST( x, y) (( (x) & (1<<(y))) != 0)
#define bitset(var,bitno) ((var) |= 1UL < < (bitno))
#define bitclr(var,bitno) ((var) &= ~(1UL < < (bitno)))

extern unsigned char Buffer[];
extern unsigned char DKEY[];

//**********************************************************************
//  End of File : Global.H
//*********************************************************************
