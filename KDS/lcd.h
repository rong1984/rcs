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

/*
 *	LCD interface header file
 *	See lcd.c for more info
 */

/* write a byte to the LCD in 4 bit mode */

extern void lcd_write(unsigned char);

/* Clear and home the LCD */

extern void lcd_clear(void);

/* write a string of characters to the LCD */

extern void lcd_puts(const char * s);

/* Go to the specified position */

extern void lcd_goto(unsigned char pos);
	
/* intialize the LCD - call before anything else */

extern void lcd_init(void);

extern void lcd_putch(char);

/*	Set the cursor position */

#define	lcd_cursor(x)	lcd_write(((x)&0x7F)|0x80)

/* Supporting function - reverse byte order */
extern unsigned char flip_byte(unsigned char b);

extern void lcd_line1 (void);
extern void lcd_line2 (void);

extern void lcd_put_long(unsigned long s);
void lcd_put_char(unsigned char c);
extern void lcd_puts1(const char * s);
extern void lcd_puts2(const char * s);
extern unsigned char lcd_busy(void);
extern unsigned char lcd_read_inst(void);
extern void LCDHex8out(int dat8);
extern void LCDHex16out(long dat8);

/* These are some useful codes. Note that some must be used
 * in specific groups. */
 
/* Clear display. RS = 0, RW = 0 */
#define LCD_CLEAR_DISPLAY 	0x01

/* Return home. RS = 0, RW = 0 */
#define LCD_RETURN_HOME		0x02

/* Entry mode 
 * RS = 0, RW = 0
 */
#define LCD_ENTRY_MODE_SET	0x04
#define LCD_LEFT_TO_RIGHT	0x02 /* Cursor moves left-to-right; set I/D bit */
#define LCD_RIGHT_TO_LEFT	0x00 /* Inverse; do not set I/D bit */
#define LCD_SHIFT_DISPLAY	0x01 /* Shift entire display; set SH bit */

/* Display On/Off Control 
 * RS = 0, RW = 0 
 */
#define LCD_DISPLAY_CONTROL	0x08 /* Display control */
#define LCD_DISPLAY_ON 		0x04 /* Display on; set D bit */
#define LCD_DISPLAY_OFF 	0x00 /* Display off; do not set D bit */
#define LCD_CURSOR_ON 		0x02 /* Display cursor; set C bit */
#define LCD_CURSOR_OFF 		0x00 /* Do not display cursor; clear C bit */
#define LCD_CURSOR_BLINK_ON 0x01 /* Blink cursor; set B bit */
#define LCD_CURSOR_BLINK_OFF 0x00 /* Do not blinnk cursor; clear B bit */

/* Function set
 * RS = 0, RW = 0 
 */
#define LCD_FUNCTION_SET 	0x20
#define LCD_8BIT_MODE 		0x10 /* 8-bit comms to MCU; set DL bit */
#define LCD_4BIT_MODE 		0x00 /* 4-bit comms to MCU; clear DL bit */
#define LCD_2LINE_DISPLAY 	0x08 /* 2-line display mode; set N bit */
#define LCD_1LINE_DISPLAY 	0x00 /* 1-line display mode; clear N bit */
#define LCD_5x8_FONT 		0x00 /* 5x8 font pattern; clear F bit */
#define LCD_5x11_FONT 		0x04 /* 5x11 font patter; set F bit */

/* Set CGRAM Address, OR with AC5:0 
 * 0 1 AC5 AC4 AC3 AC2 AC1 AC0 
 * RS = 0, RW = 0
 */
#define LCD_SET_CGRAM_ADDR 	0x40
#define LCD_TOP_LEFT 		0x00
#define LCD_LINE_1			0x00
#define LCD_BOTTOM_LEFT 		0x40
#define LCD_LINE_2			0x40
#define LCD_TOP_RIGHT 		0x0F
#define LCD_BOTTOM_RIGHT 	0x4F

/* Set DDRAM address. OR with AC5:0 
 * 0 1 AC5 AC4 AC3 AC2 AC1 AC0 
 * RS = 0, RW = 0 
 */
#define LCD_SET_DDRAM_ADDR	0x80

/* Some useful characters */
#define LCD_CHAR_ALPHA 0xE0
#define LCD_CHAR_BETA 0xE2
#define LCD_CHAR_MU 0xE4
#define LCD_CHAR_LEFT_ARROW 0x7F
#define LCD_CHAR_RIGHT_ARROW 0x7E
