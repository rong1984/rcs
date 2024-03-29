;*************************************************************************************************
;CODE OWNERSHIP AND DISCLAIMER OF LIABILITY
;
;Microchip Technology Incorporated ("Microchip") retains all ownership and intellectual property rights in the code accompanying 
;this message and in all derivatives hereto.  You may use this code, and any derivatives created by any person or entity by or on 
;your behalf, exclusively with Microchip�s proprietary products.  Your acceptance and/or use of this code constitutes agreement to 
;the terms and conditions of this notice.
;
;CODE ACCOMPANYING THIS MESSAGE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR 
;STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS 
;FOR A PARTICULAR PURPOSE APPLY TO THIS CODE, ITS INTERACTION WITH MICROCHIP�S PRODUCTS, COMBINATION WITH ANY 
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
;
; FUNCTION     	: ENCRYPT ()	      			
;
; DESCRIPTION  	: KEELOQ ENCRYPT ROUTINE
;
;
;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
ENCRYPT0
;LOAD KEY FROM EEPROM INTO KEELOQ ENGINE
	BCF		STATUS,RP0		; SELECT BANK 2
	BSF		STATUS,RP1
	MOVLW	D'3'				; POINT TO KEY4-7
	MOVWF	CRCON
	BSF		STATUS,RP0		; SELECT BANK 1
	BCF		STATUS,RP1
;	MOVLW	A_EE_KEY			; GET OFFSET OF SEED IN EEPROM
;	BTFSC	FLAGS,TX_NUM
;    BTFSC	TX_INDEX,0
;	MOVLW  B_EE_KEY		; OFFSET IF SECOND TRANSMITTER USED
    MOVFW   TX_INDEX
    XORLW   00H
    MOVLW   A_EE_KEY
    BTFSC   STATUS,Z
    GOTO    FIFY7
    MOVFW   TX_INDEX
    XORLW   01H
    MOVLW   B_EE_KEY
    BTFSC   STATUS,Z
    GOTO    FIFY7
    MOVFW   TX_INDEX
    XORLW   02H
    MOVLW   C_EE_KEY
    BTFSC   STATUS,Z
    GOTO    FIFY7
    MOVFW   TX_INDEX
    XORLW   03H
    MOVLW   D_EE_KEY
    BTFSC   STATUS,Z
    GOTO    FIFY7            
FIFY7 
	MOVWF	EEADR
	BSF		STATUS,IRP
	MOVLW	LOW CRDAT3		; OFFSET TO LAST BYTE KEYLOQ BUFFER
	MOVWF	FSR

LOAD_KEY2
	BSF		EECON1,RD		; EE READ
	MOVFW	EEDAT
	MOVWF	INDF				; MOVE KEY TO TRANSMISSION BUFFER
	INCF		EEADR,F			; POINT TO NEXT EE BYTE
	DECF	FSR,F			; POINT TO NEXT TRANS BUFFER

	MOVFW	FSR				; GET POINTER
	SUBLW	LOW CRDAT0		; SUBTRACT MAX REGISTER ADDRESS
	BTFSS	STATUS,C		; IF NOT DONE,
	
	GOTO	LOAD_KEY2		;  LOOP
	BTFSC	STATUS,Z
	GOTO	LOAD_KEY2		;  LOOP

	BCF		STATUS,RP0		; SELECT BANK 2
	BSF		STATUS,RP1
	BTFSS	CRCON,0
	GOTO	$+5
	DECF	CRCON,F			; POINT TO KEY0-3
	BSF		STATUS,RP0		; SELECT BANK 1
	BCF		STATUS,RP1
	GOTO	LOAD_KEY2-2
	BCF		STATUS,IRP		; RESET BANK SELECT
	BCF		STATUS,RP0		; SELECT BANK 2
	BSF		STATUS,RP1
	MOVLW	D'1'				; POINT TO ICR
	MOVWF	CRCON
	MOVLW	D'66'			; OUTER LOOP IS 66 TIMES => 66X8 = 528 TIMES
	MOVWF	CRDAT0

;LOAD DATA TO ENCRYPT FROM RAM INTO KEELOQ ENGINE
	MOVLW	D'0'				; POINT TO CSR0-3
	MOVWF	CRCON
	MOVLW	NSR0			; OFFSET TO FIRST BYTE OF BUFFER
	MOVWF	FSR
	MOVFW	INDF
	MOVWF	CRDAT0
	INCF		FSR,F
	MOVFW	INDF
	MOVWF	CRDAT1
	INCF		FSR,F
	MOVFW	INDF
	MOVWF	CRDAT2
	INCF		FSR,F
	MOVFW	INDF
	MOVWF	CRDAT3

; ENCRYPT
	BSF		CRCON,6			; SELECT ENCRYPTION
	BSF		CRCON,7			; START,
	BTFSC	CRCON,7			; DONE YET?
	GOTO	$-1				; NO, NOT YET

;LOAD DATA FROM KEELOQ ENGINE INTO RAM 
	MOVLW	D'0'			; POINT TO CSR0-3
	MOVWF	CRCON
	MOVLW	NSR0			; OFFSET TO FIRST BYTE OF BUFFER
	MOVWF	FSR
	MOVFW	CRDAT0
	MOVWF	INDF
	INCF		FSR,F
	MOVFW	CRDAT1
	MOVWF	INDF
	INCF		FSR,F
	MOVFW	CRDAT2
	MOVWF	INDF
	INCF		FSR,F
	MOVFW	CRDAT3
	MOVWF	INDF

	BCF	STATUS,RP0			; SELECT BANK 0
	BCF	STATUS,RP1

	RETLW	0H
