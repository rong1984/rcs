///*“© 2009  Microchip Technology Inc.  
//Microchip licenses this software to you solely for use with Microchip products.  The software is owned by Microchip and its licensors, and 
//is protected under applicable copyright laws.  All rights reserved. SOFTWARE IS PROVIDED “AS IS.? MICROCHIP EXPRESSLY DISCLAIMS 
//ANY WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
//MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.  IN NO EVENT SHALL MICROCHIP BE LIABLE FOR 
//ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, 
//COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS BY THIRD PARTIES (INCLUDING BUT NOT 
//LIMITED TO ANY DEFENSE THEREOF), ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.To the fullest extent 
//allowed by law, Microchip and its licensors liability shall not exceed the amount of fees, if any, that you have paid directly to Microchip to 
//use this software.
//MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE TERMS.?//
//**********************************************************************
//  Filename:   i2c.c
//*********************************************************************
//  Company:    Microchip Technology
//  Revision:   Rev 1.00
//  Date:       
//
// Source file for 
// I2C interface functions
//
//  Compiled using HiTech PIC C compiler V9.60 std
//********************************************************************


 #include <pic.h>
 #include <string.h>
 #include "i2c.h"

/* Pointer to the transmit data */
bank1 unsigned char *i2c_xmt_ptr;
bank1 unsigned char *i2c_rcv_ptr;

 bank1 char 			i2c_rcv_avail;              /* Flag if receive data is available */
 bank1 unsigned char 	i2c_rcv_size;      		/* Size of received data */
 bank1 unsigned char 	i2c_xmt_size;      		/* Size of data to transmit */
 bank1 unsigned char 	i2c_errors;        		/* Error count */
 bank1 unsigned char 	app_seq_errors;    	 	/* Error that app is out of sequence with i2c */
 bank1 unsigned char 	i2c_illegal_sspcon;		/* Save the illegal SSPcon */

extern bank1 unsigned char i2c_rcv_buf[I2C_RCV_PKT_SIZE+1];
extern bank1 unsigned char i2c_xmt_buf[I2C_XMT_PKT_SIZE+1];

/****************************************************************************/
/* I2C Initialization Routine ***********************************************/
/****************************************************************************/

void i2c_init(void)
{
   unsigned char val;
   char j;

   // Set I2C pins as inputs so SSP can control the pins 
   TRISC4=1;           // SDA
   TRISC3=1;		   // SCL

   SSPADD= K3_ADDRESS;  	// Set the address to respond to 

   SSPSTAT=0x00; 		// Clear all status bits 

   SSPCON=0x39;			//Work around per errata sheet PIC16F690

   SSPCON=0x36;			// Initialize SSP for 7 bit slave with start and stop interrupts disabled, clock hold disabled

   i2c_xmt_size=0;   		// Reset the state info
   i2c_rcv_size=0;
   i2c_rcv_avail=1;

   i2c_errors=0;     			// Reset error count and state 
   i2c_illegal_sspcon=0;   

   SSPIF=0;				// Enable the interrupts 
   SSPIE=1;   
}

//===========================================================================
// WriteI2C
//  Write data to be sent through I2C buffer
//===========================================================================
void i2c_write_data( char data )
{
	while( BF );			// Wait until buffer not full
	
	do
	{
		WCOL=0;		// Clear the WCOL flag.
		SSPBUF = data;	// Write the byte in WREG
	} 
	while( WCOL);
	CKP = 1;				// Release the clock.
}



//*************************************************************************************
//*SSP_ISR *****************************************************************************
//*************************************************************************************

