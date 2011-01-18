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
//  Filename:   KeeLoq_HW.H
//*********************************************************************
//  Company:    Microchip Technology
//  Revision:   Rev 1.00
//  Date:       
//
//  Header file for Keeloq 3 Development Board
//  Pin Definitions
//
//  Compiled using HiTech PIC C compiler V9.60 std
//********************************************************************

static bit RFIn		    	@ ((unsigned)&PORTA*8+4);	// Input from Radio Receiver 

static bit SCL_IN			@ ((unsigned)&PORTC*8+3);	// I2C Clock
static bit SDA_OUT		@ ((unsigned)&PORTC*8+4);	// I2C Data	

// LEDs
static bit LED_DS1		@ ((unsigned)&PORTC*8+1);     // LED D1
static bit LED_DS2		@ ((unsigned)&PORTC*8+0);     // LED D2
static bit LED_DS3		@ ((unsigned)&PORTC*8+2);	// LED D3
static bit LED_DS4		@ ((unsigned)&PORTB*8+4);	// LED D4
static bit	Led			@ ((unsigned)&PORTB*8+4);    //  LED DS4 

// Buttons
static bit 	Learn		@ ((unsigned)&PORTB*8+1);	// This is PB3
static bit	Button_2        @ ((unsigned)&PORTB*8+2);	// This is PB1
static bit	Button_3		@((unsigned)&PORTB*8+3);	// This is PB2

//**********************************************************************
//  End of File : KeeLoq_HW.H
//*********************************************************************
