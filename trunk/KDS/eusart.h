#ifndef __EUSART_H__
#define __EUSART_H__

// For BRG16 mode:
// BAUDRG is calculated as  = Fosc / (4 * Desired Baudrate) - 1
// So, 4MHz / (4 * 19200) - 1 = 51 (approx.)
//#define USE_BRG16
//#define BAUDRG 51           // 19.2Kbps from 4MHz (BRG16 = 1)
//#define BAUDRG 33           // 115.2Kbps from 16MHz (BRG16 = 1)
//#define BAUDRG 33           // 115.2Kbps from 16MHz (BRG16 = 1)
//#define BAUDRG 42           // 115.2Kbps from 19.6608MHz (BRG16 = 1)
//#define BAUDRG 63           // 115.2Kbps from 29.4912MHz (BRG16 = 1)
//#define BAUDRG 68           // 115.2Kbps from 32MHz (BRG16 = 1)
//#define BAUDRG 69           // 115.2Kbps from 8MHz (BRG16 = 1)

// For non-BRG16 mode:
// BAUDRG is calculated as  = Fosc / (16 * Desired Baudrate) - 1
// So, 4MHz / (16 * 19200) - 1 = 12 (approx.)
//#define BAUDRG 12           // 115.2Kbps from 24MHz or 19.2Kbps from 4MHz (BRG16 = 0)
//#define BAUDRG 10           // 115.2Kbps from 19.6608MHz (BRG16 = 0)
#define BAUDRG 51           // 9.6Kbps from 8MHz (BRG16 = 0)

void putch(unsigned char byte);
void put_byte(unsigned char c);
void init_eusart(void);

#endif