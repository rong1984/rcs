#ifndef	__GLOBAL_H__
#define	__GLOBAL_H__

#define TRUE    1
#define FALSE   0
#define ON      0
#define OFF     1

#define S0  5   //  Buffer[3] function codes
#define S1  6   //  Buffer[3] function codes
#define S2  7   //  Buffer[3] function codes
#define S3  4   //  Buffer[3] function codes
#define VFlag  7//  Buffer[8] low battery flag

// ****** TRANSMITTER CONFIGURATION BYTE #0 *****************
#define	MSEL0	0	// TRANSMISSION MODULATION SELECT BIT #0
#define	MSEL1	1	// TRANSMISSION MODULATION SELECT BIT #1
#define	HSEL	2	// 4/10 Te HEADER SELECT BIT 
#define	XSER	3	// EXTENDED SERIAL NUMBER ENABLE
#define	QUEN	4	// QUEUING BITS ENABLE OPTION
#define	STRTSEL	5	// START/STOP BIT SELECT BIT
#define	LEDL	6	// BATTERY LOW LED STATE SELECT BIT
#define	LEDH	7	// LED BLINK RATE SELECT BIT

// ****** TRANSMITTER CONFIGURATION BYTE #1 *****************
#define SDLM	0	// LIMITED SEED TRANSMISSIONS (OFF/ON)
#define SDMD	1	// SEED MODE (USER/PRODUCTION)
#define SDTM0	2	// TIME BEFORE SEED TRANSMISSION (LSB)
#define SDTM1	3	// TIME BEFORE SEED TRANSMISSION (MSB)
#define	BSL0	4	// BAUD RATE SELECT BIT (LSB)
#define	BSL1	5	// BAUD RATE SELECT BIT (MSB)
#define	GSEL0	6	// GUARD TIME SELECT BIT #0
#define	GSEL1	7	// GUARD TIME SELECT BIT #1

// ****** SYSTEM CONFIGURATION BYTE #0 **********************
#define	WSEL0	0	// WAKEUP SELECT BIT #0
#define	WSEL1	1	// WAKEUP SELECT BIT #1
#define	CNTSEL	2	// 16/20 BIT COUNTER SELECT BIT
#define	VLOWL	3	// VLOW LATCHED SELECT BIT
#define	VTRIP	4	// VLOW TRIP POINT SELECT BIT
#define	PLLSEL	5	// ASK/FSK PLL SELECTION BIT 

// ****** SYSTEM CONFIGURATION BYTE #1 **********************
#define	MTX0	0	// MINIMUM NUMBER OF CODE WORD (LSB)
#define	MTX1	1	// MINIMUM NUMBER OF CODE WORD (MSB)
#define	INDSEL	2	// INDEPENDENT MODE SELECT BIT 
#define	RFENSEL	3	// RF ENABLE MODE SELECT BIT 
#define	TSEL0	4	// TIMEOUT SELECT BIT #0
#define	TSEL1	5	// TIMEOUT SELECT BIT #1

#define RFEN_TRIS	TRISA2
#define LED RA0

#define PB1	0x04
#define PB2	0x20
#define PB3	0x10
#define PB4	0x08

#define TX0	0
#define TX1	1
#define TX2	2
#define TX3	3

#define BIT_TEST(x, y) (((x) & (1<<(y))) != 0)
#define BIT_SET(var,bitno) ((var) |= 1UL << (bitno))
#define BIT_CLR(var,bitno) ((var) &= ~(1UL << (bitno)))

#endif
//**********************************************************************
//  End of File : Global.H
//*********************************************************************