void ssp_isr(void)
{
    unsigned char val;
    unsigned char my_sspstat;           // Copy of My SSPSTAT 

    SSPIF=0;                     			// Reset the interrupt flag, we'll handle it 

// ********************************************************
//     * Code from AN734
//     *
//     * The I2C code below checks for 5 states:
//     * ---------------------------------------------------------------------
//     * State 1: I2C write operation, last byte was an address byte.
//     * SSPSTAT bits: S = 1, D_A = 0, R_W = 0, BF = 1
//     *
//     * State 2: I2C write operation, last byte was a data byte.
//     * SSPSTAT bits: S = 1, D_A = 1, R_W = 0, BF = 1
//     *
//     * State 3: I2C read operation, last byte was an address byte.
//     * SSPSTAT bits: S = 1, D_A = 0, R_W = 1, BF = 0
//     *
//     * State 4: I2C read operation, last byte was a data byte.
//     * SSPSTAT bits: S = 1, D_A = 1, R_W = 1, BF = 0
//     *
//     * State 5: Slave I2C logic reset by NACK from master.
//     * SSPSTAT bits: S = 1, D_A = 1, R_W = 0, BF = 0
// *********************************************************

  
	if ( SSPOV ) 					// If we've got an overflow, flag the problem and reset 
	{
		i2c_errors++;
		SSPOV=0;
	}

	if ( WCOL ) 					// If we've got a write collision, flag and reset 
	{
		i2c_errors++;
		WCOL=0;
	}	
	



  switch( SSPSTAT & 0b00101101 )    //  Get a copy of SSPSTAT and mask out the unimportant bits 

  {  

  	// STATE 1 **************************************
    	// Check for State 1:  MASTER WRITE: Last byte was address 
     	// Write operation, last byte was an address, buffer is full. 
	// ********************************************
 	 case 0x09:   					// Master Write: last byte was address
        							// Yes, we're In state 1 - reset the receive buffer 
        i2c_rcv_size=0;                         // Clear the receive side 
        i2c_rcv_ptr = &i2c_rcv_buf[0];   // Initialize the receive pointer 
        val = SSPBUF;                          // Flush the address out of the SSPBUF 
 	return;

  	// STATE 2 **************************************
    	// Check for State 2:  Master Write: last byte was data
     	// Write operation, last byte was data, buffer is full. 
	// ********************************************
       case 0x29:   							//       							 
        val = SSPBUF;                   				// Yes, we're in state 2 - Read data out of the SSPBUF
        
        if ( i2c_rcv_size <  I2C_RCV_PKT_SIZE ) 	// If we have room in the buffer, store the data 
		{
            	*i2c_rcv_ptr++ = val;         			// Read the new data and store it into the buffer 				  					 
            	if ( ++i2c_rcv_size >=  I2C_RCV_PKT_SIZE )	// One more byte done.  If we're full, report reception 
                	i2c_rcv_avail = 1;             				// Full, report reception 
        	} 
    	 return;

  	// STATE 3 **************************************
    	// Check for State 3:  Master Read: last byte was address
     	// Read operation, last byte was an address, buffer is full. 
	// ********************************************
      case (0x0D):   					// Master Read: last byte was address		     
		val = SSPBUF;    				// Yes, we're in state 3 - Read data out of the SSPBUF
        	WCOL=0;
	 	i2c_xmt_size=0;				// Reset Data pointer
         	i2c_write_data( i2c_xmt_buf[ i2c_xmt_size ] );	// Send first data point
        	/* One less byte available */
        	i2c_xmt_size=1;				// Increment data pointer
	return;

  	// STATE 4 **************************************
    	// Check for State 4:  Master Read: last byte was data
     	// Read operation, last byte was datas, buffer is empty. 
	// ********************************************
      case (0x2C):   							// Master Read: last byte was data
            	WCOL=0;
         	i2c_write_data( i2c_xmt_buf[ i2c_xmt_size ] ); 	// Send next data point
	    	i2c_xmt_size += 1;							// Increment data pointer
	return;

  	// STATE 5 **************************************
    	// Check for State 5:  Master NACK received, end of read request
     	// Buffer is empty. 
	// ********************************************
      case (0x28):   // Master NACK: end of read request
        NOP();
    	return;

	// DEFAULT ***************************************
	//  SSPSTAT is in an illegal state
	//  Log illegal condition
	// **********************************************
	default:
	
	i2c_illegal_sspcon = my_sspstat;		// Illegal state; log 
    	NOP();
	return;

  }
 CKP = 1;			// Release Clock
}
