#include "htc.h"
#include "eeprom.h"
#include "global.h"
#include "delay.h"

__CONFIG(MCLRDIS & INTIO & WDTDIS & WAKECNT & CP & CPD);

void Init_pic16f636(void)
{
	CMCON0 = 0x07;
	PORTA = 0;
	LED = 0;
	TMR1L = 0;
	TMR1H = 0;
	T1CON = 0x31;
	TRISA = 0x3C;		//TRISA0 = 0 RA0 is output  LED
						//TRISA1 = 0 RA1 is output  ANT
						//TRISA2 = 1 RA2 is input   PB1
						//TRISA3 = 1 RA3 is input   PB4
						//TRISA4 = 1 RA4 is input   PB3
						//TRISA5 = 1 RA5 is input   PB2
    OSCCON = 0x61;      // internal 4 MHZ
	OPTION = 0x46;
	WPUDA = 0x3C;
#ifdef PULLUP
	WDA = 0x3C;
#else
	WDA = 0;
#endif
	IOCA = 0x3C;
	RAIF = 0;
	RAIE = 1;
	GIE = 1;
}

unsigned char syscfg0;
unsigned char syscfg1;
unsigned char button_mask; //BUTTON MASK REGISTER
unsigned char flags;
unsigned char tx_index;

void key_process()
{
	char i,cnt;
	volatile char tmp;

	tmp = PORTA&0x3C;
	delay_ms(20);
	if(tmp != PORTA&0x3C)
		return;

	switch(tmp)
	{
		case PB1:
			tx_index = (tx_index+1)%4;
			eeprom_write(0xFF, tx_index);
			cnt = tx_index+1;
		break;
		case PB2:
			cnt = 2;
		break;
		case PB3:
			cnt = 3;
		break;
		case PB4:
			cnt = 4;
		break;
		default:
			return;
		break;
	}

	for(i=0;i<cnt;i++)
	{
   		LED = ON;
   		delay_ms(200);
   		LED = OFF;
   		delay_ms(200);
	}

}

void main()
{
	char i,cnt;
	volatile char tmp;

	Init_pic16f636();

    for(i=0; i< 5; i++ )                           // Flash LED to indicate firmware startup
    {
        LED = ON;
        delay_ms(200);
        LED = OFF;
        delay_ms(200); 
    }

	syscfg1 = eeprom_read(EE_SYSCFG1);
	syscfg0 = eeprom_read(EE_SYSCFG0);

	tx_index = eeprom_read(0xFF);
	if(tx_index==0xff)
	{
		tx_index = 0;
		eeprom_write(0xFF, tx_index);
	}

//	if(BIT_TEST(syscfg1, RFENSEL))
//		RFEN_TRIS = 0; //RA2 is output
//	else
//		RFEN_TRIS = 1; //RA2 is input

	if(BIT_TEST(syscfg1, INDSEL))
		button_mask = 0x3B;	

	while(1)
	{
		asm("sleep");
	}
}

static void interrupt
isr(void)
{
	volatile unsigned char tmp;

	if(RAIF)
	{
		RAIE = 0;
		key_process();
		RAIF = 0;
		RAIE = 1;
	}
}