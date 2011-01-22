;*************************************************************************************************
;CODE OWNERSHIP AND DISCLAIMER OF LIABILITY
;
;Microchip Technology Incorporated ("Microchip") retains all ownership and intellectual property rights in the code accompanying 
;this message and in all derivatives hereto.  You may use this code, and any derivatives created by any person or entity by or on 
;your behalf, exclusively with Microchip’s proprietary products.  Your acceptance and/or use of this code constitutes agreement to 
;the terms and conditions of this notice.
;
;CODE ACCOMPANYING THIS MESSAGE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR 
;STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS 
;FOR A PARTICULAR PURPOSE APPLY TO THIS CODE, ITS INTERACTION WITH MICROCHIP’S PRODUCTS, COMBINATION WITH ANY 
;OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
;
;YOU ACKNOWLEDGE AND AGREE THAT, IN NO EVENT, SHALL MICROCHIP BE LIABLE, WHETHER IN CONTRACT, WARRANTY, TORT 
;(INCLUDING NEGLIGENCE OR BREACH OF STATUTORY DUTY), STRICT LIABILITY, INDEMNITY, CONTRIBUTION, OR OTHERWISE, FOR 
;ANY INDIRECT, SPECIAL, PUNITIVE, EXEMPLARY, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, FOR COST OR EXPENSE OF ANY 
;KIND WHATSOEVER RELATED TO THE CODE, HOWSOEVER CAUSED, EVEN IF MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY 
;OR THE DAMAGES ARE FORESEEABLE.  TO THE FULLEST EXTENT ALLOWABLE BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL 
;CLAIMS IN ANY WAY RELATED TO THIS CODE, SHALL NOT EXCEED THE PRICE YOU PAID DIRECTLY TO MICROCHIP SPECIFICALLY TO
;HAVE THIS CODE DEVELOPED.
;
;You agree that you are solely responsible for testing the code and determining its suitability.  Microchip has no obligation to modify, 
;test, certify, or support the code.
;***************************************************************************************************

;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; THIS FILE CONTAINS THE EEPROM MEMORY MAPPING FOR THE HCS ENCODER SOFTWARE
; TO BE USED FOR PIC16F636
; INITIALIZE EEPROM WITH DEFAULT VALUES
;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	ORG	2100H
	DE	0AAH,000H 		; FIRST  COPY OF 16 BIT SYNC COUNT #0 
	DE	0AAH,000H 		; CHECKSUMS OF 16BIT SYNC COUNT #0
	DE	0AAH,000H 		; CHECKSUMS OF 16BIT SYNC COUNT #0 

	ORG	2106H
	DE	00H,00H 			; UPPER NIBBLE OF 20 BIT COUNTER / OVR BITS = 090H
						; CNTR[3:0]    = 0000
						; SD_FLG       = 1
						; VLOWL_FLG    = 0   FOR TRANSMITTER 1
						; TST_FLG[1:0] = 10

	ORG	2108H
	DE	000H,000H 		; FIRST  COPY OF 16 BIT SYNC COUNT #1
	DE	000H,000H 		; CHECKSUMS OF 16BIT SYNC COUNT #1
	DE	000H,000H 		; CHECKSUMS OF 16BIT SYNC COUNT #1
	
	ORG	210EH
	DE	00H,00H 			; UPPER NIBBLE OF 20 BIT COUNTER / OVR BITS = 080H
						; CNTR[3:0]    = 0000
						; SD_FLG       = 0
						; VLOWL_FLG    = 0   FOR TRANSMITTER 2
						; TST_FLG[1:0] = 10

