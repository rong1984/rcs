/*“© 2009  Microchip Technology Inc.  
Microchip licenses this software to you solely for use with Microchip products.  The software is owned by Microchip and its licensors, and 
is protected under applicable copyright laws.  All rights reserved. SOFTWARE IS PROVIDED “AS IS.”  MICROCHIP EXPRESSLY DISCLAIMS 
ANY WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.  IN NO EVENT SHALL MICROCHIP BE LIABLE FOR 
ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, 
COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS BY THIRD PARTIES (INCLUDING BUT NOT 
LIMITED TO ANY DEFENSE THEREOF), ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.To the fullest extent 
allowed by law, Microchip and its licensors liability shall not exceed the amount of fees, if any, that you have paid directly to Microchip to 
use this software.
MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE TERMS.”
*/
//
//**********************************************************************
//  Filename:   lcd.c
//*********************************************************************
//  Company:    Microchip Technology
//  Revision:   Rev 1.00
//  Date:       
//
//  Source code file for Keeloq 3 Development Board
// LCD interface routine
//
//  Compiled using HiTech PIC C compiler V9.60 std
//********************************************************************

#include	<pic.h>
#include	"lcd.h"
#include	"delay.h"
 
//LCD pin definitions
static bit LCD_RS	@ ((unsigned)&PORTA*8+6);	// Register select
static bit LCD_RW	@ ((unsigned)&PORTA*8+7);	// Read/Write
static bit LCD_EN	@ ((unsigned)&PORTA*8+5);	// Enable

#define	LCD_STROBE	((LCD_EN = 1) , (LCD_EN=0))


//************************************************************************
//LCD Routines follow
//***********************************************************************

/* write a byte to the LCD in 4 bit mode */
void lcd_write(unsigned char c)
{
	PORTA = (PORTA & 0xF0) |  (c >> 4); 	// Send upper nibble first
	LCD_STROBE;
	PORTA = (PORTA & 0xF0) |  (0x0F & c); 	// Send lower nibble second
	LCD_STROBE;
	DelayUs(40);
}

unsigned char lcd_read_inst(void)
{
	unsigned char data = 0;
	TRISA |= 0x0F; 				/* Switch LCD data lines to inputs */
	LCD_RS = 0;
	LCD_RW = 1;	
	data = (PORTA & 0x0F); /* Save nibble */
	LCD_STROBE;
	data |= (PORTA & 0x0F) << 4; /* Save nibble */
	LCD_RW = 0;
	LCD_RS = 1;
	TRISA &= 0xF0;	/* Switch LCD data lines to outputs */
	return data;
}	

unsigned char lcd_busy(void)
{
	unsigned char data = lcd_read_inst();
	if (data & 0x80) return 0x01;
	else return 0x00;	
}

/* Clear and home the LCD */
void lcd_clear(void)
{
	LCD_RS = 0;
	lcd_write(0x1);
	DelayMs(40);					// Was 2 with 4MHz clock
}

/* write a string of chars to the LCD */
void lcd_puts(const char * s)
{
	LCD_RS = 1;			// Write characters
	while(*s)
		lcd_write(*s++);
}

/* write a string of chars to the LCD line 1 */
void lcd_puts1(const char * s)
{
	lcd_line1();
	LCD_RS = 1;			// Write characters
	while(*s)
		lcd_write(*s++);
}

/* writ ea string of chars to the LCD line 2 */
void lcd_puts2(const char * s)
{
	lcd_line2();
	LCD_RS = 1;			// Write characters
	while(*s)
		lcd_write(*s++);
}

/* write one character to the LCD */
void lcd_putch(char c)
{	
	LCD_RS = 1;	// write characters
	lcd_write(c);
	DelayUs(40);
}

/* Go to the specified position */
void lcd_goto(unsigned char pos)
{
	LCD_RS = 0;
	lcd_write(0x80+pos);
}

/* Point to line 1 of LCD */
void lcd_line1 (void)
{
	LCD_RS = 0;
	lcd_write(0x80);
	DelayUs(40);
}

/* Point to line 2 of LCD */
void lcd_line2 (void)
{
	LCD_RS = 0;
	lcd_write(0xC0);
	DelayUs(40);
}

/* initialise the LCD - put into 4 bit mode */
void lcd_init(void)
{
	char i;

	for(i=0;i<2;i++)
	{
	TRISA &= 0x10;		// Clear LCD tris bits RA0:3,5:7
	PORTA = 0;
	LCD_RW = 0;
	DelayMs(50);		// delay after power up
	LCD_RS = 0;			// Write control bytes
	DelayMs(50);		// delay after power up

	lcd_clear();

	PORTA=0x02;			// function set
	LCD_STROBE;
	DelayUs(50);
	PORTA=0x08;			// display mode set
	LCD_STROBE;			
	DelayUs(50);

	PORTA=0x00;			// display on control
	LCD_STROBE;
	PORTA=0x08;			// display off,cursor off,blink off
	LCD_STROBE;
	DelayUs(50);

	PORTA=0x00;			// display on control
	LCD_STROBE;
	PORTA=0x0C;			// display on,cursor off,blink off
	LCD_STROBE;
	DelayUs(50);

	PORTA=0x00;
	LCD_STROBE;
	PORTA=0x01;
	LCD_STROBE;

	DelayMs(2);

	PORTA=0x00;
	LCD_STROBE;
	PORTA=0x06;
	DelayUs(50);
	}
}

/* Display an unsigned long value as ASCII */
void lcd_put_long(unsigned long s)
{
	char i = 0;
	char t = 0;
	for (i = 0; i < 8; i++)
	{
		t = (0xF0000000 & s) >> 28; /* Get first nibble */
		
		/* Convert nibble to ASCII value */
		if (t > 0x9) 
			t = t + 0x37;
		else 
			t = t + 0x30;
		
		/* Send character to LCD */
		lcd_putch(t);
		
		/* Shift long over for next iteration */
		s = s << 4;
	}
}	

/* Display an unsigned long value as ASCII */
void lcd_put_char(unsigned char c)
{
	char i = 0;
	char t = 0;
	for (i = 0; i < 2; i++)
	{
		t = (0xF0 & c) >> 4; /* Get first nibble */
		
		/* Convert nibble to ASCII value */
		if (t > 0x9) 
			t = t + 0x37;
		else 
			t = t + 0x30;
		
		/* Send character to LCD */
		lcd_putch(t);
		
		/* Shift long over for next iteration */
		c = c << 4;
	}
}	

void LCDHex8out(int dat8)
{
  lcd_put_char(dat8);
}

void LCDHex16out(long odat)
{
  LCDHex8out(odat >>8);		// Send out the High Byte
  LCDHex8out((int)odat);  	// Send out the Low Byte
}

//*****************************************************************************
// END OF FILE : LCD.C
//*****************************************************************************

