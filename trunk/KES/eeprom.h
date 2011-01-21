#ifndef	__EEPROM_H__
#define	__EEPROM_H__

//***** EEPROM MEMORY MAP DEFINITIONS **********************

#define EE_CNT0			0x00		// OFFSET FOR TX0'S EEPROM SYNC COUNTER
#define EE_CNT1		    0x08		// OFFSET FOR TX1'S EEPROM SYNC COUNTER
#define EE_VLOWL 	    0x07		// OFFSET FOR VLOW LATCH BYTE

#define A_EE_SER		    0x10		// OFFSET OF TX'S 64 BIT SEED VALUE			* FIRST TRANSMITTER *
#define A_EE_SEED		    0x14		// OFFSET OF TX'S 64 BIT SEED VALUE
#define A_EE_DISC		    0x1C		// OFFSET OF TX'S 16 BIT DISCRIMINATION VALUE
#define A_EE_KEY		    0x1E		// OFFSET OF TX'S 64 BIT ENCRYPTION KEY

#define B_EE_SER	    0x26		// OFFSET OF TX'S 64 BIT SEED VALUE 		* SECOND TRANSMITTER *
#define B_EE_SEED	    0x2A		// OFFSET OF TX'S 64 BIT SEED VALUE
#define B_EE_DISC	    0x32		// OFFSET OF TX'S 16 BIT DISCRIMINATION VALUE
#define B_EE_KEY	    0x34		// OFFSET OF TX'S 64 BIT ENCRYPTION KEY

#define EE_TX0CFG1		    0x3C		// OFFSET OF 16 BIT TRANSMITTER CONFIGURATION WORD
#define EE_SYSCFG1		    0x3D		// OFFSET OF 16 BIT TRANSMITTER CONFIGURATION WORD
#define EE_TX1CFG1		    0x3E		// OFFSET OF 16 BIT TRANSMITTER CONFIGURATION WORD
#define EE_SYSCFG0		    0x3F

unsigned char ee_read(unsigned char eeprom_adress);
unsigned char ee_write(unsigned char eeprom_adress, unsigned char eeprom_data);

#endif