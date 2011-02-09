#ifndef __GLOBAL_H__
#define __GLOBAL_H__

#define TRUE    1
#define FALSE   0
#define ON      1
#define OFF     0

#define RFEN_TRIS	TRISA2

#define LED RA1
#define LED_SIG	RA5
#define LED_LEARN	RA1

#define LEARN	RA2

#define STOP	0x10
#define UP		0x08
#define DOWN	0x02
//#define LEARN	0x04

#define BIT_TEST(x, y) (((x) & (1<<(y))) != 0)
#define BIT_SET(var,bitno) ((var) |= 1UL << (bitno))
#define BIT_CLR(var,bitno) ((var) &= ~(1UL << (bitno)))

extern unsigned char Buffer[];
extern unsigned char DKEY[];

#endif