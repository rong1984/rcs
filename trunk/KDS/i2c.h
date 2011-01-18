//*************************************************************************
///*“© 2009  Microchip Technology Inc.  
//Microchip licenses this software to you solely for use with Microchip products.  The software is owned by Microchip and its licensors, and 
//is protected under applicable copyright laws.  All rights reserved. SOFTWARE IS PROVIDED “AS IS.”  MICROCHIP EXPRESSLY DISCLAIMS 
//ANY WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
//MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.  IN NO EVENT SHALL MICROCHIP BE LIABLE FOR 
//ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, 
//COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS BY THIRD PARTIES (INCLUDING BUT NOT 
//LIMITED TO ANY DEFENSE THEREOF), ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.To the fullest extent 
//allowed by law, Microchip and its licensors liability shall not exceed the amount of fees, if any, that you have paid directly to Microchip to 
//use this software.
//MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE TERMS.”
//**************************************************************************
//
//**********************************************************************
//  Filename:   i2c.h
//*********************************************************************
//  Company:    Microchip Technology
//  Revision:   Rev 1.00
//  Date:       
//
//  Header file for Keeloq 3 Development Board
// I2C interface definitions
//
//  Compiled using HiTech PIC C compiler V9.60 std
//********************************************************************

// Definitions for I2C //

//Function Prototypes ***********************
void i2c_init(void);  							//I2C Initialization Routine 
char i2c_read(void *buf, unsigned char size);     	// Read a packet from the I2c interface  	
void i2c_write_data( char data );				// Write a packet to the I2C interface 
void ssp_isr(void);							// I2C servicing routine

// Receiver board address: Slave **************
#define K3_ADDRESS        		0x30				//*Address chosen arbitrarily

// define the packet sizes ********************
#define I2C_XMT_PKT_SIZE        	9					
#define I2C_RCV_PKT_SIZE       	5

// Controls for the interrupt enable **************
#define I2C_EI()        			SSPIE=1         	// Enable interrupts 
#define I2C_DI()        			SSPIE=0         	// Disable interrupts 
#define I2C_INT_IS_ENABLED()    SSPIE  			// Tell if the interrupt is enabled 
#define I2C_RELEASE_CLK()        (CKP=1)			// Release the clock on the I2C module after loading transmit data into SSPBUF 