; ***** FIRST TRANSMITTER'S INFORMATION ********************

	ORG	2110H
	DE	001H,023H		; 32 BIT SERIAL NUMBER = 0123456A
	DE	045H,067H

	ORG	2114H
	DE	038H,099H		; 4 BIT SEED CODE + 60 BIT SEED VALUE = 3 + 899AABB-CCDDEEFF
	DE	0AAH,0BBH
	DE	0CCH,0DDH	
	DE	0EEH,0FFH

	ORG	211CH
	DE	B'00010000'		; TRANSMITTER'S CONFIGURATION BYTE #0 
						;  DISC[8:7] = 00
						;  TMOD[1:0] = PWM     => 00
						;  HEADER    = 10 x Te => 1
						;  XSER      = Off     => 0
						;  QUEN      = Enable  => 1 ; disable => 0
						;  STRTSEL   = DISABLE => 0

				
	DE	0EEH			; LOWER 8 BITS OF 10 BIT DISCRIMINATION VALUE = 0x6A


	ORG	211EH
	DE	005H			;MSB75005BBDCB03FFA6
	DE	016H			; 64 BIT ENCRYPTION KEY
	DE	0FBH
	DE	0E9H
	DE	089H
	DE	007H
	DE	042H
	DE	078H			;LSB


; ***** SECOND TRANSMITTER'S INFORMATION *******************
 
	ORG	2126H
	DE	001H,023H		; 32 BIT SERIAL NUMBER = 01234567
	DE	045H,077H

	ORG	212AH
	DE	04FH,011H		; 4 BIT SEED CODE + 60 BIT SEED VALUE = 4 + 0112233-44556677
	DE	022H,033H
	DE	044H,055H
	DE	066H,077H	

	ORG	2132H
	DE	B'00010000'		; TRANSMITTER'S CONFIGURATION BYTE #0
						;  DISC[8:7] = 00 = Upper 2 bits of discrimination value
						;  TMOD[1:0] = PWM  => 00 = Transmission mode
						;  HEADER    = 10 x Te  => 1 = Header length ==> 4xTe
						;  XSER      = OFF     => 0 = Extended serial number used
						;  QUEN      = ENABLE  => 1 = Queue enable
						;  STRTSEL   = DISABLE => 0 = Start bit select
				
	DE	0DDH			; LOWER 8 BITS OF 10 BIT DISCRIMINATION VALUE = 0xDD

	ORG	2134H
	DE	07CH			;MSB
	DE	043H			; 64 BIT ENCRYPTION KEY
	DE	03BH
	DE	0FFH
	DE	013H
	DE	010H
	DE	08CH
	DE	036H			;LSB	

; ***** TRANSMITTER'S CONFIGURATION BYTES *******************

	ORG	213CH
	DE	B'11010000'	; TX0 CONFIGURATION BYTE #1 = 090H
					;  SEED_LM     = DISABLE => 0
					;  SEED_EN     = DISABLE  => 0
					;  SD_TIM[1:0] = 0 sec => 00
					;  BSL [1:0]   = 800us   => 01
					;  GSEL[1:0]   = 51.2ms    => 10

	ORG	213DH	
	DE  0x35  ;00110101
					;  MTX[1:0]  = 1         => 01
					;  INDSEL = DISABLE ==> 0  ;REGWAIT   = DISABLE   => 0
					;  RFENO = RF enable ;SSENSEL   = ENABLE    => 1
					;  TSEL[1:0] = 25.6s     => 11, 0.8s => 00, 3.2s => 01
					;  LEDBL1    = CONT      => 0
					;  LEDOS1    = LONG      => 0

	ORG	213EH
	DE	B'11010000'	; TX1 CONFIGURATION BYTE #1 = 023H
					;  SEED_LM     = DISABLE => 0
					;  SEED_EN     = DISABLE => 0
					;  SD_TIM[1:0] = 0.0 sec => 00
					;  BSL [1:0]   = 200us   => 01  10=400 11=800 00=100
					;  GSEL[1:0]   = 102.4ms    => 11

	ORG	213FH
	DE	B'10000000'	; SYSTEM CONFIGURATION BYTE #0 = 0D8H
					;  WSEL[1:0] = None      => 00
					;  CNTSEL    = 16 BIT    => 0
					;  VLOWL     = ENABLE    => 0
					;  VTRIP     = 3.2V      => 0
					;  PLLSEL    = ASK       => 0
					;  LEDBL0    = ONCE      => 1
					;  LEDOS0    = SHORT     => 0
			

