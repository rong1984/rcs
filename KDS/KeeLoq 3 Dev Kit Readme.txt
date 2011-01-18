Microchip Technology Inc.
KeeLoq 3 Development Kit
K3_Base_Station firmware document.

 The following files make up the K2_Base_Station project.
 This project currently contains the standard KeeLoq decoding.
 
 Files included in the project are:
 
 Source files:
        main.c			Contains initialization and main operating loop
	keygen.c			Routines to calculate generate keys and transfer information to and from the encrypt/decrypt routine
	KeeLoqAlg.c		Actual decrypt/encrypt routine
	KeeLoq_RX1.c		Receiver routine. Polls the incoming signal from the RF board and fills the buffer with a KeeLoq transmission.
	i2c.c				Slave I2C state machine. 
	table.c			Manages the data stored in EEPROM. Looks for and updates transmitter information in EEPROM.
	lcd.c				LCD control routines
	delay.c			Delay defines

  Headers:
	Global.h
	Keygen.h
	KeeLoqAlg.h
	KeeLoq_HW.h
	KeeLoq_RX.h
	i2c.h
	table.h
	delay.h
	lcd.h
	

    K3_Base_Station.mcp is the project file.
    Project compiled using Hi-Tech C STD V9.60


