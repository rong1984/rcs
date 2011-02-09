#include "htc.h"
#include "eusart.h"

void putch(unsigned char byte)
{
    while(TXIF == 0);       // spin until done transmitting
    TXREG = byte;
}

/* Display an unsigned char value as ASCII */
void put_byte(unsigned char c)
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
		
		/* Send character */
		putch(t);
		
		/* Shift long over for next iteration */
		c = c << 4;
	}
}

void init_eusart(void)
{
	SPBRG = (BAUDRG&0xFF);
#ifdef USE_BRG16
	BAUDCTL = 0;
	BRG16 = 1;
	SPBRGH = (BAUDRG>>8);
#endif
	TXSTA = 0b00100100;
	RCSTA = 0b10010000;
}