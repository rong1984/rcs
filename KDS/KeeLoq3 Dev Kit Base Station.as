opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6738"

opt pagewidth 120

	opt pm

	processor	16F886
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 54 "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 54 "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
	dw 0x3FBF & 0x3F7F & 0x3FF7 & 0x3FFC & 0x3FFF & 0x37FF & 0x3FFF & 0x2FFF ;#
	FNCALL	_main,_Init_886
	FNCALL	_main,_printf
	FNCALL	_main,_Delay
	FNCALL	_main,_lcd_init
	FNCALL	_main,_Display_Splash
	FNCALL	_main,_InitReceiver
	FNCALL	_main,_i2c_init
	FNCALL	_main,_Remote
	FNCALL	_main,_lcd_clear
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_lcd_puts
	FNCALL	_main,_lcd_put_char
	FNCALL	_main,_ClearMem
	FNCALL	_Remote,_memcpy
	FNCALL	_Remote,_NormalKeyGen
	FNCALL	_Remote,_Decrypt
	FNCALL	_Remote,_printf
	FNCALL	_Remote,_put_byte
	FNCALL	_Remote,_lcd_clear
	FNCALL	_Remote,_lcd_goto
	FNCALL	_Remote,_lcd_puts
	FNCALL	_Remote,_lcd_put_char
	FNCALL	_Remote,_DecCHK
	FNCALL	_Remote,_Find
	FNCALL	_Remote,_Insert
	FNCALL	_Remote,_IDWrite
	FNCALL	_Remote,_HopUpdate
	FNCALL	_Remote,_HopCHK
	FNCALL	_HopUpdate,_WRword
	FNCALL	_IDWrite,_WRword
	FNCALL	_Insert,_RDword
	FNCALL	_Find,_RDword
	FNCALL	_Find,_RDnext
	FNCALL	_ClearMem,_WRword
	FNCALL	_lcd_put_char,_lcd_putch
	FNCALL	_Display_Splash,_lcd_clear
	FNCALL	_Display_Splash,_lcd_goto
	FNCALL	_Display_Splash,_lcd_puts
	FNCALL	_lcd_init,_DelayMs
	FNCALL	_lcd_init,_lcd_clear
	FNCALL	_lcd_putch,_lcd_write
	FNCALL	_WRword,_EEWrite
	FNCALL	_RDword,_EERead
	FNCALL	_HopCHK,_ReqResync
	FNCALL	_put_byte,_putch
	FNCALL	_NormalKeyGen,_memcpy
	FNCALL	_NormalKeyGen,_LoadManufCode
	FNCALL	_NormalKeyGen,_Decrypt
	FNCALL	_lcd_puts,_lcd_write
	FNCALL	_lcd_goto,_lcd_write
	FNCALL	_lcd_clear,_lcd_write
	FNCALL	_lcd_clear,_DelayMs
	FNCALL	_printf,_putch
	FNCALL	_Init_886,_init_eusart
	FNROOT	_main
	FNCALL	_Interrupt,_rxi
	FNCALL	_Interrupt,_ssp_isr
	FNCALL	_Interrupt,_tmr1_isr
	FNCALL	_ssp_isr,_i2c_write_data
	FNCALL	intlevel1,_Interrupt
	global	intlevel1
	FNROOT	intlevel1
	global	_Dato
	global	_EHop
	global	_ETemp
	global	_Hop
	global	_Ind
	global	_NextHop
	global	_CFlash
	global	_CLearn
	global	_COut
	global	_CTFlash
	global	_CTLearn
	global	_Continue_Count
	global	_FCode
	global	_RFtype
	global	_aux
	global	_i2c_rcv_avail
	global	_i2c_rcv_ptr
	global	_BitCount
	global	_Bptr
	global	_RFcount
	global	_RFstate
	global	_i2c_rcv_size
	global	_i2c_xmt_size
	global	_Display_Toggle
	global	_F2Chance
	global	_FHopOK
	global	_FLearn
	global	_FSame
	global	_RFBit
	global	_RFFull
	global	_RFsynch
	global	_i2c_xmt_buf
	global	_Buffer
	global	_i2c_rcv_buf
	global	_SEED
	global	_RX_Buffer
	global	_DKEY
	global	_INTCON
psect	text1308,local,class=CODE,delta=2
global __ptext1308
__ptext1308:
_INTCON	set	11
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_RCSTA
_RCSTA	set	24
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_STATUS
_STATUS	set	3
	global	_T1CON
_T1CON	set	16
	global	_TMR0
_TMR0	set	1
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_TXREG
_TXREG	set	25
	global	KeeLoq_HW@RFIn
KeeLoq_HW@RFIn	set	44
	global	_Button_3
_Button_3	set	51
	global	_CKP
_CKP	set	164
	global	_GIE
_GIE	set	95
	global	_LCD_EN
_LCD_EN	set	45
	global	_LCD_RS
_LCD_RS	set	46
	global	_LCD_RW
_LCD_RW	set	47
	global	_LED_DS1
_LED_DS1	set	57
	global	_LED_DS2
_LED_DS2	set	56
	global	_LED_DS3
_LED_DS3	set	58
	global	_LED_DS4
_LED_DS4	set	52
	global	_Learn
_Learn	set	49
	global	_Led
_Led	set	52
	global	_SSPIF
_SSPIF	set	99
	global	_SSPOV
_SSPOV	set	166
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_TXIF
_TXIF	set	100
	global	_WCOL
_WCOL	set	167
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_SPBRG
_SPBRG	set	153
	global	_SSPADD
_SSPADD	set	147
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISA
_TRISA	set	133
	global	_TXSTA
_TXSTA	set	152
	global	_WPUB
_WPUB	set	149
	global	_BF
_BF	set	1184
	global	_RBPU
_RBPU	set	1039
	global	_SSPIE
_SSPIE	set	1123
	global	_T0CS
_T0CS	set	1037
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TRISA4
_TRISA4	set	1068
	global	_TRISB0
_TRISB0	set	1072
	global	_TRISB1
_TRISB1	set	1073
	global	_TRISB2
_TRISB2	set	1074
	global	_TRISB3
_TRISB3	set	1075
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISC2
_TRISC2	set	1082
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_EEADR
_EEADR	set	269
	global	_EEDAT
_EEDAT	set	268
	global	_EEDATA
_EEDATA	set	268
	global	_ANSEL
_ANSEL	set	392
	global	_ANSELH
_ANSELH	set	393
	global	_EECON2
_EECON2	set	397
	global	_EEPGD
_EEPGD	set	3175
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringtab,__stringbase
stringtab:
;	String table - string pointers are 2 bytes each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:
	movf btemp+1,w
andlw 7Fh
movwf	pclath
	movf	fsr,w
incf fsr
skipnz
incf btemp+1
	movwf pc
__stringbase:
psect	stringtext,class=STRCODE,delta=2,reloc=256
global __pstringtext
__pstringtext:
	
STR_13:	
	retlw	84	;'T'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	115	;'s'
	retlw	109	;'m'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	78	;'N'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	76	;'L'
	retlw	101	;'e'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	110	;'n'
	retlw	101	;'e'
	retlw	100	;'d'
	retlw	33	;'!'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_14:	
	retlw	78	;'N'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	97	;'a'
	retlw	32	;' '
	retlw	118	;'v'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	105	;'i'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	115	;'s'
	retlw	109	;'m'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	33	;'!'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_2:	
	retlw	75	;'K'
	retlw	69	;'E'
	retlw	69	;'E'
	retlw	76	;'L'
	retlw	79	;'O'
	retlw	81	;'Q'
	retlw	32	;' '
	retlw	51	;'3'
	retlw	32	;' '
	retlw	68	;'D'
	retlw	69	;'E'
	retlw	86	;'V'
	retlw	69	;'E'
	retlw	76	;'L'
	retlw	79	;'O'
	retlw	80	;'P'
	retlw	77	;'M'
	retlw	69	;'E'
	retlw	78	;'N'
	retlw	84	;'T'
	retlw	32	;' '
	retlw	75	;'K'
	retlw	73	;'I'
	retlw	84	;'T'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_12:	
	retlw	78	;'N'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	97	;'a'
	retlw	32	;' '
	retlw	86	;'V'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	105	;'i'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	115	;'s'
	retlw	109	;'m'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_1:	
	retlw	75	;'K'
	retlw	68	;'D'
	retlw	83	;'S'
	retlw	32	;' '
	retlw	105	;'i'
	retlw	115	;'s'
	retlw	32	;' '
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	116	;'t'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_3:	
	retlw	118	;'v'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	115	;'s'
	retlw	105	;'i'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	32	;' '
	retlw	58	;':'
	retlw	32	;' '
	retlw	49	;'1'
	retlw	46	;'.'
	retlw	48	;'0'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_18:	
	retlw	77	;'M'
	retlw	105	;'i'
	retlw	99	;'c'
	retlw	114	;'r'
	retlw	111	;'o'
	retlw	99	;'c'
	retlw	104	;'h'
	retlw	105	;'i'
	retlw	112	;'p'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	99	;'c'
	retlw	104	;'h'
	retlw	46	;'.'
	retlw	0
psect	stringtext
	
STR_16:	
	retlw	68	;'D'
	retlw	101	;'e'
	retlw	118	;'v'
	retlw	101	;'e'
	retlw	108	;'l'
	retlw	111	;'o'
	retlw	112	;'p'
	retlw	109	;'m'
	retlw	101	;'e'
	retlw	110	;'n'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	75	;'K'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	0
psect	stringtext
	
STR_15:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	75	;'K'
	retlw	101	;'e'
	retlw	101	;'e'
	retlw	76	;'L'
	retlw	111	;'o'
	retlw	113	;'q'
	retlw	32	;' '
	retlw	51	;'3'
	retlw	32	;' '
	retlw	0
psect	stringtext
	
STR_17:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	83	;'S'
	retlw	87	;'W'
	retlw	32	;' '
	retlw	86	;'V'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	46	;'.'
	retlw	32	;' '
	retlw	49	;'1'
	retlw	46	;'.'
	retlw	48	;'0'
	retlw	0
psect	stringtext
	
STR_5:	
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	66	;'B'
	retlw	117	;'u'
	retlw	102	;'f'
	retlw	102	;'f'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	0
psect	stringtext
	
STR_6:	
	retlw	75	;'K'
	retlw	76	;'L'
	retlw	81	;'Q'
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	stringtext
	
STR_8:	
	retlw	82	;'R'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	117	;'u'
	retlw	108	;'l'
	retlw	116	;'t'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	stringtext
	
STR_11:	
	retlw	88	;'X'
	retlw	84	;'T'
	retlw	69	;'E'
	retlw	65	;'A'
	retlw	35	;'#'
	retlw	32	;' '
	retlw	0
psect	stringtext
	
STR_10:	
	retlw	65	;'A'
	retlw	69	;'E'
	retlw	83	;'S'
	retlw	35	;'#'
	retlw	32	;' '
	retlw	0
psect	stringtext
	
STR_19:	
	retlw	83	;'S'
	retlw	78	;'N'
	retlw	32	;' '
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	stringtext
	
STR_20:	
	retlw	72	;'H'
	retlw	79	;'O'
	retlw	80	;'P'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	stringtext
STR_4	equ	STR_2+0
STR_7	equ	STR_13+24
STR_9	equ	STR_13+24
	file	"KeeLoq3 Dev Kit Base Station.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_Display_Toggle:
       ds      1

_F2Chance:
       ds      1

_FHopOK:
       ds      1

_FLearn:
       ds      1

_FSame:
       ds      1

_RFBit:
       ds      1

_RFFull:
       ds      1

_RFsynch:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_BitCount:
       ds      1

_Bptr:
       ds      1

_RFcount:
       ds      1

_RFstate:
       ds      1

_i2c_rcv_size:
       ds      1

_i2c_xmt_size:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_Dato:
       ds      2

_EHop:
       ds      2

_ETemp:
       ds      2

_Hop:
       ds      2

_Ind:
       ds      2

_NextHop:
       ds      2

_CFlash:
       ds      1

_CLearn:
       ds      1

_COut:
       ds      1

_CTFlash:
       ds      1

_CTLearn:
       ds      1

_Continue_Count:
       ds      1

_FCode:
       ds      1

_RFtype:
       ds      1

_aux:
       ds      1

_i2c_rcv_avail:
       ds      1

_i2c_rcv_ptr:
       ds      1

_Buffer:
       ds      22

_i2c_rcv_buf:
       ds      6

_SEED:
       ds      4

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_i2c_xmt_buf:
       ds      10

_RX_Buffer:
       ds      22

_DKEY:
       ds      8

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
	clrf	((__pbssCOMMON)+5)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+037h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+028h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Init_886
?_Init_886:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_Display_Splash
?_Display_Splash:	; 0 bytes @ 0x0
	global	?_InitReceiver
?_InitReceiver:	; 0 bytes @ 0x0
	global	?_i2c_init
?_i2c_init:	; 0 bytes @ 0x0
	global	?_Remote
?_Remote:	; 0 bytes @ 0x0
	global	?_lcd_clear
?_lcd_clear:	; 0 bytes @ 0x0
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x0
	global	?_lcd_put_char
?_lcd_put_char:	; 0 bytes @ 0x0
	global	?_NormalKeyGen
?_NormalKeyGen:	; 0 bytes @ 0x0
	global	?_Decrypt
?_Decrypt:	; 0 bytes @ 0x0
	global	?_put_byte
?_put_byte:	; 0 bytes @ 0x0
	global	?_rxi
?_rxi:	; 0 bytes @ 0x0
	global	??_rxi
??_rxi:	; 0 bytes @ 0x0
	global	?_ssp_isr
?_ssp_isr:	; 0 bytes @ 0x0
	global	?_tmr1_isr
?_tmr1_isr:	; 0 bytes @ 0x0
	global	??_tmr1_isr
??_tmr1_isr:	; 0 bytes @ 0x0
	global	?_init_eusart
?_init_eusart:	; 0 bytes @ 0x0
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_Interrupt
?_Interrupt:	; 0 bytes @ 0x0
	global	?_LoadManufCode
?_LoadManufCode:	; 0 bytes @ 0x0
	global	?_RDnext
?_RDnext:	; 0 bytes @ 0x0
	global	?_lcd_write
?_lcd_write:	; 0 bytes @ 0x0
	global	?_lcd_putch
?_lcd_putch:	; 0 bytes @ 0x0
	global	?_i2c_write_data
?_i2c_write_data:	; 0 bytes @ 0x0
	global	??_i2c_write_data
??_i2c_write_data:	; 0 bytes @ 0x0
	global	?_putch
?_putch:	; 0 bytes @ 0x0
	global	?_ClearMem
?_ClearMem:	; 1 bytes @ 0x0
	global	?_DecCHK
?_DecCHK:	; 1 bytes @ 0x0
	global	?_Find
?_Find:	; 1 bytes @ 0x0
	global	?_Insert
?_Insert:	; 1 bytes @ 0x0
	global	?_IDWrite
?_IDWrite:	; 1 bytes @ 0x0
	global	?_HopUpdate
?_HopUpdate:	; 1 bytes @ 0x0
	global	?_HopCHK
?_HopCHK:	; 1 bytes @ 0x0
	global	?_ReqResync
?_ReqResync:	; 1 bytes @ 0x0
	global	?_EERead
?_EERead:	; 1 bytes @ 0x0
	global	i2c_write_data@data
i2c_write_data@data:	; 1 bytes @ 0x0
	ds	1
	global	??_ssp_isr
??_ssp_isr:	; 0 bytes @ 0x1
	ds	2
	global	ssp_isr@val
ssp_isr@val:	; 1 bytes @ 0x3
	ds	1
	global	??_Interrupt
??_Interrupt:	; 0 bytes @ 0x4
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_Init_886
??_Init_886:	; 0 bytes @ 0x0
	global	?_Delay
?_Delay:	; 0 bytes @ 0x0
	global	??_InitReceiver
??_InitReceiver:	; 0 bytes @ 0x0
	global	??_i2c_init
??_i2c_init:	; 0 bytes @ 0x0
	global	??_Decrypt
??_Decrypt:	; 0 bytes @ 0x0
	global	??_DecCHK
??_DecCHK:	; 0 bytes @ 0x0
	global	??_HopCHK
??_HopCHK:	; 0 bytes @ 0x0
	global	??_init_eusart
??_init_eusart:	; 0 bytes @ 0x0
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x0
	global	??_LoadManufCode
??_LoadManufCode:	; 0 bytes @ 0x0
	global	??_ReqResync
??_ReqResync:	; 0 bytes @ 0x0
	global	??_EERead
??_EERead:	; 0 bytes @ 0x0
	global	??_RDnext
??_RDnext:	; 0 bytes @ 0x0
	global	??_lcd_write
??_lcd_write:	; 0 bytes @ 0x0
	global	??_putch
??_putch:	; 0 bytes @ 0x0
	global	?_memcpy
?_memcpy:	; 1 bytes @ 0x0
	global	?_EEWrite
?_EEWrite:	; 1 bytes @ 0x0
	global	Decrypt@key
Decrypt@key:	; 1 bytes @ 0x0
	global	EERead@EE_Adress
EERead@EE_Adress:	; 1 bytes @ 0x0
	global	EEWrite@EE_Data
EEWrite@EE_Data:	; 1 bytes @ 0x0
	global	DelayMs@cnt
DelayMs@cnt:	; 1 bytes @ 0x0
	global	putch@byte
putch@byte:	; 1 bytes @ 0x0
	global	memcpy@s1
memcpy@s1:	; 1 bytes @ 0x0
	global	Delay@Count
Delay@Count:	; 2 bytes @ 0x0
	global	HopCHK@COUNTCHECK
HopCHK@COUNTCHECK:	; 2 bytes @ 0x0
	ds	1
	global	??_put_byte
??_put_byte:	; 0 bytes @ 0x1
	global	??_EEWrite
??_EEWrite:	; 0 bytes @ 0x1
	global	?_printf
?_printf:	; 2 bytes @ 0x1
	global	Decrypt@keep
Decrypt@keep:	; 1 bytes @ 0x1
	global	EERead@EE_Data
EERead@EE_Data:	; 1 bytes @ 0x1
	global	EEWrite@EE_Adress
EEWrite@EE_Adress:	; 1 bytes @ 0x1
	global	lcd_write@_dcnt
lcd_write@_dcnt:	; 1 bytes @ 0x1
	global	DelayMs@i
DelayMs@i:	; 1 bytes @ 0x1
	global	put_byte@c
put_byte@c:	; 1 bytes @ 0x1
	global	printf@f
printf@f:	; 2 bytes @ 0x1
	global	memcpy@n
memcpy@n:	; 2 bytes @ 0x1
	ds	1
	global	??_Delay
??_Delay:	; 0 bytes @ 0x2
	global	?_RDword
?_RDword:	; 0 bytes @ 0x2
	global	?_WRword
?_WRword:	; 0 bytes @ 0x2
	global	Decrypt@i
Decrypt@i:	; 1 bytes @ 0x2
	global	lcd_write@c
lcd_write@c:	; 1 bytes @ 0x2
	global	DelayMs@_dcnt
DelayMs@_dcnt:	; 1 bytes @ 0x2
	global	put_byte@i
put_byte@i:	; 1 bytes @ 0x2
	global	Delay@i
Delay@i:	; 2 bytes @ 0x2
	global	RDword@Ind
RDword@Ind:	; 2 bytes @ 0x2
	global	WRword@Ind
WRword@Ind:	; 2 bytes @ 0x2
	ds	1
	global	??_printf
??_printf:	; 0 bytes @ 0x3
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x3
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x3
	global	?_lcd_puts
?_lcd_puts:	; 0 bytes @ 0x3
	global	??_memcpy
??_memcpy:	; 0 bytes @ 0x3
	global	??_lcd_putch
??_lcd_putch:	; 0 bytes @ 0x3
	global	Decrypt@j
Decrypt@j:	; 1 bytes @ 0x3
	global	lcd_putch@c
lcd_putch@c:	; 1 bytes @ 0x3
	global	lcd_goto@pos
lcd_goto@pos:	; 1 bytes @ 0x3
	global	lcd_init@_dcnt
lcd_init@_dcnt:	; 1 bytes @ 0x3
	global	put_byte@t
put_byte@t:	; 1 bytes @ 0x3
	global	lcd_puts@s
lcd_puts@s:	; 2 bytes @ 0x3
	ds	1
	global	??_ClearMem
??_ClearMem:	; 0 bytes @ 0x4
	global	??_IDWrite
??_IDWrite:	; 0 bytes @ 0x4
	global	??_HopUpdate
??_HopUpdate:	; 0 bytes @ 0x4
	global	??_RDword
??_RDword:	; 0 bytes @ 0x4
	global	??_WRword
??_WRword:	; 0 bytes @ 0x4
	global	Decrypt@p
Decrypt@p:	; 1 bytes @ 0x4
	global	lcd_putch@_dcnt
lcd_putch@_dcnt:	; 1 bytes @ 0x4
	global	lcd_init@_dcnt_1882
lcd_init@_dcnt_1882:	; 1 bytes @ 0x4
	global	memcpy@d1
memcpy@d1:	; 1 bytes @ 0x4
	ds	1
	global	??_Display_Splash
??_Display_Splash:	; 0 bytes @ 0x5
	global	??_lcd_puts
??_lcd_puts:	; 0 bytes @ 0x5
	global	??_lcd_put_char
??_lcd_put_char:	; 0 bytes @ 0x5
	global	Display_Splash@_dcnt
Display_Splash@_dcnt:	; 1 bytes @ 0x5
	global	lcd_init@_dcnt_1883
lcd_init@_dcnt_1883:	; 1 bytes @ 0x5
	global	lcd_put_char@c
lcd_put_char@c:	; 1 bytes @ 0x5
	global	printf@c
printf@c:	; 1 bytes @ 0x5
	global	memcpy@d
memcpy@d:	; 1 bytes @ 0x5
	ds	1
	global	??_Find
??_Find:	; 0 bytes @ 0x6
	global	??_Insert
??_Insert:	; 0 bytes @ 0x6
	global	Find@Found
Find@Found:	; 1 bytes @ 0x6
	global	lcd_init@_dcnt_1884
lcd_init@_dcnt_1884:	; 1 bytes @ 0x6
	global	lcd_put_char@i
lcd_put_char@i:	; 1 bytes @ 0x6
	global	memcpy@s
memcpy@s:	; 1 bytes @ 0x6
	ds	1
	global	??_NormalKeyGen
??_NormalKeyGen:	; 0 bytes @ 0x7
	global	lcd_init@_dcnt_1885
lcd_init@_dcnt_1885:	; 1 bytes @ 0x7
	global	lcd_put_char@t
lcd_put_char@t:	; 1 bytes @ 0x7
	global	NormalKeyGen@HOPtemp
NormalKeyGen@HOPtemp:	; 4 bytes @ 0x7
	ds	1
	global	lcd_init@i
lcd_init@i:	; 1 bytes @ 0x8
	ds	3
	global	NormalKeyGen@SKEYtemp
NormalKeyGen@SKEYtemp:	; 4 bytes @ 0xB
	ds	4
	global	??_Remote
??_Remote:	; 0 bytes @ 0xF
	ds	2
	global	Remote@_dcnt
Remote@_dcnt:	; 1 bytes @ 0x11
	ds	1
	global	Remote@_dcnt_593
Remote@_dcnt_593:	; 1 bytes @ 0x12
	ds	1
	global	Remote@_dcnt_595
Remote@_dcnt_595:	; 1 bytes @ 0x13
	ds	1
	global	Remote@_dcnt_596
Remote@_dcnt_596:	; 1 bytes @ 0x14
	ds	1
	global	Remote@k
Remote@k:	; 1 bytes @ 0x15
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x16
	global	main@_dcnt
main@_dcnt:	; 1 bytes @ 0x16
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x17
	ds	1
	global	main@j
main@j:	; 1 bytes @ 0x18
	ds	1
;;Data sizes: Strings 260, constant 0, data 0, bss 101, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7      14
;; BANK0           80     25      80
;; BANK1           80      0      40
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_memcpy	PTR void  size(1) Largest target is 22
;;		 -> NormalKeyGen@SKEYtemp(BANK0[4]), NormalKeyGen@HOPtemp(BANK0[4]), DKEY(BANK1[8]), SEED(BANK0[4]), 
;;		 -> Buffer(BANK0[22]), 
;;
;; i2c_xmt_ptr	PTR bank1 unsigned char  size(1) Largest target is 0
;;		 -> NULL(NULL[0]), 
;;
;; memcpy@d1	PTR void  size(1) Largest target is 22
;;		 -> NormalKeyGen@SKEYtemp(BANK0[4]), NormalKeyGen@HOPtemp(BANK0[4]), DKEY(BANK1[8]), SEED(BANK0[4]), 
;;		 -> Buffer(BANK0[22]), 
;;
;; memcpy@d	PTR unsigned char  size(1) Largest target is 22
;;		 -> NormalKeyGen@SKEYtemp(BANK0[4]), NormalKeyGen@HOPtemp(BANK0[4]), DKEY(BANK1[8]), SEED(BANK0[4]), 
;;		 -> Buffer(BANK0[22]), 
;;
;; memcpy@s1	PTR const void  size(1) Largest target is 22
;;		 -> NormalKeyGen@SKEYtemp(BANK0[4]), NormalKeyGen@HOPtemp(BANK0[4]), SEED(BANK0[4]), RX_Buffer(BANK1[22]), 
;;		 -> Buffer(BANK0[22]), 
;;
;; memcpy@s	PTR const unsigned char  size(1) Largest target is 22
;;		 -> NormalKeyGen@SKEYtemp(BANK0[4]), NormalKeyGen@HOPtemp(BANK0[4]), SEED(BANK0[4]), RX_Buffer(BANK1[22]), 
;;		 -> Buffer(BANK0[22]), 
;;
;; printf@f	PTR const unsigned char  size(2) Largest target is 27
;;		 -> STR_14(CODE[27]), STR_13(CODE[27]), STR_12(CODE[26]), STR_9(CODE[3]), 
;;		 -> STR_8(CODE[9]), STR_7(CODE[3]), STR_6(CODE[9]), STR_4(CODE[27]), 
;;		 -> STR_3(CODE[16]), STR_2(CODE[27]), STR_1(CODE[21]), 
;;
;; printf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_printf(BANK0[2]), 
;;
;; S3128$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; i2c_rcv_ptr	PTR bank1 unsigned char  size(1) Largest target is 6
;;		 -> NULL(NULL[0]), i2c_rcv_buf(BANK0[6]), 
;;
;; lcd_puts@s	PTR const unsigned char  size(2) Largest target is 16
;;		 -> STR_20(CODE[6]), STR_19(CODE[6]), STR_18(CODE[16]), STR_17(CODE[14]), 
;;		 -> STR_16(CODE[16]), STR_15(CODE[14]), STR_11(CODE[7]), STR_10(CODE[6]), 
;;		 -> STR_5(CODE[13]), 
;;
;; sp__memcpy	PTR void  size(1) Largest target is 22
;;		 -> NormalKeyGen@SKEYtemp(BANK0[4]), NormalKeyGen@HOPtemp(BANK0[4]), DKEY(BANK1[8]), SEED(BANK0[4]), 
;;		 -> Buffer(BANK0[22]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _Interrupt in COMMON
;;
;;   _Interrupt->_ssp_isr
;;   _ssp_isr->_i2c_write_data
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_Remote
;;   _Remote->_NormalKeyGen
;;   _HopUpdate->_WRword
;;   _IDWrite->_WRword
;;   _Insert->_RDword
;;   _Find->_RDword
;;   _ClearMem->_WRword
;;   _lcd_put_char->_lcd_putch
;;   _Display_Splash->_lcd_puts
;;   _lcd_init->_DelayMs
;;   _lcd_putch->_lcd_write
;;   _WRword->_EEWrite
;;   _RDword->_EERead
;;   _put_byte->_putch
;;   _NormalKeyGen->_memcpy
;;   _lcd_puts->_lcd_write
;;   _lcd_goto->_lcd_write
;;   _lcd_clear->_lcd_write
;;   _lcd_clear->_DelayMs
;;   _printf->_putch
;;
;; Critical Paths under _Interrupt in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _Interrupt in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _Interrupt in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _Interrupt in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0    6713
;;                                             22 BANK0      3     3      0
;;                           _Init_886
;;                             _printf
;;                              _Delay
;;                           _lcd_init
;;                     _Display_Splash
;;                       _InitReceiver
;;                           _i2c_init
;;                             _Remote
;;                          _lcd_clear
;;                           _lcd_goto
;;                           _lcd_puts
;;                       _lcd_put_char
;;                           _ClearMem
;; ---------------------------------------------------------------------------------
;; (1) _Remote                                               7     7      0    4216
;;                                             15 BANK0      7     7      0
;;                             _memcpy
;;                       _NormalKeyGen
;;                            _Decrypt
;;                             _printf
;;                           _put_byte
;;                          _lcd_clear
;;                           _lcd_goto
;;                           _lcd_puts
;;                       _lcd_put_char
;;                             _DecCHK
;;                               _Find
;;                             _Insert
;;                            _IDWrite
;;                          _HopUpdate
;;                             _HopCHK
;; ---------------------------------------------------------------------------------
;; (2) _HopUpdate                                            0     0      0     124
;;                             _WRword
;; ---------------------------------------------------------------------------------
;; (2) _IDWrite                                              1     1      0     124
;;                                              4 BANK0      1     1      0
;;                             _WRword
;; ---------------------------------------------------------------------------------
;; (2) _Insert                                               0     0      0     127
;;                             _RDword
;; ---------------------------------------------------------------------------------
;; (2) _Find                                                 1     1      0     195
;;                                              6 BANK0      1     1      0
;;                             _RDword
;;                             _RDnext
;; ---------------------------------------------------------------------------------
;; (1) _ClearMem                                             1     1      0     124
;;                             _WRword
;; ---------------------------------------------------------------------------------
;; (1) _lcd_put_char                                         3     3      0     314
;;                                              5 BANK0      3     3      0
;;                          _lcd_putch
;; ---------------------------------------------------------------------------------
;; (1) _Display_Splash                                       1     1      0     430
;;                                              5 BANK0      1     1      0
;;                          _lcd_clear
;;                           _lcd_goto
;;                           _lcd_puts
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             6     6      0     503
;;                                              3 BANK0      6     6      0
;;                            _DelayMs
;;                          _lcd_clear
;; ---------------------------------------------------------------------------------
;; (2) _lcd_putch                                            2     2      0     132
;;                                              3 BANK0      2     2      0
;;                          _lcd_write
;; ---------------------------------------------------------------------------------
;; (2) _WRword                                               2     0      2     124
;;                                              2 BANK0      2     0      2
;;                            _EEWrite
;; ---------------------------------------------------------------------------------
;; (3) _RDword                                               4     2      2     127
;;                                              2 BANK0      4     2      2
;;                             _EERead
;; ---------------------------------------------------------------------------------
;; (2) _HopCHK                                               2     2      0      99
;;                                              0 BANK0      2     2      0
;;                          _ReqResync
;; ---------------------------------------------------------------------------------
;; (2) _put_byte                                             3     3      0     213
;;                                              1 BANK0      3     3      0
;;                              _putch
;; ---------------------------------------------------------------------------------
;; (2) _NormalKeyGen                                         8     8      0     543
;;                                              7 BANK0      8     8      0
;;                             _memcpy
;;                      _LoadManufCode
;;                            _Decrypt
;; ---------------------------------------------------------------------------------
;; (1) _lcd_puts                                             2     0      2     132
;;                                              3 BANK0      2     0      2
;;                          _lcd_write
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             1     1      0      98
;;                                              3 BANK0      1     1      0
;;                          _lcd_write
;; ---------------------------------------------------------------------------------
;; (1) _lcd_clear                                            0     0      0     166
;;                          _lcd_write
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (1) _Delay                                                4     2      2      68
;;                                              0 BANK0      4     2      2
;; ---------------------------------------------------------------------------------
;; (2) _printf                                              12    10      2      96
;;                                              1 BANK0      5     3      2
;;                              _putch
;; ---------------------------------------------------------------------------------
;; (1) _Init_886                                             0     0      0       0
;;                        _init_eusart
;; ---------------------------------------------------------------------------------
;; (3) _putch                                                1     1      0      31
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _DelayMs                                              3     3      0      99
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (3) _lcd_write                                            3     3      0      67
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (3) _RDnext                                               2     2      0       0
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _EEWrite                                              2     1      1      62
;;                                              0 BANK0      2     1      1
;; ---------------------------------------------------------------------------------
;; (4) _EERead                                               2     2      0      65
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _ReqResync                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _LoadManufCode                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _init_eusart                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _DecCHK                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Decrypt                                              5     5      0     281
;;                                              0 BANK0      5     5      0
;; ---------------------------------------------------------------------------------
;; (3) _memcpy                                               7     4      3     120
;;                                              0 BANK0      7     4      3
;; ---------------------------------------------------------------------------------
;; (1) _i2c_init                                             2     2      0       0
;; ---------------------------------------------------------------------------------
;; (1) _InitReceiver                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _Interrupt                                            3     3      0      47
;;                                              4 COMMON     3     3      0
;;                                _rxi
;;                            _ssp_isr
;;                           _tmr1_isr
;; ---------------------------------------------------------------------------------
;; (6) _ssp_isr                                              3     3      0      47
;;                                              1 COMMON     3     3      0
;;                     _i2c_write_data
;; ---------------------------------------------------------------------------------
;; (7) _i2c_write_data                                       1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (6) _tmr1_isr                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (6) _rxi                                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 7
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Init_886
;;     _init_eusart
;;   _printf
;;     _putch
;;   _Delay
;;   _lcd_init
;;     _DelayMs
;;     _lcd_clear
;;       _lcd_write
;;       _DelayMs
;;   _Display_Splash
;;     _lcd_clear
;;       _lcd_write
;;       _DelayMs
;;     _lcd_goto
;;       _lcd_write
;;     _lcd_puts
;;       _lcd_write
;;   _InitReceiver
;;   _i2c_init
;;   _Remote
;;     _memcpy
;;     _NormalKeyGen
;;       _memcpy
;;       _LoadManufCode
;;       _Decrypt
;;     _Decrypt
;;     _printf
;;       _putch
;;     _put_byte
;;       _putch
;;     _lcd_clear
;;       _lcd_write
;;       _DelayMs
;;     _lcd_goto
;;       _lcd_write
;;     _lcd_puts
;;       _lcd_write
;;     _lcd_put_char
;;       _lcd_putch
;;         _lcd_write
;;     _DecCHK
;;     _Find
;;       _RDword
;;         _EERead
;;       _RDnext
;;     _Insert
;;       _RDword
;;         _EERead
;;     _IDWrite
;;       _WRword
;;         _EEWrite
;;     _HopUpdate
;;       _WRword
;;         _EEWrite
;;     _HopCHK
;;       _ReqResync
;;   _lcd_clear
;;     _lcd_write
;;     _DelayMs
;;   _lcd_goto
;;     _lcd_write
;;   _lcd_puts
;;     _lcd_write
;;   _lcd_put_char
;;     _lcd_putch
;;       _lcd_write
;;   _ClearMem
;;     _WRword
;;       _EEWrite
;;
;; _Interrupt (ROOT)
;;   _rxi
;;   _ssp_isr
;;     _i2c_write_data
;;   _tmr1_isr
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      7       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       A       2        0.0%
;;ABS                  0      0      86       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     19      50       5      100.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0      28       7       50.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      90      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 147 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _dcnt           1   22[BANK0 ] unsigned char 
;;  j               1   24[BANK0 ] unsigned char 
;;  i               1   23[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_Init_886
;;		_printf
;;		_Delay
;;		_lcd_init
;;		_Display_Splash
;;		_InitReceiver
;;		_i2c_init
;;		_Remote
;;		_lcd_clear
;;		_lcd_goto
;;		_lcd_puts
;;		_lcd_put_char
;;		_ClearMem
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
	line	147
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	150
	
l10045:	
;main.c: 148: char i;
;main.c: 149: char j;
;main.c: 150: Init_886();
	fcall	_Init_886
	line	152
	
l10047:	
;main.c: 152: printf("KDS is starting...\r\n");
	movlw	low(STR_1|8000h)
	movwf	(?_printf)
	movlw	high(STR_1|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	line	154
	
l10049:	
;main.c: 154: for (i=0; i< 5; i++ )
	clrf	(main@i)
	line	155
	
l925:	
	line	156
;main.c: 155: {
;main.c: 156: LED_DS1 = 1;
	bsf	(57/8),(57)&7
	line	157
	
l10055:	
;main.c: 157: Delay(10000);
	movlw	low(02710h)
	movwf	(?_Delay)
	movlw	high(02710h)
	movwf	((?_Delay))+1
	fcall	_Delay
	line	158
	
l10057:	
;main.c: 158: LED_DS1 = 0;
	bcf	(57/8),(57)&7
	line	159
;main.c: 159: Delay(10000);
	movlw	low(02710h)
	movwf	(?_Delay)
	movlw	high(02710h)
	movwf	((?_Delay))+1
	fcall	_Delay
	line	154
	
l10059:	
	incf	(main@i),f
	
l10061:	
	movlw	(05h)
	subwf	(main@i),w
	skipc
	goto	u4041
	goto	u4040
u4041:
	goto	l925
u4040:
	line	162
	
l10063:	
;main.c: 160: }
;main.c: 162: lcd_init();
	fcall	_lcd_init
	line	163
;main.c: 163: Delay(10000);
	movlw	low(02710h)
	movwf	(?_Delay)
	movlw	high(02710h)
	movwf	((?_Delay))+1
	fcall	_Delay
	line	164
	
l10065:	
;main.c: 164: Display_Splash();
	fcall	_Display_Splash
	line	165
	
l10067:	
;main.c: 165: printf("KEELOQ 3 DEVELOPMENT KIT\r\n");
	movlw	low(STR_2|8000h)
	movwf	(?_printf)
	movlw	high(STR_2|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	line	166
	
l10069:	
;main.c: 166: Display_Toggle = 0;
	bcf	(_Display_Toggle/8),(_Display_Toggle)&7
	line	170
	
l10071:	
;main.c: 170: TMR1L = 0x00;
	clrf	(14)	;volatile
	line	171
	
l10073:	
;main.c: 171: TMR1H = 0x00;
	clrf	(15)	;volatile
	line	172
	
l10075:	
;main.c: 172: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	173
	
l10077:	
;main.c: 173: T1CON = 0x11;
	movlw	(011h)
	movwf	(16)	;volatile
	line	174
	
l10079:	
;main.c: 174: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	177
;main.c: 177: InitReceiver();
	fcall	_InitReceiver
	line	178
	
l10081:	
;main.c: 178: i2c_init();
	fcall	_i2c_init
	line	180
	
l10083:	
;main.c: 180: for (j=0;j<9; j++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@j)
	line	181
	
l10089:	
;main.c: 181: i2c_xmt_buf[j] = 0;
	movf	(main@j),w
	addlw	_i2c_xmt_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	line	180
	
l10091:	
	incf	(main@j),f
	
l10093:	
	movlw	(09h)
	subwf	(main@j),w
	skipc
	goto	u4051
	goto	u4050
u4051:
	goto	l10089
u4050:
	line	183
	
l10095:	
;main.c: 183: INTCON = 0x60;
	movlw	(060h)
	movwf	(11)	;volatile
	line	184
	
l10097:	
;main.c: 184: GIE = 1;
	bsf	(95/8),(95)&7
	line	192
	
l10099:	
;main.c: 188: {
;main.c: 192: if(!Button_3)
	btfsc	(51/8),(51)&7
	goto	u4061
	goto	u4060
u4061:
	goto	l10109
u4060:
	line	194
	
l10101:	
;main.c: 193: {
;main.c: 194: Display_Toggle = !Display_Toggle;
	movlw	1<<((_Display_Toggle)&7)
	xorwf	((_Display_Toggle)/8),f
	line	195
	
l10103:	
;main.c: 195: if(Display_Toggle)
	btfss	(_Display_Toggle/8),(_Display_Toggle)&7
	goto	u4071
	goto	u4070
u4071:
	goto	l10107
u4070:
	line	197
	
l10105:	
;main.c: 197: printf("version : 1.0\r\n");
	movlw	low(STR_3|8000h)
	movwf	(?_printf)
	movlw	high(STR_3|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	goto	l10109
	line	200
	
l10107:	
;main.c: 198: else
;main.c: 200: printf("KEELOQ 3 DEVELOPMENT KIT\r\n");
	movlw	low(STR_4|8000h)
	movwf	(?_printf)
	movlw	high(STR_4|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	line	206
	
l10109:	
;main.c: 201: }
;main.c: 206: if ( RFFull)
	btfss	(_RFFull/8),(_RFFull)&7
	goto	u4081
	goto	u4080
u4081:
	goto	l10119
u4080:
	line	208
	
l10111:	
;main.c: 207: {
;main.c: 208: Led = 1;
	bsf	(52/8),(52)&7
	line	209
	
l10113:	
;main.c: 209: Remote();
	fcall	_Remote
	line	210
	
l10115:	
;main.c: 210: Led = 0;
	bcf	(52/8),(52)&7
	line	211
	
l10117:	
;main.c: 211: RFFull = 0;
	bcf	(_RFFull/8),(_RFFull)&7
	line	217
	
l10119:	
;main.c: 212: }
;main.c: 217: if(i2c_rcv_avail)
	movf	(_i2c_rcv_avail),w
	skipz
	goto	u4090
	goto	l10195
u4090:
	line	219
	
l10121:	
;main.c: 218: {
;main.c: 219: i2c_rcv_avail = 0;
	clrf	(_i2c_rcv_avail)
	line	220
;main.c: 220: switch(i2c_rcv_buf[0])
	goto	l10193
	line	223
	
l10123:	
;main.c: 223: lcd_clear();
	fcall	_lcd_clear
	line	224
;main.c: 224: lcd_goto(0x00);
	movlw	(0)
	fcall	_lcd_goto
	line	225
	
l10125:	
;main.c: 225: lcd_puts("Test Buffer ");
	movlw	low(STR_5|8000h)
	movwf	(?_lcd_puts)
	movlw	high(STR_5|8000h)
	movwf	((?_lcd_puts))+1
	fcall	_lcd_puts
	line	226
	
l10127:	
;main.c: 226: { unsigned char _dcnt; _dcnt = (200)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0C9h)
	movwf	(main@_dcnt)
	
l937:	
	decfsz	(main@_dcnt),f
	goto	u4101
	goto	u4100
u4101:
	goto	l937
u4100:
	line	227
	
l10129:	
;main.c: 227: lcd_goto(0x40);
	movlw	(040h)
	fcall	_lcd_goto
	line	228
	
l10131:	
;main.c: 228: for (i=1;i<5;i++)
	clrf	(main@i)
	incf	(main@i),f
	line	229
	
l10137:	
;main.c: 229: lcd_put_char(i2c_rcv_buf[i]);
	movf	(main@i),w
	addlw	_i2c_rcv_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_put_char
	line	228
	
l10139:	
	incf	(main@i),f
	
l10141:	
	movlw	(05h)
	subwf	(main@i),w
	skipc
	goto	u4111
	goto	u4110
u4111:
	goto	l10137
u4110:
	goto	l10195
	line	232
;main.c: 232: case (0x02):
	
l943:	
	line	233
;main.c: 233: if (i2c_rcv_buf[1] & 0x01)
	btfss	0+(_i2c_rcv_buf)+01h,(0)&7
	goto	u4121
	goto	u4120
u4121:
	goto	l944
u4120:
	line	234
	
l10143:	
;main.c: 234: LED_DS1 = 1;
	bsf	(57/8),(57)&7
	goto	l945
	line	235
	
l944:	
	line	236
;main.c: 235: else
;main.c: 236: LED_DS1 = 0;
	bcf	(57/8),(57)&7
	
l945:	
	line	237
;main.c: 237: if (i2c_rcv_buf[1] & 0x02)
	btfss	0+(_i2c_rcv_buf)+01h,(1)&7
	goto	u4131
	goto	u4130
u4131:
	goto	l946
u4130:
	line	238
	
l10145:	
;main.c: 238: LED_DS2 = 1;
	bsf	(56/8),(56)&7
	goto	l947
	line	239
	
l946:	
	line	240
;main.c: 239: else
;main.c: 240: LED_DS2 = 0;
	bcf	(56/8),(56)&7
	
l947:	
	line	241
;main.c: 241: if (i2c_rcv_buf[1] & 0x04)
	btfss	0+(_i2c_rcv_buf)+01h,(2)&7
	goto	u4141
	goto	u4140
u4141:
	goto	l948
u4140:
	line	242
	
l10147:	
;main.c: 242: LED_DS3 = 1;
	bsf	(58/8),(58)&7
	goto	l949
	line	243
	
l948:	
	line	244
;main.c: 243: else
;main.c: 244: LED_DS3 = 0;
	bcf	(58/8),(58)&7
	
l949:	
	line	245
;main.c: 245: if (i2c_rcv_buf[1] & 0x08)
	btfss	0+(_i2c_rcv_buf)+01h,(3)&7
	goto	u4151
	goto	u4150
u4151:
	goto	l950
u4150:
	line	246
	
l10149:	
;main.c: 246: LED_DS4 = 1;
	bsf	(52/8),(52)&7
	goto	l10151
	line	247
	
l950:	
	line	248
;main.c: 247: else
;main.c: 248: LED_DS4 = 0;
	bcf	(52/8),(52)&7
	line	249
	
l10151:	
;main.c: 249: if (i2c_rcv_buf[1] == 0xFF)
	movf	0+(_i2c_rcv_buf)+01h,w
	xorlw	0FFh
	skipz
	goto	u4161
	goto	u4160
u4161:
	goto	l10195
u4160:
	line	251
	
l10153:	
;main.c: 250: {
;main.c: 251: LED_DS1 = 0;
	bcf	(57/8),(57)&7
	line	252
;main.c: 252: LED_DS2 = 0;
	bcf	(56/8),(56)&7
	line	253
;main.c: 253: LED_DS3 = 0;
	bcf	(58/8),(58)&7
	line	254
;main.c: 254: LED_DS4 = 0;
	bcf	(52/8),(52)&7
	goto	l10195
	line	263
;main.c: 263: case (0x04):
	
l954:	
	line	264
;main.c: 264: if (i2c_rcv_buf[1] & 0x01)
	btfss	0+(_i2c_rcv_buf)+01h,(0)&7
	goto	u4171
	goto	u4170
u4171:
	goto	l955
u4170:
	line	266
	
l10155:	
;main.c: 265: {
;main.c: 266: FLearn = 1;
	bsf	(_FLearn/8),(_FLearn)&7
	line	267
	
l10157:	
;main.c: 267: CTLearn = 255;
	movlw	(0FFh)
	movwf	(_CTLearn)
	line	268
	
l10159:	
;main.c: 268: LED_DS4 = 1;
	bsf	(52/8),(52)&7
	line	269
	
l10161:	
;main.c: 269: i2c_xmt_buf[0] = 0x01;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_i2c_xmt_buf)^080h
	incf	(_i2c_xmt_buf)^080h,f
	line	270
	
l10163:	
;main.c: 270: for (j=1;j<9; j++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@j)
	incf	(main@j),f
	line	271
	
l10167:	
;main.c: 271: i2c_xmt_buf[j] = 0x00;
	movf	(main@j),w
	addlw	_i2c_xmt_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	line	270
	
l10169:	
	incf	(main@j),f
	
l10171:	
	movlw	(09h)
	subwf	(main@j),w
	skipc
	goto	u4181
	goto	u4180
u4181:
	goto	l10167
u4180:
	goto	l10195
	line	273
	
l955:	
	line	274
;main.c: 273: else
;main.c: 274: if (i2c_rcv_buf[1] & 0x02)
	btfss	0+(_i2c_rcv_buf)+01h,(1)&7
	goto	u4191
	goto	u4190
u4191:
	goto	l942
u4190:
	line	276
	
l10173:	
;main.c: 275: {
;main.c: 276: ClearMem();
	fcall	_ClearMem
	line	277
	
l10175:	
;main.c: 277: LED_DS1 = 0;
	bcf	(57/8),(57)&7
	line	278
	
l10177:	
;main.c: 278: i2c_xmt_buf[0] = 0x02;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_i2c_xmt_buf)^080h
	line	279
	
l10179:	
;main.c: 279: for (j=1;j<9; j++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@j)
	incf	(main@j),f
	line	280
	
l10185:	
;main.c: 280: i2c_xmt_buf[j] = 0x00;
	movf	(main@j),w
	addlw	_i2c_xmt_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	line	279
	
l10187:	
	incf	(main@j),f
	
l10189:	
	movlw	(09h)
	subwf	(main@j),w
	skipc
	goto	u4201
	goto	u4200
u4201:
	goto	l10185
u4200:
	goto	l10195
	line	220
	
l10193:	
	movf	(_i2c_rcv_buf),w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 1 to 7
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    22    12 (average)
; direct_byte    43    22 (fixed)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l10123
	xorlw	2^1	; case 2
	skipnz
	goto	l943
	xorlw	3^2	; case 3
	skipnz
	goto	l10195
	xorlw	4^3	; case 4
	skipnz
	goto	l954
	xorlw	5^4	; case 5
	skipnz
	goto	l10195
	xorlw	6^5	; case 6
	skipnz
	goto	l10195
	xorlw	7^6	; case 7
	skipnz
	goto	l10195
	goto	l10195

	line	298
	
l942:	
	line	305
	
l10195:	
;main.c: 299: }
;main.c: 305: if(Continue_Count )
	movf	(_Continue_Count),w
	skipz
	goto	u4210
	goto	l10099
u4210:
	line	307
	
l10197:	
;main.c: 306: {
;main.c: 307: Continue_Count = 0;
	clrf	(_Continue_Count)
	line	309
	
l10199:	
;main.c: 309: if ( !Learn)
	btfsc	(49/8),(49)&7
	goto	u4221
	goto	u4220
u4221:
	goto	l10237
u4220:
	line	311
	
l10201:	
;main.c: 310: {
;main.c: 311: CLearn++;
	incf	(_CLearn),f
	line	314
	
l10203:	
;main.c: 314: if (CLearn == 128)
	movf	(_CLearn),w
	xorlw	080h
	skipz
	goto	u4231
	goto	u4230
u4231:
	goto	l10229
u4230:
	line	316
	
l10205:	
;main.c: 315: {
;main.c: 316: Led = 0;
	bcf	(52/8),(52)&7
	line	317
;main.c: 317: while( !Learn);
	
l969:	
	btfss	(49/8),(49)&7
	goto	u4241
	goto	u4240
u4241:
	goto	l969
u4240:
	
l971:	
	line	318
;main.c: 318: Led = 1;
	bsf	(52/8),(52)&7
	line	319
	
l10207:	
;main.c: 319: ClearMem();
	fcall	_ClearMem
	line	320
	
l10209:	
;main.c: 320: i2c_xmt_buf[0] = 0x02;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_i2c_xmt_buf)^080h
	line	321
	
l10211:	
;main.c: 321: for(i=1;i<10;i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@i)
	incf	(main@i),f
	line	322
	
l10217:	
;main.c: 322: i2c_xmt_buf[0] = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_i2c_xmt_buf)^080h
	line	321
	
l10219:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@i),f
	
l10221:	
	movlw	(0Ah)
	subwf	(main@i),w
	skipc
	goto	u4251
	goto	u4250
u4251:
	goto	l10217
u4250:
	line	324
	
l10223:	
;main.c: 324: COut = 4;
	movlw	(04h)
	movwf	(_COut)
	line	325
	
l10225:	
;main.c: 325: CLearn = 0;
	clrf	(_CLearn)
	line	326
	
l10227:	
;main.c: 326: FLearn = 0;
	bcf	(_FLearn/8),(_FLearn)&7
	line	329
	
l10229:	
;main.c: 327: }
;main.c: 329: if (CLearn == 4)
	movf	(_CLearn),w
	xorlw	04h
	skipz
	goto	u4261
	goto	u4260
u4261:
	goto	l10239
u4260:
	line	331
	
l10231:	
;main.c: 330: {
;main.c: 331: FLearn = 1;
	bsf	(_FLearn/8),(_FLearn)&7
	line	332
	
l10233:	
;main.c: 332: CTLearn = 255;
	movlw	(0FFh)
	movwf	(_CTLearn)
	line	333
	
l10235:	
;main.c: 333: Led = 1;
	bsf	(52/8),(52)&7
	goto	l10239
	line	336
	
l10237:	
;main.c: 336: else CLearn=0;
	clrf	(_CLearn)
	line	339
	
l10239:	
;main.c: 339: if ( COut > 0)
	movf	(_COut),w
	skipz
	goto	u4270
	goto	l10245
u4270:
	line	341
	
l10241:	
;main.c: 340: {
;main.c: 341: COut--;
	decf	(_COut),f
	line	342
;main.c: 342: if ( COut == 0)
	movf	(_COut),f
	skipz
	goto	u4281
	goto	u4280
u4281:
	goto	l10245
u4280:
	line	344
	
l10243:	
;main.c: 343: {
;main.c: 344: Led = 0;
	bcf	(52/8),(52)&7
	line	345
;main.c: 345: LED_DS1 = 0;
	bcf	(57/8),(57)&7
	line	346
;main.c: 346: LED_DS2 = 0;
	bcf	(56/8),(56)&7
	line	347
;main.c: 347: LED_DS3 = 0;
	bcf	(58/8),(58)&7
	line	348
;main.c: 348: LED_DS4 = 0;
	bcf	(52/8),(52)&7
	line	353
	
l10245:	
;main.c: 349: }
;main.c: 350: }
;main.c: 353: if ( CTLearn > 0)
	movf	(_CTLearn),w
	skipz
	goto	u4290
	goto	l10251
u4290:
	line	355
	
l10247:	
;main.c: 354: {
;main.c: 355: CTLearn--;
	decf	(_CTLearn),f
	line	356
;main.c: 356: if ( CTLearn == 0)
	movf	(_CTLearn),f
	skipz
	goto	u4301
	goto	u4300
u4301:
	goto	l10251
u4300:
	line	358
	
l10249:	
;main.c: 357: {
;main.c: 358: Led = 0;
	bcf	(52/8),(52)&7
	line	359
;main.c: 359: FLearn = 0;
	bcf	(_FLearn/8),(_FLearn)&7
	line	364
	
l10251:	
;main.c: 360: }
;main.c: 361: }
;main.c: 364: if ( CFlash > 0)
	movf	(_CFlash),w
	skipz
	goto	u4310
	goto	l10099
u4310:
	line	366
	
l10253:	
;main.c: 365: {
;main.c: 366: CTFlash--;
	decf	(_CTFlash),f
	line	367
;main.c: 367: if ( CTFlash == 0)
	movf	(_CTFlash),f
	skipz
	goto	u4321
	goto	u4320
u4321:
	goto	l10099
u4320:
	line	369
	
l10255:	
;main.c: 368: {
;main.c: 369: CTFlash = 5;
	movlw	(05h)
	movwf	(_CTFlash)
	line	370
	
l10257:	
;main.c: 370: CFlash--;
	decf	(_CFlash),f
	line	371
	
l10259:	
;main.c: 371: Led = 0;
	bcf	(52/8),(52)&7
	line	372
	
l10261:	
;main.c: 372: if ( CFlash & 1)
	btfss	(_CFlash),(0)&7
	goto	u4331
	goto	u4330
u4331:
	goto	l966
u4330:
	line	373
	
l10263:	
;main.c: 373: Led = 1;
	bsf	(52/8),(52)&7
	goto	l10099
	line	376
	
l966:	
	goto	l10099
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	378
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_Remote
psect	text1309,local,class=CODE,delta=2
global __ptext1309
__ptext1309:

;; *************** function _Remote *****************
;; Defined at:
;;		line 414 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _dcnt           1   20[BANK0 ] unsigned char 
;;  _dcnt           1   19[BANK0 ] unsigned char 
;;  _dcnt           1   18[BANK0 ] unsigned char 
;;  _dcnt           1   17[BANK0 ] unsigned char 
;;  k               1   21[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_memcpy
;;		_NormalKeyGen
;;		_Decrypt
;;		_printf
;;		_put_byte
;;		_lcd_clear
;;		_lcd_goto
;;		_lcd_puts
;;		_lcd_put_char
;;		_DecCHK
;;		_Find
;;		_Insert
;;		_IDWrite
;;		_HopUpdate
;;		_HopCHK
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1309
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
	line	414
	global	__size_of_Remote
	__size_of_Remote	equ	__end_of_Remote-_Remote
	
_Remote:	
	opt	stack 1
; Regs used in _Remote: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	419
	
l9789:	
;main.c: 417: char k;
;main.c: 419: memcpy( Buffer, RX_Buffer, 13);
	movlw	(_RX_Buffer)&0ffh
	movwf	(?_memcpy)
	movlw	0Dh
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(_Buffer)&0ffh
	fcall	_memcpy
	line	420
	
l9791:	
;main.c: 420: RFFull = 0;
	bcf	(_RFFull/8),(_RFFull)&7
	line	423
;main.c: 423: switch (RFtype)
	goto	l9897
	line	426
	
l9793:	
;main.c: 426: NormalKeyGen();
	fcall	_NormalKeyGen
	line	427
;main.c: 427: Decrypt();
	fcall	_Decrypt
	line	446
	
l9795:	
;main.c: 446: printf("KLQ   : ");
	movlw	low(STR_6|8000h)
	movwf	(?_printf)
	movlw	high(STR_6|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	line	447
	
l9797:	
;main.c: 447: for (k=4; k>0; k--)
	movlw	(04h)
	movwf	(Remote@k)
	line	449
	
l9803:	
;main.c: 448: {
;main.c: 449: put_byte(SEED[k-1]);
	movf	(Remote@k),w
	addlw	_SEED+-1&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_put_byte
	line	447
	
l9805:	
	decf	(Remote@k),f
	
l9807:	
	movf	(Remote@k),f
	skipz
	goto	u3771
	goto	u3770
u3771:
	goto	l9803
u3770:
	line	451
	
l9809:	
;main.c: 450: }
;main.c: 451: printf("\r\n");
	movlw	low(STR_7|8000h)
	movwf	(?_printf)
	movlw	high(STR_7|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	line	452
;main.c: 452: printf("Result: ");
	movlw	low(STR_8|8000h)
	movwf	(?_printf)
	movlw	high(STR_8|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	line	453
	
l9811:	
;main.c: 453: for (k=4; k>0; k--)
	movlw	(04h)
	movwf	(Remote@k)
	line	455
	
l9817:	
;main.c: 454: {
;main.c: 455: put_byte(Buffer[k-1]);
	movf	(Remote@k),w
	addlw	_Buffer+-1&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_put_byte
	line	453
	
l9819:	
	decf	(Remote@k),f
	
l9821:	
	movf	(Remote@k),f
	skipz
	goto	u3781
	goto	u3780
u3781:
	goto	l9817
u3780:
	line	457
	
l9823:	
;main.c: 456: }
;main.c: 457: printf("\r\n");
	movlw	low(STR_9|8000h)
	movwf	(?_printf)
	movlw	high(STR_9|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	line	458
;main.c: 458: break;
	goto	l9899
	line	462
	
l9825:	
;main.c: 462: lcd_clear();
	fcall	_lcd_clear
	line	463
;main.c: 463: lcd_goto(0x00);
	movlw	(0)
	fcall	_lcd_goto
	line	464
	
l9827:	
;main.c: 464: lcd_puts("AES# ");
	movlw	low(STR_10|8000h)
	movwf	(?_lcd_puts)
	movlw	high(STR_10|8000h)
	movwf	((?_lcd_puts))+1
	fcall	_lcd_puts
	line	465
	
l9829:	
;main.c: 465: for (k=0; k<6; k++)
	clrf	(Remote@k)
	line	467
	
l9835:	
;main.c: 466: {
;main.c: 467: lcd_put_char(Buffer[k-1]);
	movf	(Remote@k),w
	addlw	_Buffer+-1&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_put_char
	line	465
	
l9837:	
	incf	(Remote@k),f
	
l9839:	
	movlw	(06h)
	subwf	(Remote@k),w
	skipc
	goto	u3791
	goto	u3790
u3791:
	goto	l9835
u3790:
	line	469
	
l9841:	
;main.c: 468: }
;main.c: 469: { unsigned char _dcnt; _dcnt = (200)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0C9h)
	movwf	(Remote@_dcnt)
	
l1004:	
	decfsz	(Remote@_dcnt),f
	goto	u3801
	goto	u3800
u3801:
	goto	l1004
u3800:
	line	470
	
l9843:	
;main.c: 470: lcd_goto(0x40);
	movlw	(040h)
	fcall	_lcd_goto
	line	471
	
l9845:	
;main.c: 471: for (k=6; k<15; k++)
	movlw	(06h)
	movwf	(Remote@k)
	line	473
	
l9851:	
;main.c: 472: {
;main.c: 473: lcd_put_char(Buffer[k-1]);
	movf	(Remote@k),w
	addlw	_Buffer+-1&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_put_char
	line	471
	
l9853:	
	incf	(Remote@k),f
	
l9855:	
	movlw	(0Fh)
	subwf	(Remote@k),w
	skipc
	goto	u3811
	goto	u3810
u3811:
	goto	l9851
u3810:
	line	475
	
l9857:	
;main.c: 474: }
;main.c: 475: { unsigned char _dcnt; _dcnt = (200)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0C9h)
	movwf	(Remote@_dcnt_593)
	
l1009:	
	decfsz	(Remote@_dcnt_593),f
	goto	u3821
	goto	u3820
u3821:
	goto	l1009
u3820:
	goto	l9899
	line	480
	
l9859:	
;main.c: 480: lcd_clear();
	fcall	_lcd_clear
	line	481
;main.c: 481: lcd_goto(0x00);
	movlw	(0)
	fcall	_lcd_goto
	line	482
	
l9861:	
;main.c: 482: lcd_puts("XTEA# ");
	movlw	low(STR_11|8000h)
	movwf	(?_lcd_puts)
	movlw	high(STR_11|8000h)
	movwf	((?_lcd_puts))+1
	fcall	_lcd_puts
	line	483
	
l9863:	
;main.c: 483: for (k=0; k<6; k++)
	clrf	(Remote@k)
	line	485
	
l9869:	
;main.c: 484: {
;main.c: 485: lcd_put_char(Buffer[k-1]);
	movf	(Remote@k),w
	addlw	_Buffer+-1&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_put_char
	line	483
	
l9871:	
	incf	(Remote@k),f
	
l9873:	
	movlw	(06h)
	subwf	(Remote@k),w
	skipc
	goto	u3831
	goto	u3830
u3831:
	goto	l9869
u3830:
	line	487
	
l9875:	
;main.c: 486: }
;main.c: 487: { unsigned char _dcnt; _dcnt = (200)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0C9h)
	movwf	(Remote@_dcnt_595)
	
l1015:	
	decfsz	(Remote@_dcnt_595),f
	goto	u3841
	goto	u3840
u3841:
	goto	l1015
u3840:
	line	488
	
l9877:	
;main.c: 488: lcd_goto(0x40);
	movlw	(040h)
	fcall	_lcd_goto
	line	489
	
l9879:	
;main.c: 489: for (k=6; k<10; k++)
	movlw	(06h)
	movwf	(Remote@k)
	line	491
	
l9885:	
;main.c: 490: {
;main.c: 491: lcd_put_char(Buffer[k-1]);
	movf	(Remote@k),w
	addlw	_Buffer+-1&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_put_char
	line	489
	
l9887:	
	incf	(Remote@k),f
	
l9889:	
	movlw	(0Ah)
	subwf	(Remote@k),w
	skipc
	goto	u3851
	goto	u3850
u3851:
	goto	l9885
u3850:
	line	493
	
l9891:	
;main.c: 492: }
;main.c: 493: { unsigned char _dcnt; _dcnt = (200)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0C9h)
	movwf	(Remote@_dcnt_596)
	
l1020:	
	decfsz	(Remote@_dcnt_596),f
	goto	u3861
	goto	u3860
u3861:
	goto	l1020
u3860:
	goto	l9899
	line	498
	
l9893:	
;main.c: 498: NormalKeyGen();
	fcall	_NormalKeyGen
	line	499
;main.c: 499: Decrypt();
	fcall	_Decrypt
	line	500
;main.c: 500: break;
	goto	l9899
	line	423
	
l9897:	
	movf	(_RFtype),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    10     6 (average)
; direct_byte    31    22 (fixed)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l9793
	xorlw	2^1	; case 2
	skipnz
	goto	l9825
	xorlw	3^2	; case 3
	skipnz
	goto	l9859
	goto	l9893

	line	504
	
l9899:	
;main.c: 504: if (DecCHK() == 0)
	fcall	_DecCHK
	iorlw	0
	skipz
	goto	u3871
	goto	u3870
u3871:
	goto	l1024
u3870:
	line	507
	
l9901:	
;main.c: 505: {
;main.c: 507: i2c_xmt_buf[0] = 0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_i2c_xmt_buf)^080h
	line	508
;main.c: 508: for (k=4;k>0; k--)
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Remote@k)
	line	509
	
l9907:	
;main.c: 509: i2c_xmt_buf[(5-k)] = 0;
	movlw	(_i2c_xmt_buf+05h)&0ffh
	movwf	(??_Remote+0)+0
	movf	(Remote@k),w
	subwf	(??_Remote+0)+0,f
	movf	0+(??_Remote+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	508
	
l9909:	
	decf	(Remote@k),f
	
l9911:	
	movf	(Remote@k),f
	skipz
	goto	u3881
	goto	u3880
u3881:
	goto	l9907
u3880:
	line	511
	
l9913:	
;main.c: 511: for (k=4;k>0; k--)
	movlw	(04h)
	movwf	(Remote@k)
	line	512
	
l9919:	
;main.c: 512: i2c_xmt_buf[(9-k)] = 0;
	movlw	(_i2c_xmt_buf+09h)&0ffh
	movwf	(??_Remote+0)+0
	movf	(Remote@k),w
	subwf	(??_Remote+0)+0,f
	movf	0+(??_Remote+0)+0,w
	movwf	fsr0
	clrf	indf
	line	511
	
l9921:	
	decf	(Remote@k),f
	
l9923:	
	movf	(Remote@k),f
	skipz
	goto	u3891
	goto	u3890
u3891:
	goto	l9919
u3890:
	line	520
	
l9925:	
;main.c: 520: printf("Not a Valid Transmitter\r\n");
	movlw	low(STR_12|8000h)
	movwf	(?_printf)
	movlw	high(STR_12|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	goto	l1029
	line	522
	
l1024:	
	line	525
;main.c: 522: }
;main.c: 525: if (FLearn)
	btfss	(_FLearn/8),(_FLearn)&7
	goto	u3901
	goto	u3900
u3901:
	goto	l9947
u3900:
	line	527
	
l9929:	
;main.c: 526: {
;main.c: 527: if ( Find()== 0)
	fcall	_Find
	iorlw	0
	skipz
	goto	u3911
	goto	u3910
u3911:
	goto	l9935
u3910:
	line	529
	
l9931:	
;main.c: 528: {
;main.c: 529: if ( !Insert())
	fcall	_Insert
	iorlw	0
	skipz
	goto	u3921
	goto	u3920
u3921:
	goto	l9935
u3920:
	goto	l1029
	line	533
	
l9935:	
;main.c: 531: }
;main.c: 533: IDWrite();
	fcall	_IDWrite
	line	534
	
l9937:	
;main.c: 534: FHopOK = 1;
	bsf	(_FHopOK/8),(_FHopOK)&7
	line	535
;main.c: 535: HopUpdate();
	fcall	_HopUpdate
	line	537
	
l9939:	
;main.c: 537: CFlash = 10;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_CFlash)
	line	538
	
l9941:	
;main.c: 538: CTFlash = 5;
	movlw	(05h)
	movwf	(_CTFlash)
	line	539
	
l9943:	
;main.c: 539: Led = 1;
	bsf	(52/8),(52)&7
	line	540
	
l9945:	
;main.c: 540: FLearn = 0;
	bcf	(_FLearn/8),(_FLearn)&7
	line	541
;main.c: 541: }
	goto	l1029
	line	546
	
l9947:	
;main.c: 543: else
;main.c: 544: {
;main.c: 546: if ( Find()== 0)
	fcall	_Find
	iorlw	0
	skipz
	goto	u3931
	goto	u3930
u3931:
	goto	l9979
u3930:
	line	549
	
l9949:	
;main.c: 547: {
;main.c: 549: i2c_xmt_buf[0] = 0x05;
	movlw	(05h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_i2c_xmt_buf)^080h
	line	550
;main.c: 550: for (k=4;k>0; k--)
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Remote@k)
	line	551
	
l9955:	
;main.c: 551: i2c_xmt_buf[(5-k)] = 0;
	movlw	(_i2c_xmt_buf+05h)&0ffh
	movwf	(??_Remote+0)+0
	movf	(Remote@k),w
	subwf	(??_Remote+0)+0,f
	movf	0+(??_Remote+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	550
	
l9957:	
	decf	(Remote@k),f
	
l9959:	
	movf	(Remote@k),f
	skipz
	goto	u3941
	goto	u3940
u3941:
	goto	l9955
u3940:
	line	552
	
l9961:	
;main.c: 552: for (k=4;k>0; k--)
	movlw	(04h)
	movwf	(Remote@k)
	line	553
	
l9967:	
;main.c: 553: i2c_xmt_buf[(9-k)] = 0;
	movlw	(_i2c_xmt_buf+09h)&0ffh
	movwf	(??_Remote+0)+0
	movf	(Remote@k),w
	subwf	(??_Remote+0)+0,f
	movf	0+(??_Remote+0)+0,w
	movwf	fsr0
	clrf	indf
	line	552
	
l9969:	
	decf	(Remote@k),f
	
l9971:	
	movf	(Remote@k),f
	skipz
	goto	u3951
	goto	u3950
u3951:
	goto	l9967
u3950:
	line	561
	
l9973:	
;main.c: 561: printf("Transmitter Not Learned!\r\n");
	movlw	low(STR_13|8000h)
	movwf	(?_printf)
	movlw	high(STR_13|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	goto	l1029
	line	567
	
l9979:	
;main.c: 564: else
;main.c: 565: {
;main.c: 567: if ( !HopCHK())
	fcall	_HopCHK
	iorlw	0
	skipz
	goto	u3961
	goto	u3960
u3961:
	goto	l1040
u3960:
	line	569
	
l9981:	
;main.c: 568: {
;main.c: 569: i2c_xmt_buf[0] = 0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_i2c_xmt_buf)^080h
	line	570
;main.c: 570: for (k=4;k>0; k--)
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Remote@k)
	line	571
	
l9987:	
;main.c: 571: i2c_xmt_buf[(5-k)] = 0;
	movlw	(_i2c_xmt_buf+05h)&0ffh
	movwf	(??_Remote+0)+0
	movf	(Remote@k),w
	subwf	(??_Remote+0)+0,f
	movf	0+(??_Remote+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	570
	
l9989:	
	decf	(Remote@k),f
	
l9991:	
	movf	(Remote@k),f
	skipz
	goto	u3971
	goto	u3970
u3971:
	goto	l9987
u3970:
	line	572
	
l9993:	
;main.c: 572: for (k=4;k>0; k--)
	movlw	(04h)
	movwf	(Remote@k)
	line	573
	
l9999:	
;main.c: 573: i2c_xmt_buf[(9-k)] = 0;
	movlw	(_i2c_xmt_buf+09h)&0ffh
	movwf	(??_Remote+0)+0
	movf	(Remote@k),w
	subwf	(??_Remote+0)+0,f
	movf	0+(??_Remote+0)+0,w
	movwf	fsr0
	clrf	indf
	line	572
	
l10001:	
	decf	(Remote@k),f
	
l10003:	
	movf	(Remote@k),f
	skipz
	goto	u3981
	goto	u3980
u3981:
	goto	l9999
u3980:
	line	581
	
l10005:	
;main.c: 581: printf("Not a valid Transmitter!\r\n");
	movlw	low(STR_14|8000h)
	movwf	(?_printf)
	movlw	high(STR_14|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	goto	l1029
	line	583
	
l1040:	
	line	585
;main.c: 583: }
;main.c: 585: if ( FSame)
	btfss	(_FSame/8),(_FSame)&7
	goto	u3991
	goto	u3990
u3991:
	goto	l10013
u3990:
	line	587
	
l10009:	
;main.c: 586: {
;main.c: 587: if ( COut >0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_COut),w
	skipz
	goto	u4000
	goto	l1029
u4000:
	line	588
	
l10011:	
;main.c: 588: COut = 4;
	movlw	(04h)
	movwf	(_COut)
	goto	l1048
	line	594
	
l10013:	
;main.c: 592: else
;main.c: 593: {
;main.c: 594: HopUpdate();
	fcall	_HopUpdate
	line	595
	
l10015:	
;main.c: 595: LED_DS3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	596
	
l10017:	
;main.c: 596: if ( (( Buffer[7] ^ FCode) & 0xf0) == 0)
	movf	0+(_Buffer)+07h,w
	xorwf	(_FCode),w
	andlw	0F0h
	btfss	status,2
	goto	u4011
	goto	u4010
u4011:
	goto	l10011
u4010:
	line	597
	
l10019:	
;main.c: 597: Led = 1;
	bsf	(52/8),(52)&7
	goto	l10011
	line	599
	
l1048:	
	line	601
;main.c: 599: }
;main.c: 601: i2c_xmt_buf[0] = 0x10;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_i2c_xmt_buf)^080h
	line	602
;main.c: 602: for (k=4;k>0; k--)
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Remote@k)
	line	603
	
l10027:	
;main.c: 603: i2c_xmt_buf[(5-k)] = SEED[(k-1)];
	movf	(Remote@k),w
	addlw	_SEED+-1&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_Remote+0)+0
	movlw	(_i2c_xmt_buf+05h)&0ffh
	movwf	(??_Remote+1)+0
	movf	(Remote@k),w
	subwf	(??_Remote+1)+0,f
	movf	0+(??_Remote+1)+0,w
	movwf	fsr0
	movf	(??_Remote+0)+0,w
	movwf	indf
	line	602
	
l10029:	
	decf	(Remote@k),f
	
l10031:	
	movf	(Remote@k),f
	skipz
	goto	u4021
	goto	u4020
u4021:
	goto	l10027
u4020:
	line	604
	
l10033:	
;main.c: 604: for (k=4;k>0; k--)
	movlw	(04h)
	movwf	(Remote@k)
	line	605
	
l10039:	
;main.c: 605: i2c_xmt_buf[(9-k)] = Buffer[(k-1)];
	movf	(Remote@k),w
	addlw	_Buffer+-1&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Remote+0)+0
	movlw	(_i2c_xmt_buf+09h)&0ffh
	movwf	(??_Remote+1)+0
	movf	(Remote@k),w
	subwf	(??_Remote+1)+0,f
	movf	0+(??_Remote+1)+0,w
	movwf	fsr0
	movf	(??_Remote+0)+0,w
	movwf	indf
	line	604
	
l10041:	
	decf	(Remote@k),f
	
l10043:	
	movf	(Remote@k),f
	skipz
	goto	u4031
	goto	u4030
u4031:
	goto	l10039
u4030:
	line	608
	
l1029:	
	return
	opt stack 0
GLOBAL	__end_of_Remote
	__end_of_Remote:
;; =============== function _Remote ends ============

	signat	_Remote,88
	global	_HopUpdate
psect	text1310,local,class=CODE,delta=2
global __ptext1310
__ptext1310:

;; *************** function _HopUpdate *****************
;; Defined at:
;;		line 269 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_WRword
;; This function is called by:
;;		_Remote
;; This function uses a non-reentrant model
;;
psect	text1310
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
	line	269
	global	__size_of_HopUpdate
	__size_of_HopUpdate	equ	__end_of_HopUpdate-_HopUpdate
	
_HopUpdate:	
	opt	stack 1
; Regs used in _HopUpdate: [wreg+status,2+status,0+pclath+cstack]
	line	270
	
l9775:	
;table.c: 270: if (!FHopOK)
	btfsc	(_FHopOK/8),(_FHopOK)&7
	goto	u3761
	goto	u3760
u3761:
	goto	l9779
u3760:
	goto	l2782
	line	273
	
l9779:	
;table.c: 273: Hop = ((unsigned int)Buffer[1]<<8) + Buffer[0];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_Buffer)+01h,w
	movwf	(_Hop+1)
	movf	(_Buffer),w
	movwf	(_Hop)
	line	274
;table.c: 274: Dato = Hop;
	movf	(_Hop+1),w
	movwf	(_Dato+1)
	movf	(_Hop),w
	movwf	(_Dato)
	line	275
	
l9781:	
;table.c: 275: WRword(Ind+4);
	movf	(_Ind+1),w
	movwf	(?_WRword+1)
	movf	(_Ind),w
	movwf	(?_WRword)
	movlw	04h
	addwf	(?_WRword),f
	skipnc
	incf	(?_WRword+1),f
	fcall	_WRword
	line	276
	
l9783:	
;table.c: 276: Dato = Hop;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Hop+1),w
	movwf	(_Dato+1)
	movf	(_Hop),w
	movwf	(_Dato)
	line	277
;table.c: 277: WRword(Ind+6);
	movf	(_Ind+1),w
	movwf	(?_WRword+1)
	movf	(_Ind),w
	movwf	(?_WRword)
	movlw	06h
	addwf	(?_WRword),f
	skipnc
	incf	(?_WRword+1),f
	fcall	_WRword
	line	278
	
l9785:	
;table.c: 278: FHopOK = 0;
	bcf	(_FHopOK/8),(_FHopOK)&7
	line	281
	
l2782:	
	return
	opt stack 0
GLOBAL	__end_of_HopUpdate
	__end_of_HopUpdate:
;; =============== function _HopUpdate ends ============

	signat	_HopUpdate,89
	global	_IDWrite
psect	text1311,local,class=CODE,delta=2
global __ptext1311
__ptext1311:

;; *************** function _IDWrite *****************
;; Defined at:
;;		line 243 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_WRword
;; This function is called by:
;;		_Remote
;; This function uses a non-reentrant model
;;
psect	text1311
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
	line	243
	global	__size_of_IDWrite
	__size_of_IDWrite	equ	__end_of_IDWrite-_IDWrite
	
_IDWrite:	
	opt	stack 1
; Regs used in _IDWrite: [wreg+status,2+status,0+pclath+cstack]
	line	244
	
l9759:	
;table.c: 244: if (!FLearn)
	btfsc	(_FLearn/8),(_FLearn)&7
	goto	u3751
	goto	u3750
u3751:
	goto	l9763
u3750:
	goto	l2778
	line	247
	
l9763:	
;table.c: 247: Dato = Buffer[7];
	movf	0+(_Buffer)+07h,w
	movwf	(_Dato)
	clrf	(_Dato+1)
	line	248
;table.c: 248: Dato = (Dato<<8) + Buffer[4];
	movf	(_Dato),w
	movwf	(??_IDWrite+0)+0
	movf	0+(_Buffer)+04h,w
	movwf	(_Dato)
	movf	(??_IDWrite+0)+0,w
	movwf	(_Dato+1)
	line	249
	
l9765:	
;table.c: 249: WRword(Ind);
	movf	(_Ind+1),w
	movwf	(?_WRword+1)
	movf	(_Ind),w
	movwf	(?_WRword)
	fcall	_WRword
	line	251
	
l9767:	
;table.c: 251: Dato = Buffer[6];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_Buffer)+06h,w
	movwf	(_Dato)
	clrf	(_Dato+1)
	line	252
	
l9769:	
;table.c: 252: Dato = (Dato<<8) + Buffer[5];
	movf	(_Dato),w
	movwf	(??_IDWrite+0)+0
	movf	0+(_Buffer)+05h,w
	movwf	(_Dato)
	movf	(??_IDWrite+0)+0,w
	movwf	(_Dato+1)
	line	253
	
l9771:	
;table.c: 253: WRword(Ind+2);
	movf	(_Ind+1),w
	movwf	(?_WRword+1)
	movf	(_Ind),w
	movwf	(?_WRword)
	movlw	02h
	addwf	(?_WRword),f
	skipnc
	incf	(?_WRword+1),f
	fcall	_WRword
	line	256
	
l2778:	
	return
	opt stack 0
GLOBAL	__end_of_IDWrite
	__end_of_IDWrite:
;; =============== function _IDWrite ends ============

	signat	_IDWrite,89
	global	_Insert
psect	text1312,local,class=CODE,delta=2
global __ptext1312
__ptext1312:

;; *************** function _Insert *****************
;; Defined at:
;;		line 217 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_RDword
;; This function is called by:
;;		_Remote
;; This function uses a non-reentrant model
;;
psect	text1312
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
	line	217
	global	__size_of_Insert
	__size_of_Insert	equ	__end_of_Insert-_Insert
	
_Insert:	
	opt	stack 1
; Regs used in _Insert: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	218
	
l9737:	
;table.c: 218: for (Ind=0; Ind < (8 * 8); Ind+=8)
	clrf	(_Ind)
	clrf	(_Ind+1)
	
l9739:	
	movlw	high(040h)
	subwf	(_Ind+1),w
	movlw	low(040h)
	skipnz
	subwf	(_Ind),w
	skipc
	goto	u3721
	goto	u3720
u3721:
	goto	l9743
u3720:
	goto	l9755
	line	220
	
l9743:	
;table.c: 219: {
;table.c: 220: RDword(Ind);
	movf	(_Ind+1),w
	movwf	(?_RDword+1)
	movf	(_Ind),w
	movwf	(?_RDword)
	fcall	_RDword
	line	221
	
l9745:	
;table.c: 221: FCode = (Dato>>8);
	movf	(_Dato+1),w
	movwf	(_FCode)
	line	223
	
l9747:	
;table.c: 223: if ( (FCode & 0xf0) == 0xf0)
	movf	(_FCode),w
	andlw	0F0h
	xorlw	0F0h
	skipz
	goto	u3731
	goto	u3730
u3731:
	goto	l9753
u3730:
	line	224
	
l9749:	
;table.c: 224: return 1;
	movlw	(01h)
	goto	l2774
	line	218
	
l9753:	
	movlw	08h
	addwf	(_Ind),f
	skipnc
	incf	(_Ind+1),f
	movlw	high(040h)
	subwf	(_Ind+1),w
	movlw	low(040h)
	skipnz
	subwf	(_Ind),w
	skipc
	goto	u3741
	goto	u3740
u3741:
	goto	l9743
u3740:
	line	227
	
l9755:	
;table.c: 225: }
;table.c: 227: return 0;
	movlw	(0)
	line	228
	
l2774:	
	return
	opt stack 0
GLOBAL	__end_of_Insert
	__end_of_Insert:
;; =============== function _Insert ends ============

	signat	_Insert,89
	global	_Find
psect	text1313,local,class=CODE,delta=2
global __ptext1313
__ptext1313:

;; *************** function _Find *****************
;; Defined at:
;;		line 167 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  Found           1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_RDword
;;		_RDnext
;; This function is called by:
;;		_Remote
;; This function uses a non-reentrant model
;;
psect	text1313
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
	line	167
	global	__size_of_Find
	__size_of_Find	equ	__end_of_Find-_Find
	
_Find:	
	opt	stack 1
; Regs used in _Find: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	169
	
l9699:	
;table.c: 168: unsigned char Found;
;table.c: 169: Found = 0;
	clrf	(Find@Found)
	line	171
;table.c: 171: for (Ind=0; Ind < (8 * 8); Ind+=8)
	clrf	(_Ind)
	clrf	(_Ind+1)
	
l9701:	
	movlw	high(040h)
	subwf	(_Ind+1),w
	movlw	low(040h)
	skipnz
	subwf	(_Ind),w
	skipc
	goto	u3651
	goto	u3650
u3651:
	goto	l9705
u3650:
	goto	l9727
	line	173
	
l9705:	
;table.c: 172: {
;table.c: 173: RDword( Ind);
	movf	(_Ind+1),w
	movwf	(?_RDword+1)
	movf	(_Ind),w
	movwf	(?_RDword)
	fcall	_RDword
	line	174
	
l9707:	
;table.c: 174: FCode = (Dato>>8);
	movf	(_Dato+1),w
	movwf	(_FCode)
	line	176
	
l9709:	
;table.c: 176: if ( (FCode & 0xf0) == 0xf0)
	movf	(_FCode),w
	andlw	0F0h
	xorlw	0F0h
	skipz
	goto	u3661
	goto	u3660
u3661:
	goto	l9713
u3660:
	goto	l9725
	line	179
	
l9713:	
;table.c: 179: if (Buffer[4] != (Dato & 0xff))
	movf	0+(_Buffer)+04h,w
	xorwf	(_Dato),w
	skipnz
	goto	u3671
	goto	u3670
u3671:
	goto	l9717
u3670:
	goto	l9725
	line	182
	
l9717:	
;table.c: 182: RDnext();
	fcall	_RDnext
	line	183
	
l9719:	
;table.c: 183: if ( ( (Dato & 0xff) == Buffer[5]) && ( (Dato>>8) == Buffer[6]))
	movf	0+(_Buffer)+05h,w
	xorwf	(_Dato),w
	skipz
	goto	u3681
	goto	u3680
u3681:
	goto	l9725
u3680:
	
l9721:	
	movf	(_Dato+1),w
	xorwf	0+(_Buffer)+06h,w
	skipz
	goto	u3691
	goto	u3690
u3691:
	goto	l9725
u3690:
	line	185
	
l9723:	
;table.c: 184: {
;table.c: 185: Found = 1;
	clrf	(Find@Found)
	incf	(Find@Found),f
	line	186
;table.c: 186: break;
	goto	l9727
	line	171
	
l9725:	
	movlw	08h
	addwf	(_Ind),f
	skipnc
	incf	(_Ind+1),f
	movlw	high(040h)
	subwf	(_Ind+1),w
	movlw	low(040h)
	skipnz
	subwf	(_Ind),w
	skipc
	goto	u3701
	goto	u3700
u3701:
	goto	l9705
u3700:
	line	190
	
l9727:	
;table.c: 187: }
;table.c: 188: }
;table.c: 190: if (Found == 1)
	decf	(Find@Found),w
	skipz
	goto	u3711
	goto	u3710
u3711:
	goto	l2767
u3710:
	line	192
	
l9729:	
;table.c: 191: {
;table.c: 192: RDnext();
	fcall	_RDnext
	line	193
	
l9731:	
;table.c: 193: EHop = Dato;
	movf	(_Dato+1),w
	movwf	(_EHop+1)
	movf	(_Dato),w
	movwf	(_EHop)
	line	194
	
l9733:	
;table.c: 194: RDnext();
	fcall	_RDnext
	line	195
;table.c: 195: ETemp= Dato;
	movf	(_Dato+1),w
	movwf	(_ETemp+1)
	movf	(_Dato),w
	movwf	(_ETemp)
	line	196
	
l2767:	
	line	198
;table.c: 196: }
;table.c: 198: return Found;
	movf	(Find@Found),w
	line	199
	
l2768:	
	return
	opt stack 0
GLOBAL	__end_of_Find
	__end_of_Find:
;; =============== function _Find ends ============

	signat	_Find,89
	global	_ClearMem
psect	text1314,local,class=CODE,delta=2
global __ptext1314
__ptext1314:

;; *************** function _ClearMem *****************
;; Defined at:
;;		line 292 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_WRword
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1314
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
	line	292
	global	__size_of_ClearMem
	__size_of_ClearMem	equ	__end_of_ClearMem-_ClearMem
	
_ClearMem:	
	opt	stack 2
; Regs used in _ClearMem: [wreg+status,2+status,0+pclath+cstack]
	line	294
	
l9685:	
;table.c: 293: char i;
;table.c: 294: for (Ind=0; Ind < (8 * 8); Ind+=8)
	clrf	(_Ind)
	clrf	(_Ind+1)
	
l9687:	
	movlw	high(040h)
	subwf	(_Ind+1),w
	movlw	low(040h)
	skipnz
	subwf	(_Ind),w
	skipc
	goto	u3641
	goto	u3640
u3641:
	goto	l9691
u3640:
	goto	l2787
	line	296
	
l9691:	
;table.c: 295: {
;table.c: 296: Dato = 0xffff;
	movlw	low(0FFFFh)
	movwf	(_Dato)
	movlw	high(0FFFFh)
	movwf	((_Dato))+1
	line	297
	
l9693:	
;table.c: 297: WRword( Ind);
	movf	(_Ind+1),w
	movwf	(?_WRword+1)
	movf	(_Ind),w
	movwf	(?_WRword)
	fcall	_WRword
	line	294
	
l9695:	
	movlw	08h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_Ind),f
	skipnc
	incf	(_Ind+1),f
	goto	l9687
	line	300
	
l2787:	
	return
	opt stack 0
GLOBAL	__end_of_ClearMem
	__end_of_ClearMem:
;; =============== function _ClearMem ends ============

	signat	_ClearMem,89
	global	_lcd_put_char
psect	text1315,local,class=CODE,delta=2
global __ptext1315
__ptext1315:

;; *************** function _lcd_put_char *****************
;; Defined at:
;;		line 213 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    5[BANK0 ] unsigned char 
;;  t               1    7[BANK0 ] unsigned char 
;;  i               1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_lcd_putch
;; This function is called by:
;;		_main
;;		_Remote
;; This function uses a non-reentrant model
;;
psect	text1315
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
	line	213
	global	__size_of_lcd_put_char
	__size_of_lcd_put_char	equ	__end_of_lcd_put_char-_lcd_put_char
	
_lcd_put_char:	
	opt	stack 2
; Regs used in _lcd_put_char: [wreg+status,2+status,0+pclath+cstack]
;lcd_put_char@c stored from wreg
	movwf	(lcd_put_char@c)
	line	214
	
l9663:	
;lcd.c: 214: char i = 0;
	clrf	(lcd_put_char@i)
	line	216
;lcd.c: 216: for (i = 0; i < 2; i++)
	clrf	(lcd_put_char@i)
	line	218
	
l9669:	
;lcd.c: 217: {
;lcd.c: 218: t = (0xF0 & c) >> 4;
	swapf	(lcd_put_char@c),w
	andlw	(0ffh shr 4) & 0ffh
	movwf	(lcd_put_char@t)
	movlw	(0Fh)
	andwf	(lcd_put_char@t),f
	line	221
	
l9671:	
;lcd.c: 221: if (t > 0x9)
	movlw	(0Ah)
	subwf	(lcd_put_char@t),w
	skipc
	goto	u3621
	goto	u3620
u3621:
	goto	l9675
u3620:
	line	222
	
l9673:	
;lcd.c: 222: t = t + 0x37;
	movlw	(037h)
	addwf	(lcd_put_char@t),f
	goto	l9677
	line	224
	
l9675:	
;lcd.c: 223: else
;lcd.c: 224: t = t + 0x30;
	movlw	(030h)
	addwf	(lcd_put_char@t),f
	line	227
	
l9677:	
;lcd.c: 227: lcd_putch(t);
	movf	(lcd_put_char@t),w
	fcall	_lcd_putch
	line	230
	
l9679:	
;lcd.c: 230: c = c << 4;
swapf	(lcd_put_char@c),f
	movlw	240
	andwf	(lcd_put_char@c),f

	line	216
	
l9681:	
	incf	(lcd_put_char@i),f
	
l9683:	
	movlw	(02h)
	subwf	(lcd_put_char@i),w
	skipc
	goto	u3631
	goto	u3630
u3631:
	goto	l9669
u3630:
	line	232
	
l3667:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_put_char
	__end_of_lcd_put_char:
;; =============== function _lcd_put_char ends ============

	signat	_lcd_put_char,4216
	global	_Display_Splash
psect	text1316,local,class=CODE,delta=2
global __ptext1316
__ptext1316:

;; *************** function _Display_Splash *****************
;; Defined at:
;;		line 688 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _dcnt           1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_lcd_clear
;;		_lcd_goto
;;		_lcd_puts
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1316
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
	line	688
	global	__size_of_Display_Splash
	__size_of_Display_Splash	equ	__end_of_Display_Splash-_Display_Splash
	
_Display_Splash:	
	opt	stack 2
; Regs used in _Display_Splash: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	689
	
l9653:	
;main.c: 689: lcd_clear();
	fcall	_lcd_clear
	line	690
;main.c: 690: lcd_goto(0x00);
	movlw	(0)
	fcall	_lcd_goto
	line	691
	
l9655:	
;main.c: 691: lcd_puts("    KeeLoq 3 ");
	movlw	low(STR_15|8000h)
	movwf	(?_lcd_puts)
	movlw	high(STR_15|8000h)
	movwf	((?_lcd_puts))+1
	fcall	_lcd_puts
	line	692
	
l9657:	
;main.c: 692: { unsigned char _dcnt; _dcnt = (200)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0C9h)
	movwf	(Display_Splash@_dcnt)
	
l1065:	
	decfsz	(Display_Splash@_dcnt),f
	goto	u3611
	goto	u3610
u3611:
	goto	l1065
u3610:
	line	693
	
l9659:	
;main.c: 693: lcd_goto(0x40);
	movlw	(040h)
	fcall	_lcd_goto
	line	694
	
l9661:	
;main.c: 694: lcd_puts("Development Kit");
	movlw	low(STR_16|8000h)
	movwf	(?_lcd_puts)
	movlw	high(STR_16|8000h)
	movwf	((?_lcd_puts))+1
	fcall	_lcd_puts
	line	695
	
l1068:	
	return
	opt stack 0
GLOBAL	__end_of_Display_Splash
	__end_of_Display_Splash:
;; =============== function _Display_Splash ends ============

	signat	_Display_Splash,88
	global	_lcd_init
psect	text1317,local,class=CODE,delta=2
global __ptext1317
__ptext1317:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 141 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _dcnt           1    7[BANK0 ] unsigned char 
;;  _dcnt           1    6[BANK0 ] unsigned char 
;;  _dcnt           1    5[BANK0 ] unsigned char 
;;  _dcnt           1    4[BANK0 ] unsigned char 
;;  _dcnt           1    3[BANK0 ] unsigned char 
;;  i               1    8[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_DelayMs
;;		_lcd_clear
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1317
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
	line	141
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 2
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	144
	
l9563:	
;lcd.c: 142: char i;
;lcd.c: 144: for(i=0;i<2;i++)
	clrf	(lcd_init@i)
	line	146
	
l9569:	
;lcd.c: 145: {
;lcd.c: 146: TRISA &= 0x10;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	andwf	(133)^080h,f	;volatile
	line	147
	
l9571:	
;lcd.c: 147: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	148
	
l9573:	
;lcd.c: 148: LCD_RW = 0;
	bcf	(47/8),(47)&7
	line	149
	
l9575:	
;lcd.c: 149: DelayMs(50);
	movlw	(032h)
	fcall	_DelayMs
	line	150
	
l9577:	
;lcd.c: 150: LCD_RS = 0;
	bcf	(46/8),(46)&7
	line	151
	
l9579:	
;lcd.c: 151: DelayMs(50);
	movlw	(032h)
	fcall	_DelayMs
	line	153
	
l9581:	
;lcd.c: 153: lcd_clear();
	fcall	_lcd_clear
	line	155
	
l9583:	
;lcd.c: 155: PORTA=0x02;
	movlw	(02h)
	movwf	(5)	;volatile
	line	156
	
l9585:	
;lcd.c: 156: ((LCD_EN = 1) , (LCD_EN=0));
	bsf	(45/8),(45)&7
	
l9587:	
	bcf	(45/8),(45)&7
	line	157
	
l9589:	
;lcd.c: 157: { unsigned char _dcnt; _dcnt = (50)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(033h)
	movwf	(lcd_init@_dcnt)
	
l3638:	
	decfsz	(lcd_init@_dcnt),f
	goto	u3551
	goto	u3550
u3551:
	goto	l3638
u3550:
	line	158
	
l9591:	
;lcd.c: 158: PORTA=0x08;
	movlw	(08h)
	movwf	(5)	;volatile
	line	159
	
l9593:	
;lcd.c: 159: ((LCD_EN = 1) , (LCD_EN=0));
	bsf	(45/8),(45)&7
	
l9595:	
	bcf	(45/8),(45)&7
	line	160
;lcd.c: 160: { unsigned char _dcnt; _dcnt = (50)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(033h)
	movwf	(lcd_init@_dcnt_1882)
	
l3641:	
	decfsz	(lcd_init@_dcnt_1882),f
	goto	u3561
	goto	u3560
u3561:
	goto	l3641
u3560:
	line	162
	
l9597:	
;lcd.c: 162: PORTA=0x00;
	clrf	(5)	;volatile
	line	163
	
l9599:	
;lcd.c: 163: ((LCD_EN = 1) , (LCD_EN=0));
	bsf	(45/8),(45)&7
	
l9601:	
	bcf	(45/8),(45)&7
	line	164
	
l9603:	
;lcd.c: 164: PORTA=0x08;
	movlw	(08h)
	movwf	(5)	;volatile
	line	165
	
l9605:	
;lcd.c: 165: ((LCD_EN = 1) , (LCD_EN=0));
	bsf	(45/8),(45)&7
	
l9607:	
	bcf	(45/8),(45)&7
	line	166
	
l9609:	
;lcd.c: 166: { unsigned char _dcnt; _dcnt = (50)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(033h)
	movwf	(lcd_init@_dcnt_1883)
	
l3644:	
	decfsz	(lcd_init@_dcnt_1883),f
	goto	u3571
	goto	u3570
u3571:
	goto	l3644
u3570:
	line	168
	
l9611:	
;lcd.c: 168: PORTA=0x00;
	clrf	(5)	;volatile
	line	169
	
l9613:	
;lcd.c: 169: ((LCD_EN = 1) , (LCD_EN=0));
	bsf	(45/8),(45)&7
	
l9615:	
	bcf	(45/8),(45)&7
	line	170
	
l9617:	
;lcd.c: 170: PORTA=0x0C;
	movlw	(0Ch)
	movwf	(5)	;volatile
	line	171
	
l9619:	
;lcd.c: 171: ((LCD_EN = 1) , (LCD_EN=0));
	bsf	(45/8),(45)&7
	
l9621:	
	bcf	(45/8),(45)&7
	line	172
	
l9623:	
;lcd.c: 172: { unsigned char _dcnt; _dcnt = (50)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(033h)
	movwf	(lcd_init@_dcnt_1884)
	
l3647:	
	decfsz	(lcd_init@_dcnt_1884),f
	goto	u3581
	goto	u3580
u3581:
	goto	l3647
u3580:
	line	174
	
l9625:	
;lcd.c: 174: PORTA=0x00;
	clrf	(5)	;volatile
	line	175
	
l9627:	
;lcd.c: 175: ((LCD_EN = 1) , (LCD_EN=0));
	bsf	(45/8),(45)&7
	
l9629:	
	bcf	(45/8),(45)&7
	line	176
	
l9631:	
;lcd.c: 176: PORTA=0x01;
	movlw	(01h)
	movwf	(5)	;volatile
	line	177
	
l9633:	
;lcd.c: 177: ((LCD_EN = 1) , (LCD_EN=0));
	bsf	(45/8),(45)&7
	
l9635:	
	bcf	(45/8),(45)&7
	line	179
	
l9637:	
;lcd.c: 179: DelayMs(2);
	movlw	(02h)
	fcall	_DelayMs
	line	181
	
l9639:	
;lcd.c: 181: PORTA=0x00;
	clrf	(5)	;volatile
	line	182
	
l9641:	
;lcd.c: 182: ((LCD_EN = 1) , (LCD_EN=0));
	bsf	(45/8),(45)&7
	
l9643:	
	bcf	(45/8),(45)&7
	line	183
	
l9645:	
;lcd.c: 183: PORTA=0x06;
	movlw	(06h)
	movwf	(5)	;volatile
	line	184
	
l9647:	
;lcd.c: 184: { unsigned char _dcnt; _dcnt = (50)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(033h)
	movwf	(lcd_init@_dcnt_1885)
	
l3650:	
	decfsz	(lcd_init@_dcnt_1885),f
	goto	u3591
	goto	u3590
u3591:
	goto	l3650
u3590:
	line	144
	
l9649:	
	incf	(lcd_init@i),f
	
l9651:	
	movlw	(02h)
	subwf	(lcd_init@i),w
	skipc
	goto	u3601
	goto	u3600
u3601:
	goto	l9569
u3600:
	line	186
	
l3653:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_putch
psect	text1318,local,class=CODE,delta=2
global __ptext1318
__ptext1318:

;; *************** function _lcd_putch *****************
;; Defined at:
;;		line 110 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    3[BANK0 ] unsigned char 
;;  _dcnt           1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_write
;; This function is called by:
;;		_lcd_put_char
;; This function uses a non-reentrant model
;;
psect	text1318
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
	line	110
	global	__size_of_lcd_putch
	__size_of_lcd_putch	equ	__end_of_lcd_putch-_lcd_putch
	
_lcd_putch:	
	opt	stack 2
; Regs used in _lcd_putch: [wreg+status,2+status,0+pclath+cstack]
;lcd_putch@c stored from wreg
	movwf	(lcd_putch@c)
	line	111
	
l9557:	
;lcd.c: 111: LCD_RS = 1;
	bsf	(46/8),(46)&7
	line	112
	
l9559:	
;lcd.c: 112: lcd_write(c);
	movf	(lcd_putch@c),w
	fcall	_lcd_write
	line	113
	
l9561:	
;lcd.c: 113: { unsigned char _dcnt; _dcnt = (40)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(029h)
	movwf	(lcd_putch@_dcnt)
	
l3615:	
	decfsz	(lcd_putch@_dcnt),f
	goto	u3541
	goto	u3540
u3541:
	goto	l3615
u3540:
	line	114
	
l3618:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_putch
	__end_of_lcd_putch:
;; =============== function _lcd_putch ends ============

	signat	_lcd_putch,4216
	global	_WRword
psect	text1319,local,class=CODE,delta=2
global __ptext1319
__ptext1319:

;; *************** function _WRword *****************
;; Defined at:
;;		line 144 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
;; Parameters:    Size  Location     Type
;;  Ind             2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/60
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_EEWrite
;; This function is called by:
;;		_IDWrite
;;		_HopUpdate
;;		_ClearMem
;; This function uses a non-reentrant model
;;
psect	text1319
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
	line	144
	global	__size_of_WRword
	__size_of_WRword	equ	__end_of_WRword-_WRword
	
_WRword:	
	opt	stack 2
; Regs used in _WRword: [wreg+status,2+status,0+pclath+cstack]
	line	145
	
l9551:	
;table.c: 145: EEWrite( Ind, Dato);
	movf	(_Dato),w
	movwf	(?_EEWrite)
	movf	(WRword@Ind),w
	fcall	_EEWrite
	line	146
	
l9553:	
;table.c: 146: GIE = 1;
	bsf	(95/8),(95)&7
	line	147
;table.c: 147: EEWrite( Ind+1, Dato>>8);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Dato+1),w
	movwf	(?_EEWrite)
	incf	(WRword@Ind),w
	fcall	_EEWrite
	line	148
	
l9555:	
;table.c: 148: GIE = 1;
	bsf	(95/8),(95)&7
	line	149
	
l2758:	
	return
	opt stack 0
GLOBAL	__end_of_WRword
	__end_of_WRword:
;; =============== function _WRword ends ============

	signat	_WRword,4216
	global	_RDword
psect	text1320,local,class=CODE,delta=2
global __ptext1320
__ptext1320:

;; *************** function _RDword *****************
;; Defined at:
;;		line 123 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
;; Parameters:    Size  Location     Type
;;  Ind             2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_EERead
;; This function is called by:
;;		_Find
;;		_Insert
;; This function uses a non-reentrant model
;;
psect	text1320
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
	line	123
	global	__size_of_RDword
	__size_of_RDword	equ	__end_of_RDword-_RDword
	
_RDword:	
	opt	stack 1
; Regs used in _RDword: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	124
	
l9547:	
;table.c: 124: Dato = EERead(Ind);
	movf	(RDword@Ind),w
	fcall	_EERead
	movwf	(_Dato)
	clrf	(_Dato+1)
	line	125
	
l9549:	
;table.c: 125: Dato += (unsigned int) EERead( Ind+1) <<8;
	incf	(RDword@Ind),w
	fcall	_EERead
	movwf	(??_RDword+0)+0
	clrf	(??_RDword+0)+0+1
	movlw	08h
	movwf	btemp+1
u3535:
	clrc
	rlf	(??_RDword+0)+0,f
	rlf	(??_RDword+0)+1,f
	decfsz	btemp+1,f
	goto	u3535
	movf	0+(??_RDword+0)+0,w
	addwf	(_Dato),f
	skipnc
	incf	(_Dato+1),f
	movf	1+(??_RDword+0)+0,w
	addwf	(_Dato+1),f
	line	126
	
l2752:	
	return
	opt stack 0
GLOBAL	__end_of_RDword
	__end_of_RDword:
;; =============== function _RDword ends ============

	signat	_RDword,4216
	global	_HopCHK
psect	text1321,local,class=CODE,delta=2
global __ptext1321
__ptext1321:

;; *************** function _HopCHK *****************
;; Defined at:
;;		line 180 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\keygen.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  COUNTCHECK      2    0[BANK0 ] volatile int 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ReqResync
;; This function is called by:
;;		_Remote
;; This function uses a non-reentrant model
;;
psect	text1321
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\keygen.c"
	line	180
	global	__size_of_HopCHK
	__size_of_HopCHK	equ	__end_of_HopCHK-_HopCHK
	
_HopCHK:	
	opt	stack 2
; Regs used in _HopCHK: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	183
	
l9493:	
;keygen.c: 181: volatile signed int COUNTCHECK;
;keygen.c: 183: FHopOK = 0;
	bcf	(_FHopOK/8),(_FHopOK)&7
	line	184
;keygen.c: 184: FSame = 0;
	bcf	(_FSame/8),(_FSame)&7
	line	187
	
l9495:	
;keygen.c: 187: Hop = ((unsigned int)Buffer[1] << 8) + Buffer[0];
	movf	0+(_Buffer)+01h,w
	movwf	(_Hop+1)
	movf	(_Buffer),w
	movwf	(_Hop)
	line	189
	
l9497:	
;keygen.c: 189: if ( F2Chance)
	btfss	(_F2Chance/8),(_F2Chance)&7
	goto	u3461
	goto	u3460
u3461:
	goto	l9507
u3460:
	line	190
	
l9499:	
;keygen.c: 190: if ( NextHop == Hop)
	movf	(_Hop+1),w
	xorwf	(_NextHop+1),w
	skipz
	goto	u3475
	movf	(_Hop),w
	xorwf	(_NextHop),w
u3475:

	skipz
	goto	u3471
	goto	u3470
u3471:
	goto	l9507
u3470:
	line	192
	
l9501:	
;keygen.c: 191: {
;keygen.c: 192: F2Chance = 0;
	bcf	(_F2Chance/8),(_F2Chance)&7
	line	193
;keygen.c: 193: FHopOK = 1;
	bsf	(_FHopOK/8),(_FHopOK)&7
	line	194
	
l9503:	
;keygen.c: 194: return 1;
	movlw	(01h)
	goto	l1936
	line	198
	
l9507:	
;keygen.c: 195: }
;keygen.c: 198: if ( EHop != ETemp)
	movf	(_ETemp+1),w
	xorwf	(_EHop+1),w
	skipz
	goto	u3485
	movf	(_ETemp),w
	xorwf	(_EHop),w
u3485:

	skipnz
	goto	u3481
	goto	u3480
u3481:
	goto	l9513
u3480:
	line	199
	
l9509:	
;keygen.c: 199: return ReqResync();
	fcall	_ReqResync
	goto	l1936
	line	202
	
l9513:	
;keygen.c: 202: COUNTCHECK = Hop - EHop;
	movf	(_Hop+1),w
	movwf	(HopCHK@COUNTCHECK+1)
	movf	(_Hop),w
	movwf	(HopCHK@COUNTCHECK)
	movf	(_EHop),w
	subwf	(HopCHK@COUNTCHECK),f
	movf	(_EHop+1),w
	skipc
	decf	(HopCHK@COUNTCHECK+1),f
	subwf	(HopCHK@COUNTCHECK+1),f
	line	204
	
l9515:	
;keygen.c: 204: if ( COUNTCHECK < 0)
	btfss	(HopCHK@COUNTCHECK+1),7	;volatile
	goto	u3491
	goto	u3490
u3491:
	goto	l9523
u3490:
	line	205
	
l9517:	
;keygen.c: 205: return 0;
	movlw	(0)
	goto	l1936
	line	207
	
l9523:	
;keygen.c: 207: else if (COUNTCHECK <= 16)
	movf	(HopCHK@COUNTCHECK+1),w	;volatile
	xorlw	80h
	movwf	btemp+1
	movlw	(high(011h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3505
	movlw	low(011h)
	subwf	(HopCHK@COUNTCHECK),w	;volatile
u3505:

	skipnc
	goto	u3501
	goto	u3500
u3501:
	goto	l9535
u3500:
	line	209
	
l9525:	
;keygen.c: 208: {
;keygen.c: 209: if ( ETemp == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_ETemp+1)),w
	iorwf	((_ETemp)),w
	skipz
	goto	u3511
	goto	u3510
u3511:
	goto	l1941
u3510:
	line	210
	
l9527:	
;keygen.c: 210: FSame = 1;
	bsf	(_FSame/8),(_FSame)&7
	
l1941:	
	line	212
;keygen.c: 212: FHopOK = 1;
	bsf	(_FHopOK/8),(_FHopOK)&7
	goto	l9503
	line	216
	
l9535:	
;keygen.c: 216: else if (COUNTCHECK < 1000)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(HopCHK@COUNTCHECK+1),w	;volatile
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03E8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3525
	movlw	low(03E8h)
	subwf	(HopCHK@COUNTCHECK),w	;volatile
u3525:

	skipnc
	goto	u3521
	goto	u3520
u3521:
	goto	l9517
u3520:
	goto	l9509
	line	221
	
l1936:	
	return
	opt stack 0
GLOBAL	__end_of_HopCHK
	__end_of_HopCHK:
;; =============== function _HopCHK ends ============

	signat	_HopCHK,89
	global	_put_byte
psect	text1322,local,class=CODE,delta=2
global __ptext1322
__ptext1322:

;; *************** function _put_byte *****************
;; Defined at:
;;		line 12 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\eusart.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    1[BANK0 ] unsigned char 
;;  t               1    3[BANK0 ] unsigned char 
;;  i               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_putch
;; This function is called by:
;;		_Remote
;; This function uses a non-reentrant model
;;
psect	text1322
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\eusart.c"
	line	12
	global	__size_of_put_byte
	__size_of_put_byte	equ	__end_of_put_byte-_put_byte
	
_put_byte:	
	opt	stack 2
; Regs used in _put_byte: [wreg+status,2+status,0+pclath+cstack]
;put_byte@c stored from wreg
	movwf	(put_byte@c)
	line	13
	
l9471:	
;eusart.c: 13: char i = 0;
	clrf	(put_byte@i)
	line	15
;eusart.c: 15: for (i = 0; i < 2; i++)
	clrf	(put_byte@i)
	line	17
	
l9477:	
;eusart.c: 16: {
;eusart.c: 17: t = (0xF0 & c) >> 4;
	swapf	(put_byte@c),w
	andlw	(0ffh shr 4) & 0ffh
	movwf	(put_byte@t)
	movlw	(0Fh)
	andwf	(put_byte@t),f
	line	20
	
l9479:	
;eusart.c: 20: if (t > 0x9)
	movlw	(0Ah)
	subwf	(put_byte@t),w
	skipc
	goto	u3441
	goto	u3440
u3441:
	goto	l9483
u3440:
	line	21
	
l9481:	
;eusart.c: 21: t = t + 0x37;
	movlw	(037h)
	addwf	(put_byte@t),f
	goto	l9485
	line	23
	
l9483:	
;eusart.c: 22: else
;eusart.c: 23: t = t + 0x30;
	movlw	(030h)
	addwf	(put_byte@t),f
	line	26
	
l9485:	
;eusart.c: 26: putch(t);
	movf	(put_byte@t),w
	fcall	_putch
	line	29
	
l9487:	
;eusart.c: 29: c = c << 4;
swapf	(put_byte@c),f
	movlw	240
	andwf	(put_byte@c),f

	line	15
	
l9489:	
	incf	(put_byte@i),f
	
l9491:	
	movlw	(02h)
	subwf	(put_byte@i),w
	skipc
	goto	u3451
	goto	u3450
u3451:
	goto	l9477
u3450:
	line	31
	
l6163:	
	return
	opt stack 0
GLOBAL	__end_of_put_byte
	__end_of_put_byte:
;; =============== function _put_byte ends ============

	signat	_put_byte,4216
	global	_NormalKeyGen
psect	text1323,local,class=CODE,delta=2
global __ptext1323
__ptext1323:

;; *************** function _NormalKeyGen *****************
;; Defined at:
;;		line 93 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\keygen.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  SKEYtemp        4   11[BANK0 ] unsigned char [4]
;;  HOPtemp         4    7[BANK0 ] unsigned char [4]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_memcpy
;;		_LoadManufCode
;;		_Decrypt
;; This function is called by:
;;		_Remote
;; This function uses a non-reentrant model
;;
psect	text1323
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\keygen.c"
	line	93
	global	__size_of_NormalKeyGen
	__size_of_NormalKeyGen	equ	__end_of_NormalKeyGen-_NormalKeyGen
	
_NormalKeyGen:	
	opt	stack 2
; Regs used in _NormalKeyGen: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	103
	
l9441:	
;keygen.c: 94: unsigned char HOPtemp[4];
;keygen.c: 95: unsigned char SKEYtemp[4];
;keygen.c: 99: if (( SEED[0] != Buffer[4]) ||
;keygen.c: 100: ( SEED[1] != Buffer[5]) ||
;keygen.c: 101: ( SEED[2] != Buffer[6]) ||
;keygen.c: 102: ( SEED[3] != (Buffer[7] & 0x0f)) ||
;keygen.c: 103: (COut == 0))
	movf	0+(_Buffer)+04h,w
	xorwf	(_SEED),w
	skipz
	goto	u3391
	goto	u3390
u3391:
	goto	l9451
u3390:
	
l9443:	
	movf	0+(_SEED)+01h,w
	xorwf	0+(_Buffer)+05h,w
	skipz
	goto	u3401
	goto	u3400
u3401:
	goto	l9451
u3400:
	
l9445:	
	movf	0+(_SEED)+02h,w
	xorwf	0+(_Buffer)+06h,w
	skipz
	goto	u3411
	goto	u3410
u3411:
	goto	l9451
u3410:
	
l9447:	
	movf	0+(_Buffer)+07h,w
	andlw	0Fh
	xorwf	0+(_SEED)+03h,w
	skipz
	goto	u3421
	goto	u3420
u3421:
	goto	l9451
u3420:
	
l9449:	
	movf	(_COut),f
	skipz
	goto	u3431
	goto	u3430
u3431:
	goto	l1924
u3430:
	line	105
	
l9451:	
;keygen.c: 104: {
;keygen.c: 105: memcpy( (unsigned int *) HOPtemp, (unsigned int *) Buffer, 4);
	movlw	(_Buffer)&0ffh
	movwf	(?_memcpy)
	movlw	04h
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(NormalKeyGen@HOPtemp)&0ffh
	fcall	_memcpy
	line	106
;keygen.c: 106: memcpy( SEED, &Buffer[4], 4);
	movlw	(_Buffer+04h)&0ffh
	movwf	(?_memcpy)
	movlw	04h
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(_SEED)&0ffh
	fcall	_memcpy
	line	107
	
l9453:	
;keygen.c: 107: SEED[3] &= 0x0f;
	movlw	(0Fh)
	andwf	0+(_SEED)+03h,f
	line	110
	
l9455:	
;keygen.c: 110: memcpy( Buffer, SEED, 4);
	movlw	(_SEED)&0ffh
	movwf	(?_memcpy)
	movlw	04h
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(_Buffer)&0ffh
	fcall	_memcpy
	line	111
	
l9457:	
;keygen.c: 111: Buffer[3] |= 0x20;
	bsf	0+(_Buffer)+03h+(5/8),(5)&7
	line	112
	
l9459:	
;keygen.c: 112: LoadManufCode();
	fcall	_LoadManufCode
	line	113
	
l9461:	
;keygen.c: 113: Decrypt();
	fcall	_Decrypt
	line	114
	
l9463:	
;keygen.c: 114: memcpy( SKEYtemp, Buffer, 4);
	movlw	(_Buffer)&0ffh
	movwf	(?_memcpy)
	movlw	04h
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(NormalKeyGen@SKEYtemp)&0ffh
	fcall	_memcpy
	line	117
	
l9465:	
;keygen.c: 117: memcpy( Buffer, SEED, 4);
	movlw	(_SEED)&0ffh
	movwf	(?_memcpy)
	movlw	04h
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(_Buffer)&0ffh
	fcall	_memcpy
	line	118
	
l9467:	
;keygen.c: 118: Buffer[3] |= 0x60;
	movlw	(060h)
	iorwf	0+(_Buffer)+03h,f
	line	119
	
l9469:	
;keygen.c: 119: LoadManufCode();
	fcall	_LoadManufCode
	line	120
;keygen.c: 120: Decrypt();
	fcall	_Decrypt
	line	121
;keygen.c: 121: memcpy( &DKEY[4], Buffer, 4);
	movlw	(_Buffer)&0ffh
	movwf	(?_memcpy)
	movlw	04h
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(_DKEY+04h)&0ffh
	fcall	_memcpy
	line	122
;keygen.c: 122: memcpy( DKEY, SKEYtemp, 4);
	movlw	(NormalKeyGen@SKEYtemp)&0ffh
	movwf	(?_memcpy)
	movlw	04h
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(_DKEY)&0ffh
	fcall	_memcpy
	line	125
;keygen.c: 125: memcpy( Buffer, HOPtemp, 4);
	movlw	(NormalKeyGen@HOPtemp)&0ffh
	movwf	(?_memcpy)
	movlw	04h
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(_Buffer)&0ffh
	fcall	_memcpy
	line	130
;keygen.c: 126: }
	
l1924:	
	return
	opt stack 0
GLOBAL	__end_of_NormalKeyGen
	__end_of_NormalKeyGen:
;; =============== function _NormalKeyGen ends ============

	signat	_NormalKeyGen,88
	global	_lcd_puts
psect	text1324,local,class=CODE,delta=2
global __ptext1324
__ptext1324:

;; *************** function _lcd_puts *****************
;; Defined at:
;;		line 84 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    3[BANK0 ] PTR const unsigned char 
;;		 -> STR_20(6), STR_19(6), STR_18(16), STR_17(14), 
;;		 -> STR_16(16), STR_15(14), STR_11(7), STR_10(6), 
;;		 -> STR_5(13), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_write
;; This function is called by:
;;		_main
;;		_Remote
;;		_Display_Splash
;; This function uses a non-reentrant model
;;
psect	text1324
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
	line	84
	global	__size_of_lcd_puts
	__size_of_lcd_puts	equ	__end_of_lcd_puts-_lcd_puts
	
_lcd_puts:	
	opt	stack 3
; Regs used in _lcd_puts: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	85
	
l9433:	
;lcd.c: 85: LCD_RS = 1;
	bsf	(46/8),(46)&7
	line	86
;lcd.c: 86: while(*s)
	goto	l9439
	line	87
	
l9435:	
;lcd.c: 87: lcd_write(*s++);
	movf	(lcd_puts@s+1),w
	movwf	btemp+1
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write
	
l9437:	
	incf	(lcd_puts@s),f
	skipnz
	incf	(lcd_puts@s+1),f
	line	86
	
l9439:	
	movf	(lcd_puts@s+1),w
	movwf	btemp+1
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u3381
	goto	u3380
u3381:
	goto	l9435
u3380:
	line	88
	
l3600:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_puts
	__end_of_lcd_puts:
;; =============== function _lcd_puts ends ============

	signat	_lcd_puts,4216
	global	_lcd_goto
psect	text1325,local,class=CODE,delta=2
global __ptext1325
__ptext1325:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 118 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
;; Parameters:    Size  Location     Type
;;  pos             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  pos             1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_write
;; This function is called by:
;;		_main
;;		_Remote
;;		_Display_Splash
;; This function uses a non-reentrant model
;;
psect	text1325
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
	line	118
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 3
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
;lcd_goto@pos stored from wreg
	movwf	(lcd_goto@pos)
	line	119
	
l9429:	
;lcd.c: 119: LCD_RS = 0;
	bcf	(46/8),(46)&7
	line	120
	
l9431:	
;lcd.c: 120: lcd_write(0x80+pos);
	movf	(lcd_goto@pos),w
	addlw	080h
	fcall	_lcd_write
	line	121
	
l3621:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,4216
	global	_lcd_clear
psect	text1326,local,class=CODE,delta=2
global __ptext1326
__ptext1326:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 76 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_write
;;		_DelayMs
;; This function is called by:
;;		_main
;;		_Remote
;;		_Display_Splash
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text1326
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
	line	76
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 3
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	77
	
l9425:	
;lcd.c: 77: LCD_RS = 0;
	bcf	(46/8),(46)&7
	line	78
	
l9427:	
;lcd.c: 78: lcd_write(0x1);
	movlw	(01h)
	fcall	_lcd_write
	line	79
;lcd.c: 79: DelayMs(40);
	movlw	(028h)
	fcall	_DelayMs
	line	80
	
l3594:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_Delay
psect	text1327,local,class=CODE,delta=2
global __ptext1327
__ptext1327:

;; *************** function _Delay *****************
;; Defined at:
;;		line 386 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
;; Parameters:    Size  Location     Type
;;  Count           2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    2[BANK0 ] volatile unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1327
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
	line	386
	global	__size_of_Delay
	__size_of_Delay	equ	__end_of_Delay-_Delay
	
_Delay:	
	opt	stack 4
; Regs used in _Delay: [wreg+status,2+status,0]
	line	389
	
l9419:	
;main.c: 387: unsigned volatile int i;
;main.c: 389: for (i=0;i<Count; i++)
	clrf	(Delay@i)	;volatile
	clrf	(Delay@i+1)	;volatile
	goto	l9423
	line	390
	
l989:	
	line	391
;main.c: 390: {
;main.c: 391: _nop();
	nop
	line	392
;main.c: 392: _nop();
	nop
	line	393
;main.c: 393: _nop();
	nop
	line	394
;main.c: 394: _nop();
	nop
	line	395
;main.c: 395: _nop();
	nop
	line	389
	
l9421:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Delay@i),f	;volatile
	skipnz
	incf	(Delay@i+1),f	;volatile
	
l9423:	
	movf	(Delay@Count+1),w
	subwf	(Delay@i+1),w	;volatile
	skipz
	goto	u3375
	movf	(Delay@Count),w
	subwf	(Delay@i),w	;volatile
u3375:
	skipc
	goto	u3371
	goto	u3370
u3371:
	goto	l989
u3370:
	line	397
	
l991:	
	return
	opt stack 0
GLOBAL	__end_of_Delay
	__end_of_Delay:
;; =============== function _Delay ends ============

	signat	_Delay,4216
	global	_printf
psect	text1328,local,class=CODE,delta=2
global __ptext1328
__ptext1328:

;; *************** function _printf *****************
;; Defined at:
;;		line 461 in file "C:\Program Files\HI-TECH Software\PICC\9.80\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  f               2    1[BANK0 ] PTR const unsigned char 
;;		 -> STR_14(27), STR_13(27), STR_12(26), STR_9(3), 
;;		 -> STR_8(9), STR_7(3), STR_6(9), STR_4(27), 
;;		 -> STR_3(16), STR_2(27), STR_1(21), 
;; Auto vars:     Size  Location     Type
;;  _val            4    0        struct .
;;  c               1    5[BANK0 ] char 
;;  flag            1    0        unsigned char 
;;  prec            1    0        char 
;;  ap              1    0        PTR void [1]
;;		 -> ?_printf(2), 
;; Return value:  Size  Location     Type
;;                  2    1[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_putch
;; This function is called by:
;;		_main
;;		_Remote
;; This function uses a non-reentrant model
;;
psect	text1328
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\doprnt.c"
	line	461
	global	__size_of_printf
	__size_of_printf	equ	__end_of_printf-_printf
	
_printf:	
	opt	stack 2
; Regs used in _printf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	540
	
l9413:	
	goto	l9417
	line	545
	
l9415:	
	movf	(printf@c),w
	fcall	_putch
	line	540
	
l9417:	
	movf	(printf@f+1),w
	movwf	(??_printf+0)+0+1
	movf	(printf@f),w
	movwf	(??_printf+0)+0
	incf	(printf@f),f
	skipnz
	incf	(printf@f+1),f
	movf	1+(??_printf+0)+0,w
	movwf	btemp+1
	movf	0+(??_printf+0)+0,w
	movwf	fsr0
	fcall	stringtab
	movwf	(printf@c)
	movf	((printf@c)),f
	skipz
	goto	u3361
	goto	u3360
u3361:
	goto	l9415
u3360:
	line	1533
	
l6176:	
	return
	opt stack 0
GLOBAL	__end_of_printf
	__end_of_printf:
;; =============== function _printf ends ============

	signat	_printf,602
	global	_Init_886
psect	text1329,local,class=CODE,delta=2
global __ptext1329
__ptext1329:

;; *************** function _Init_886 *****************
;; Defined at:
;;		line 638 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_init_eusart
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1329
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
	line	638
	global	__size_of_Init_886
	__size_of_Init_886	equ	__end_of_Init_886-_Init_886
	
_Init_886:	
	opt	stack 3
; Regs used in _Init_886: [wreg+status,2+status,0+pclath+cstack]
	line	641
	
l9363:	
;main.c: 641: OSCCON =0x70;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	642
	
l9365:	
;main.c: 642: ANSEL = 0x00;
	bsf	status, 6	;RP1=1, select bank3
	clrf	(392)^0180h	;volatile
	line	643
	
l9367:	
;main.c: 643: ANSELH= 0x00;
	clrf	(393)^0180h	;volatile
	line	647
	
l9369:	
;main.c: 647: TRISC5=0;
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1085/8)^080h,(1085)&7
	line	648
	
l9371:	
;main.c: 648: TRISC7=1;
	bsf	(1087/8)^080h,(1087)&7
	line	649
	
l9373:	
;main.c: 649: TRISC6=0;
	bcf	(1086/8)^080h,(1086)&7
	line	650
	
l9375:	
;main.c: 650: TRISA=0x00;
	clrf	(133)^080h	;volatile
	line	651
	
l9377:	
;main.c: 651: TRISA4=1;
	bsf	(1068/8)^080h,(1068)&7
	line	652
	
l9379:	
;main.c: 652: TRISB0=1;
	bsf	(1072/8)^080h,(1072)&7
	line	653
	
l9381:	
;main.c: 653: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	656
	
l9383:	
;main.c: 656: TRISB1=1;
	bsf	(1073/8)^080h,(1073)&7
	line	657
	
l9385:	
;main.c: 657: TRISB2=1;
	bsf	(1074/8)^080h,(1074)&7
	line	658
	
l9387:	
;main.c: 658: TRISB3=1;
	bsf	(1075/8)^080h,(1075)&7
	line	660
	
l9389:	
;main.c: 660: TRISC0=0;
	bcf	(1080/8)^080h,(1080)&7
	line	661
	
l9391:	
;main.c: 661: TRISC1=0;
	bcf	(1081/8)^080h,(1081)&7
	line	662
	
l9393:	
;main.c: 662: TRISC2=0;
	bcf	(1082/8)^080h,(1082)&7
	line	663
	
l9395:	
;main.c: 663: TRISB4=0;
	bcf	(1076/8)^080h,(1076)&7
	line	665
	
l9397:	
;main.c: 665: WPUB |= 0x0E;
	movlw	(0Eh)
	iorwf	(149)^080h,f	;volatile
	line	666
	
l9399:	
;main.c: 666: RBPU = 0;
	bcf	(1039/8)^080h,(1039)&7
	line	668
	
l9401:	
;main.c: 668: PORTA=0x10;
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	669
	
l9403:	
;main.c: 669: PORTB=0x0E;
	movlw	(0Eh)
	movwf	(6)	;volatile
	line	670
	
l9405:	
;main.c: 670: PORTC=0x00;
	clrf	(7)	;volatile
	line	674
	
l9407:	
;main.c: 674: INTCON = 0x60;
	movlw	(060h)
	movwf	(11)	;volatile
	line	676
	
l9409:	
;main.c: 676: OPTION = 0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	678
	
l9411:	
;main.c: 678: init_eusart();
	fcall	_init_eusart
	line	679
	
l1062:	
	return
	opt stack 0
GLOBAL	__end_of_Init_886
	__end_of_Init_886:
;; =============== function _Init_886 ends ============

	signat	_Init_886,88
	global	_putch
psect	text1330,local,class=CODE,delta=2
global __ptext1330
__ptext1330:

;; *************** function _putch *****************
;; Defined at:
;;		line 5 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\eusart.c"
;; Parameters:    Size  Location     Type
;;  byte            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  byte            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_put_byte
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text1330
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\eusart.c"
	line	5
	global	__size_of_putch
	__size_of_putch	equ	__end_of_putch-_putch
	
_putch:	
	opt	stack 2
; Regs used in _putch: [wreg]
;putch@byte stored from wreg
	movwf	(putch@byte)
	line	6
	
l9359:	
;eusart.c: 6: while(TXIF == 0);
	
l6153:	
	btfss	(100/8),(100)&7
	goto	u3351
	goto	u3350
u3351:
	goto	l6153
u3350:
	line	7
	
l9361:	
;eusart.c: 7: TXREG = byte;
	movf	(putch@byte),w
	movwf	(25)	;volatile
	line	8
	
l6156:	
	return
	opt stack 0
GLOBAL	__end_of_putch
	__end_of_putch:
;; =============== function _putch ends ============

	signat	_putch,4216
	global	_DelayMs
psect	text1331,local,class=CODE,delta=2
global __ptext1331
__ptext1331:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 45 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\delay.c"
;; Parameters:    Size  Location     Type
;;  cnt             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cnt             1    0[BANK0 ] unsigned char 
;;  _dcnt           1    2[BANK0 ] unsigned char 
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_clear
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text1331
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\delay.c"
	line	45
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 3
; Regs used in _DelayMs: [wreg]
;DelayMs@cnt stored from wreg
	movwf	(DelayMs@cnt)
	line	54
;delay.c: 53: unsigned char i;
;delay.c: 54: do {
	
l3676:	
	line	55
	
l9357:	
;delay.c: 55: i = 4;
	movlw	(04h)
	movwf	(DelayMs@i)
	line	56
;delay.c: 56: do {
	
l3677:	
	line	57
;delay.c: 57: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0FBh)
	movwf	(DelayMs@_dcnt)
	
l3678:	
	decfsz	(DelayMs@_dcnt),f
	goto	u3321
	goto	u3320
u3321:
	goto	l3678
u3320:
	
l3680:	
	line	58
;delay.c: 58: } while(--i);
	decfsz	(DelayMs@i),f
	goto	u3331
	goto	u3330
u3331:
	goto	l3677
u3330:
	
l3681:	
	line	59
;delay.c: 59: } while(--cnt);
	decfsz	(DelayMs@cnt),f
	goto	u3341
	goto	u3340
u3341:
	goto	l3676
u3340:
	line	61
	
l3683:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
	global	_lcd_write
psect	text1332,local,class=CODE,delta=2
global __ptext1332
__ptext1332:

;; *************** function _lcd_write *****************
;; Defined at:
;;		line 44 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    2[BANK0 ] unsigned char 
;;  _dcnt           1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_clear
;;		_lcd_puts
;;		_lcd_putch
;;		_lcd_goto
;; This function uses a non-reentrant model
;;
psect	text1332
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\lcd.c"
	line	44
	global	__size_of_lcd_write
	__size_of_lcd_write	equ	__end_of_lcd_write-_lcd_write
	
_lcd_write:	
	opt	stack 2
; Regs used in _lcd_write: [wreg+status,2+status,0]
;lcd_write@c stored from wreg
	movwf	(lcd_write@c)
	line	45
	
l8259:	
;lcd.c: 45: PORTA = (PORTA & 0xF0) | (c >> 4);
	movf	(lcd_write@c),w
	movwf	(??_lcd_write+0)+0
	movlw	04h
u2115:
	clrc
	rrf	(??_lcd_write+0)+0,f
	addlw	-1
	skipz
	goto	u2115
	movf	(5),w
	andlw	0F0h
	iorwf	0+(??_lcd_write+0)+0,w
	movwf	(5)	;volatile
	line	46
	
l8261:	
;lcd.c: 46: ((LCD_EN = 1) , (LCD_EN=0));
	bsf	(45/8),(45)&7
	
l8263:	
	bcf	(45/8),(45)&7
	line	47
;lcd.c: 47: PORTA = (PORTA & 0xF0) | (0x0F & c);
	movlw	(0Fh)
	andwf	(lcd_write@c),w
	movwf	(??_lcd_write+0)+0
	movf	(5),w
	andlw	0F0h
	iorwf	0+(??_lcd_write+0)+0,w
	movwf	(5)	;volatile
	line	48
	
l8265:	
;lcd.c: 48: ((LCD_EN = 1) , (LCD_EN=0));
	bsf	(45/8),(45)&7
	
l8267:	
	bcf	(45/8),(45)&7
	line	49
	
l8269:	
;lcd.c: 49: { unsigned char _dcnt; _dcnt = (40)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(029h)
	movwf	(lcd_write@_dcnt)
	
l3580:	
	decfsz	(lcd_write@_dcnt),f
	goto	u2121
	goto	u2120
u2121:
	goto	l3580
u2120:
	line	50
	
l3583:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write
	__end_of_lcd_write:
;; =============== function _lcd_write ends ============

	signat	_lcd_write,4216
	global	_RDnext
psect	text1333,local,class=CODE,delta=2
global __ptext1333
__ptext1333:

;; *************** function _RDnext *****************
;; Defined at:
;;		line 132 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Find
;; This function uses a non-reentrant model
;;
psect	text1333
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
	line	132
	global	__size_of_RDnext
	__size_of_RDnext	equ	__end_of_RDnext-_RDnext
	
_RDnext:	
	opt	stack 2
; Regs used in _RDnext: [wreg+status,2+status,0+btemp+1]
	line	134
	
l8247:	
;table.c: 134: EEADR++;
	bsf	status, 6	;RP1=1, select bank2
	incf	(269)^0100h,f	;volatile
	line	135
	
l8249:	
;table.c: 135: Dato = ((RD=1), EEDATA);
	bsf	status, 5	;RP0=1, select bank3
	bsf	(3168/8)^0180h,(3168)&7
	
l8251:	
	bcf	status, 5	;RP0=0, select bank2
	movf	(268)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_Dato)
	clrf	(_Dato+1)
	line	136
	
l8253:	
;table.c: 136: EEADR++;
	bsf	status, 6	;RP1=1, select bank2
	incf	(269)^0100h,f	;volatile
	line	137
	
l8255:	
;table.c: 137: Dato += ((RD=1), EEDATA)<<8;
	bsf	status, 5	;RP0=1, select bank3
	bsf	(3168/8)^0180h,(3168)&7
	
l8257:	
	bcf	status, 5	;RP0=0, select bank2
	movf	(268)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RDnext+0)+0
	clrf	(??_RDnext+0)+0+1
	movlw	08h
	movwf	btemp+1
u2105:
	clrc
	rlf	(??_RDnext+0)+0,f
	rlf	(??_RDnext+0)+1,f
	decfsz	btemp+1,f
	goto	u2105
	movf	0+(??_RDnext+0)+0,w
	addwf	(_Dato),f
	skipnc
	incf	(_Dato+1),f
	movf	1+(??_RDnext+0)+0,w
	addwf	(_Dato+1),f
	line	138
	
l2755:	
	return
	opt stack 0
GLOBAL	__end_of_RDnext
	__end_of_RDnext:
;; =============== function _RDnext ends ============

	signat	_RDnext,88
	global	_EEWrite
psect	text1334,local,class=CODE,delta=2
global __ptext1334
__ptext1334:

;; *************** function _EEWrite *****************
;; Defined at:
;;		line 103 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
;; Parameters:    Size  Location     Type
;;  EE_Adress       1    wreg     unsigned char 
;;  EE_Data         1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EE_Adress       1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/60
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_WRword
;; This function uses a non-reentrant model
;;
psect	text1334
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
	line	103
	global	__size_of_EEWrite
	__size_of_EEWrite	equ	__end_of_EEWrite-_EEWrite
	
_EEWrite:	
	opt	stack 2
; Regs used in _EEWrite: [wreg]
;EEWrite@EE_Adress stored from wreg
	movwf	(EEWrite@EE_Adress)
	line	104
	
l9345:	
;table.c: 104: EEPGD = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3175/8)^0180h,(3175)&7
	line	105
	
l9347:	
;table.c: 105: EEDAT = EE_Data;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(EEWrite@EE_Data),w
	bsf	status, 6	;RP1=1, select bank2
	movwf	(268)^0100h	;volatile
	line	106
;table.c: 106: EEADR = EE_Adress;
	bcf	status, 6	;RP1=0, select bank0
	movf	(EEWrite@EE_Adress),w
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	108
	
l9349:	
;table.c: 108: GIE = 0;
	bcf	(95/8),(95)&7
	line	109
	
l9351:	
;table.c: 109: GIE = 0;
	bcf	(95/8),(95)&7
	line	110
	
l9353:	
;table.c: 110: WREN = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	(3170/8)^0180h,(3170)&7
	line	111
;table.c: 111: EECON2 = 0x55;
	movlw	(055h)
	movwf	(397)^0180h	;volatile
	line	112
;table.c: 112: EECON2 = 0xAA;
	movlw	(0AAh)
	movwf	(397)^0180h	;volatile
	line	113
	
l9355:	
;table.c: 113: WR = 1;
	bsf	(3169/8)^0180h,(3169)&7
	line	115
;table.c: 115: while(WR);
	
l2746:	
	btfsc	(3169/8)^0180h,(3169)&7
	goto	u3311
	goto	u3310
u3311:
	goto	l2746
u3310:
	line	117
	
l2749:	
	return
	opt stack 0
GLOBAL	__end_of_EEWrite
	__end_of_EEWrite:
;; =============== function _EEWrite ends ============

	signat	_EEWrite,8313
	global	_EERead
psect	text1335,local,class=CODE,delta=2
global __ptext1335
__ptext1335:

;; *************** function _EERead *****************
;; Defined at:
;;		line 90 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
;; Parameters:    Size  Location     Type
;;  EE_Adress       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  EE_Adress       1    0[BANK0 ] unsigned char 
;;  EE_Data         1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_RDword
;; This function uses a non-reentrant model
;;
psect	text1335
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\table.c"
	line	90
	global	__size_of_EERead
	__size_of_EERead	equ	__end_of_EERead-_EERead
	
_EERead:	
	opt	stack 1
; Regs used in _EERead: [wreg]
;EERead@EE_Adress stored from wreg
	line	92
	movwf	(EERead@EE_Adress)
	
l9337:	
;table.c: 91: unsigned char EE_Data;
;table.c: 92: EEPGD = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3175/8)^0180h,(3175)&7
	line	93
	
l9339:	
;table.c: 93: EEADR = EE_Adress;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(EERead@EE_Adress),w
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	94
	
l9341:	
;table.c: 94: RD = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	(3168/8)^0180h,(3168)&7
	line	95
;table.c: 95: EE_Data = EEDAT;
	bcf	status, 5	;RP0=0, select bank2
	movf	(268)^0100h,w	;volatile
	bcf	status, 6	;RP1=0, select bank0
	movwf	(EERead@EE_Data)
	line	96
;table.c: 96: return EE_Data;
	movf	(EERead@EE_Data),w
	line	97
	
l2743:	
	return
	opt stack 0
GLOBAL	__end_of_EERead
	__end_of_EERead:
;; =============== function _EERead ends ============

	signat	_EERead,4217
	global	_ReqResync
psect	text1336,local,class=CODE,delta=2
global __ptext1336
__ptext1336:

;; *************** function _ReqResync *****************
;; Defined at:
;;		line 168 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\keygen.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_HopCHK
;; This function uses a non-reentrant model
;;
psect	text1336
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\keygen.c"
	line	168
	global	__size_of_ReqResync
	__size_of_ReqResync	equ	__end_of_ReqResync-_ReqResync
	
_ReqResync:	
	opt	stack 2
; Regs used in _ReqResync: [wreg+status,2+status,0]
	line	169
	
l9327:	
;keygen.c: 169: F2Chance= 1;
	bsf	(_F2Chance/8),(_F2Chance)&7
	line	170
	
l9329:	
;keygen.c: 170: NextHop = Hop+1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Hop+1),w
	movwf	(_NextHop+1)
	movf	(_Hop),w
	movwf	(_NextHop)
	
l9331:	
	incf	(_NextHop),f
	skipnz
	incf	(_NextHop+1),f
	line	171
	
l9333:	
;keygen.c: 171: return 0;
	movlw	(0)
	line	172
	
l1931:	
	return
	opt stack 0
GLOBAL	__end_of_ReqResync
	__end_of_ReqResync:
;; =============== function _ReqResync ends ============

	signat	_ReqResync,89
	global	_LoadManufCode
psect	text1337,local,class=CODE,delta=2
global __ptext1337
__ptext1337:

;; *************** function _LoadManufCode *****************
;; Defined at:
;;		line 69 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\keygen.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_NormalKeyGen
;; This function uses a non-reentrant model
;;
psect	text1337
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\keygen.c"
	line	69
	global	__size_of_LoadManufCode
	__size_of_LoadManufCode	equ	__end_of_LoadManufCode-_LoadManufCode
	
_LoadManufCode:	
	opt	stack 2
; Regs used in _LoadManufCode: [wreg]
	line	70
	
l9323:	
;keygen.c: 70: DKEY[0]=0xEF;
	movlw	(0EFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_DKEY)^080h
	line	71
;keygen.c: 71: DKEY[1]=0xCD;
	movlw	(0CDh)
	movwf	0+(_DKEY)^080h+01h
	line	72
;keygen.c: 72: DKEY[2]=0xAB;
	movlw	(0ABh)
	movwf	0+(_DKEY)^080h+02h
	line	73
;keygen.c: 73: DKEY[3]=0x89;
	movlw	(089h)
	movwf	0+(_DKEY)^080h+03h
	line	74
;keygen.c: 74: DKEY[4]=0x67;
	movlw	(067h)
	movwf	0+(_DKEY)^080h+04h
	line	75
;keygen.c: 75: DKEY[5]=0x45;
	movlw	(045h)
	movwf	0+(_DKEY)^080h+05h
	line	76
;keygen.c: 76: DKEY[6]=0x23;
	movlw	(023h)
	movwf	0+(_DKEY)^080h+06h
	line	77
	
l9325:	
;keygen.c: 77: DKEY[7]=0x01;
	clrf	0+(_DKEY)^080h+07h
	incf	0+(_DKEY)^080h+07h,f
	line	78
	
l1917:	
	return
	opt stack 0
GLOBAL	__end_of_LoadManufCode
	__end_of_LoadManufCode:
;; =============== function _LoadManufCode ends ============

	signat	_LoadManufCode,88
	global	_init_eusart
psect	text1338,local,class=CODE,delta=2
global __ptext1338
__ptext1338:

;; *************** function _init_eusart *****************
;; Defined at:
;;		line 34 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\eusart.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Init_886
;; This function uses a non-reentrant model
;;
psect	text1338
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\eusart.c"
	line	34
	global	__size_of_init_eusart
	__size_of_init_eusart	equ	__end_of_init_eusart-_init_eusart
	
_init_eusart:	
	opt	stack 3
; Regs used in _init_eusart: [wreg]
	line	35
	
l9321:	
;eusart.c: 35: SPBRG = (51&0xFF);
	movlw	(033h)
	movwf	(153)^080h	;volatile
	line	41
;eusart.c: 41: TXSTA = 0b00100100;
	movlw	(024h)
	movwf	(152)^080h	;volatile
	line	42
;eusart.c: 42: RCSTA = 0b10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	line	43
	
l6166:	
	return
	opt stack 0
GLOBAL	__end_of_init_eusart
	__end_of_init_eusart:
;; =============== function _init_eusart ends ============

	signat	_init_eusart,88
	global	_DecCHK
psect	text1339,local,class=CODE,delta=2
global __ptext1339
__ptext1339:

;; *************** function _DecCHK *****************
;; Defined at:
;;		line 142 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\keygen.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Remote
;; This function uses a non-reentrant model
;;
psect	text1339
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\keygen.c"
	line	142
	global	__size_of_DecCHK
	__size_of_DecCHK	equ	__end_of_DecCHK-_DecCHK
	
_DecCHK:	
	opt	stack 3
; Regs used in _DecCHK: [wreg+status,2+status,0]
	line	152
	
l9311:	
;keygen.c: 152: if ( ((Buffer[3] ^ Buffer[7]) & 0xf0)!= 0)
	movf	0+(_Buffer)+03h,w
	xorwf	0+(_Buffer)+07h,w
	andlw	0F0h
	btfsc	status,2
	goto	u3301
	goto	u3300
u3301:
	goto	l9317
u3300:
	line	153
	
l9313:	
;keygen.c: 153: return 0;
	movlw	(0)
	goto	l1928
	line	155
	
l9317:	
;keygen.c: 155: return 1;
	movlw	(01h)
	line	156
	
l1928:	
	return
	opt stack 0
GLOBAL	__end_of_DecCHK
	__end_of_DecCHK:
;; =============== function _DecCHK ends ============

	signat	_DecCHK,89
	global	_Decrypt
psect	text1340,local,class=CODE,delta=2
global __ptext1340
__ptext1340:

;; *************** function _Decrypt *****************
;; Defined at:
;;		line 47 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\KeeLoqAlg.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  p               1    4[BANK0 ] char 
;;  j               1    3[BANK0 ] unsigned char 
;;  i               1    2[BANK0 ] unsigned char 
;;  keep            1    1[BANK0 ] unsigned char 
;;  key             1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Remote
;;		_NormalKeyGen
;; This function uses a non-reentrant model
;;
psect	text1340
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\KeeLoqAlg.c"
	line	47
	global	__size_of_Decrypt
	__size_of_Decrypt	equ	__end_of_Decrypt-_Decrypt
	
_Decrypt:	
	opt	stack 3
; Regs used in _Decrypt: [wreg-fsr0h+status,2+status,0]
	line	52
	
l9247:	
;KeeLoqAlg.c: 48: unsigned char i, j, key;
;KeeLoqAlg.c: 49: signed char p;
;KeeLoqAlg.c: 50: unsigned char keep;
;KeeLoqAlg.c: 52: p = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(Decrypt@p)
	incf	(Decrypt@p),f
	line	54
	
l9249:	
;KeeLoqAlg.c: 54: for (j=66; j>0; j--)
	movlw	(042h)
	movwf	(Decrypt@j)
	line	56
	
l9255:	
;KeeLoqAlg.c: 55: {
;KeeLoqAlg.c: 56: key = DKEY[p--];
	movf	(Decrypt@p),w
	addlw	_DKEY&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(Decrypt@key)
	
l9257:	
	decf	(Decrypt@p),f
	line	57
	
l9259:	
;KeeLoqAlg.c: 57: if ( p < 0)
	btfss	(Decrypt@p),7
	goto	u3171
	goto	u3170
u3171:
	goto	l9263
u3170:
	line	58
	
l9261:	
;KeeLoqAlg.c: 58: p += 8;
	movlw	(08h)
	addwf	(Decrypt@p),f
	line	59
	
l9263:	
;KeeLoqAlg.c: 59: for (i=8; i>0; i--)
	movlw	(08h)
	movwf	(Decrypt@i)
	line	60
	
l1873:	
	line	62
;KeeLoqAlg.c: 60: {
;KeeLoqAlg.c: 62: if ( (( (Buffer[3]) & (1<<(6))) != 0))
	btfss	0+(_Buffer)+03h,(6)&7
	goto	u3181
	goto	u3180
u3181:
	goto	l1875
u3180:
	line	64
	
l9267:	
;KeeLoqAlg.c: 63: {
;KeeLoqAlg.c: 64: if ( !(( (Buffer[3]) & (1<<(1))) != 0))
	btfsc	0+(_Buffer)+03h,(1)&7
	goto	u3191
	goto	u3190
u3191:
	goto	l9271
u3190:
	line	65
	
l9269:	
;KeeLoqAlg.c: 65: aux = 0b00111010;
	movlw	(03Ah)
	movwf	(_aux)
	goto	l9277
	line	67
	
l9271:	
;KeeLoqAlg.c: 66: else
;KeeLoqAlg.c: 67: aux = 0b01011100;
	movlw	(05Ch)
	movwf	(_aux)
	goto	l9277
	line	69
	
l1875:	
	line	71
;KeeLoqAlg.c: 69: else
;KeeLoqAlg.c: 70: {
;KeeLoqAlg.c: 71: if ( !(( (Buffer[3]) & (1<<(1))) != 0))
	btfsc	0+(_Buffer)+03h,(1)&7
	goto	u3201
	goto	u3200
u3201:
	goto	l9275
u3200:
	line	72
	
l9273:	
;KeeLoqAlg.c: 72: aux = 0b01110100;
	movlw	(074h)
	movwf	(_aux)
	goto	l9277
	line	74
	
l9275:	
;KeeLoqAlg.c: 73: else
;KeeLoqAlg.c: 74: aux = 0b00101110;
	movlw	(02Eh)
	movwf	(_aux)
	line	79
	
l9277:	
;KeeLoqAlg.c: 75: }
;KeeLoqAlg.c: 79: if ( (( (Buffer[2]) & (1<<(3))) != 0))
	btfss	0+(_Buffer)+02h,(3)&7
	goto	u3211
	goto	u3210
u3211:
	goto	l9285
u3210:
	line	87
	
l9279:	
;KeeLoqAlg.c: 80: {
;KeeLoqAlg.c: 87: keep = aux >> 4;
	swapf	(_aux),w
	andlw	(0ffh shr 4) & 0ffh
	movwf	(Decrypt@keep)
	line	89
;KeeLoqAlg.c: 89: keep = keep & 0x0f;
	movlw	(0Fh)
	andwf	(Decrypt@keep),f
	line	91
;KeeLoqAlg.c: 91: aux = aux & 0x0f;
	movlw	(0Fh)
	andwf	(_aux),f
	line	93
	
l9281:	
;KeeLoqAlg.c: 93: aux = aux << 4;
swapf	(_aux),f
	movlw	240
	andwf	(_aux),f

	line	95
	
l9283:	
;KeeLoqAlg.c: 95: aux = aux | keep;
	movf	(Decrypt@keep),w
	iorwf	(_aux),f
	line	97
	
l9285:	
;KeeLoqAlg.c: 96: }
;KeeLoqAlg.c: 97: if ( (( (Buffer[1]) & (1<<(0))) != 0))
	btfss	0+(_Buffer)+01h,(0)&7
	goto	u3221
	goto	u3220
u3221:
	goto	l1882
u3220:
	line	98
	
l9287:	
;KeeLoqAlg.c: 98: aux<<=2;
	clrc
	rlf	(_aux),f
	clrc
	rlf	(_aux),f
	
l1882:	
	line	99
;KeeLoqAlg.c: 99: if ((( (Buffer[0]) & (1<<(0))) != 0))
	btfss	(_Buffer),(0)&7
	goto	u3231
	goto	u3230
u3231:
	goto	l9291
u3230:
	line	100
	
l9289:	
;KeeLoqAlg.c: 100: aux<<=1;
	clrc
	rlf	(_aux),f
	line	103
	
l9291:	
;KeeLoqAlg.c: 103: aux ^= Buffer[1] ^ Buffer[3] ^ key;
	movf	0+(_Buffer)+01h,w
	xorwf	0+(_Buffer)+03h,w
	xorwf	(Decrypt@key),w
	xorwf	(_aux),f
	line	106
	
l9293:	
;KeeLoqAlg.c: 106: STATUS &= 0xFE;
	bcf	(3)+(0/8),(0)&7	;volatile
	line	107
	
l9295:	
;KeeLoqAlg.c: 107: Buffer[3] <<= 1;
	clrc
	rlf	0+(_Buffer)+03h,f
	line	108
	
l9297:	
;KeeLoqAlg.c: 108: if ((( (Buffer[2]) & (1<<(7))) != 0))
	btfss	0+(_Buffer)+02h,(7)&7
	goto	u3241
	goto	u3240
u3241:
	goto	l1884
u3240:
	line	109
	
l9299:	
;KeeLoqAlg.c: 109: Buffer[3] |= 0x01;
	bsf	0+(_Buffer)+03h+(0/8),(0)&7
	
l1884:	
	line	110
;KeeLoqAlg.c: 110: STATUS &= 0xFE;
	bcf	(3)+(0/8),(0)&7	;volatile
	line	111
;KeeLoqAlg.c: 111: Buffer[2] <<=1;
	clrc
	rlf	0+(_Buffer)+02h,f
	line	112
;KeeLoqAlg.c: 112: if ((( (Buffer[1]) & (1<<(7))) != 0))
	btfss	0+(_Buffer)+01h,(7)&7
	goto	u3251
	goto	u3250
u3251:
	goto	l1885
u3250:
	line	113
	
l9301:	
;KeeLoqAlg.c: 113: Buffer[2] |= 0x01;
	bsf	0+(_Buffer)+02h+(0/8),(0)&7
	
l1885:	
	line	114
;KeeLoqAlg.c: 114: STATUS &= 0xFE;
	bcf	(3)+(0/8),(0)&7	;volatile
	line	115
;KeeLoqAlg.c: 115: Buffer[1] <<=1;
	clrc
	rlf	0+(_Buffer)+01h,f
	line	116
;KeeLoqAlg.c: 116: if ((( (Buffer[0]) & (1<<(7))) != 0))
	btfss	(_Buffer),(7)&7
	goto	u3261
	goto	u3260
u3261:
	goto	l1886
u3260:
	line	117
	
l9303:	
;KeeLoqAlg.c: 117: Buffer[1] |= 0x01;
	bsf	0+(_Buffer)+01h+(0/8),(0)&7
	
l1886:	
	line	118
;KeeLoqAlg.c: 118: STATUS &= 0xFE;
	bcf	(3)+(0/8),(0)&7	;volatile
	line	119
;KeeLoqAlg.c: 119: Buffer[0] <<=1;
	clrc
	rlf	(_Buffer),f
	line	120
;KeeLoqAlg.c: 120: if ((( (aux) & (1<<(7))) != 0))
	btfss	(_aux),(7)&7
	goto	u3271
	goto	u3270
u3271:
	goto	l1887
u3270:
	line	121
	
l9305:	
;KeeLoqAlg.c: 121: Buffer[0] |= 0x01;
	bsf	(_Buffer)+(0/8),(0)&7
	
l1887:	
	line	133
;KeeLoqAlg.c: 133: key<<=1;
	clrc
	rlf	(Decrypt@key),f
	line	59
	
l9307:	
	decf	(Decrypt@i),f
	movf	(Decrypt@i),f
	skipz
	goto	u3281
	goto	u3280
u3281:
	goto	l1873
u3280:
	line	54
	
l9309:	
	decf	(Decrypt@j),f
	movf	(Decrypt@j),f
	skipz
	goto	u3291
	goto	u3290
u3291:
	goto	l9255
u3290:
	line	136
	
l1888:	
	return
	opt stack 0
GLOBAL	__end_of_Decrypt
	__end_of_Decrypt:
;; =============== function _Decrypt ends ============

	signat	_Decrypt,88
	global	_memcpy
psect	text1341,local,class=CODE,delta=2
global __ptext1341
__ptext1341:

;; *************** function _memcpy *****************
;; Defined at:
;;		line 10 in file "../../common/memcpy.c"
;; Parameters:    Size  Location     Type
;;  d1              1    wreg     PTR void 
;;		 -> NormalKeyGen@SKEYtemp(4), NormalKeyGen@HOPtemp(4), DKEY(8), SEED(4), 
;;		 -> Buffer(22), 
;;  s1              1    0[BANK0 ] PTR const void 
;;		 -> NormalKeyGen@SKEYtemp(4), NormalKeyGen@HOPtemp(4), SEED(4), RX_Buffer(22), 
;;		 -> Buffer(22), 
;;  n               2    1[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  d1              1    4[BANK0 ] PTR void 
;;		 -> NormalKeyGen@SKEYtemp(4), NormalKeyGen@HOPtemp(4), DKEY(8), SEED(4), 
;;		 -> Buffer(22), 
;;  s               1    6[BANK0 ] PTR const unsigned char 
;;		 -> NormalKeyGen@SKEYtemp(4), NormalKeyGen@HOPtemp(4), SEED(4), RX_Buffer(22), 
;;		 -> Buffer(22), 
;;  d               1    5[BANK0 ] PTR unsigned char 
;;		 -> NormalKeyGen@SKEYtemp(4), NormalKeyGen@HOPtemp(4), DKEY(8), SEED(4), 
;;		 -> Buffer(22), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Remote
;;		_NormalKeyGen
;; This function uses a non-reentrant model
;;
psect	text1341
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\memcpy.c"
	line	10
	global	__size_of_memcpy
	__size_of_memcpy	equ	__end_of_memcpy-_memcpy
	
_memcpy:	
	opt	stack 2
; Regs used in _memcpy: [wreg-fsr0h+status,2+status,0]
;memcpy@d1 stored from wreg
	line	19
	movwf	(memcpy@d1)
	
l7917:	
	movf	(memcpy@s1),w
	movwf	(memcpy@s)
	line	20
	movf	(memcpy@d1),w
	movwf	(memcpy@d)
	line	21
	goto	l7925
	line	22
	
l7919:	
	movf	(memcpy@s),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_memcpy+0)+0
	movf	(memcpy@d),w
	movwf	fsr0
	movf	(??_memcpy+0)+0,w
	movwf	indf
	
l7921:	
	incf	(memcpy@s),f
	
l7923:	
	incf	(memcpy@d),f
	line	21
	
l7925:	
	movlw	low(01h)
	subwf	(memcpy@n),f
	movlw	high(01h)
	skipc
	decf	(memcpy@n+1),f
	subwf	(memcpy@n+1),f
	incf	((memcpy@n)),w
	skipnz
	incf	((memcpy@n+1)),w

	skipz
	goto	u1591
	goto	u1590
u1591:
	goto	l7919
u1590:
	line	24
	
l6182:	
	return
	opt stack 0
GLOBAL	__end_of_memcpy
	__end_of_memcpy:
;; =============== function _memcpy ends ============

	signat	_memcpy,12409
	global	_i2c_init
psect	text1342,local,class=CODE,delta=2
global __ptext1342
__ptext1342:

;; *************** function _i2c_init *****************
;; Defined at:
;;		line 50 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1    0        unsigned char 
;;  val             1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1342
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\i2c.c"
	line	50
	global	__size_of_i2c_init
	__size_of_i2c_init	equ	__end_of_i2c_init-_i2c_init
	
_i2c_init:	
	opt	stack 4
; Regs used in _i2c_init: [wreg+status,2]
	line	55
	
l9227:	
;i2c.c: 51: unsigned char val;
;i2c.c: 52: char j;
;i2c.c: 55: TRISC4=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1084/8)^080h,(1084)&7
	line	56
;i2c.c: 56: TRISC3=1;
	bsf	(1083/8)^080h,(1083)&7
	line	58
	
l9229:	
;i2c.c: 58: SSPADD= 0x30;
	movlw	(030h)
	movwf	(147)^080h	;volatile
	line	60
	
l9231:	
;i2c.c: 60: SSPSTAT=0x00;
	clrf	(148)^080h	;volatile
	line	62
	
l9233:	
;i2c.c: 62: SSPCON=0x39;
	movlw	(039h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(20)	;volatile
	line	64
	
l9235:	
;i2c.c: 64: SSPCON=0x36;
	movlw	(036h)
	movwf	(20)	;volatile
	line	66
	
l9237:	
;i2c.c: 66: i2c_xmt_size=0;
	clrf	(_i2c_xmt_size)
	line	67
	
l9239:	
;i2c.c: 67: i2c_rcv_size=0;
	clrf	(_i2c_rcv_size)
	line	68
	
l9241:	
;i2c.c: 71: i2c_illegal_sspcon=0;
	clrf	(_i2c_rcv_avail)
	incf	(_i2c_rcv_avail),f
	line	73
	
l9243:	
;i2c.c: 73: SSPIF=0;
	bcf	(99/8),(99)&7
	line	74
	
l9245:	
;i2c.c: 74: SSPIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1123/8)^080h,(1123)&7
	line	75
	
l4486:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_init
	__end_of_i2c_init:
;; =============== function _i2c_init ends ============

	signat	_i2c_init,88
	global	_InitReceiver
psect	text1343,local,class=CODE,delta=2
global __ptext1343
__ptext1343:

;; *************** function _InitReceiver *****************
;; Defined at:
;;		line 261 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\KeeLoq_RX1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1343
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\KeeLoq_RX1.c"
	line	261
	global	__size_of_InitReceiver
	__size_of_InitReceiver	equ	__end_of_InitReceiver-_InitReceiver
	
_InitReceiver:	
	opt	stack 4
; Regs used in _InitReceiver: [status,2]
	line	262
	
l9215:	
;KeeLoq_RX1.c: 262: TMR0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(1)	;volatile
	line	263
	
l9217:	
;KeeLoq_RX1.c: 263: T0CS = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	264
	
l9219:	
;KeeLoq_RX1.c: 264: T0IF = 0;
	bcf	(90/8),(90)&7
	line	265
	
l9221:	
;KeeLoq_RX1.c: 265: T0IE = 1;
	bsf	(93/8),(93)&7
	line	266
	
l9223:	
;KeeLoq_RX1.c: 266: GIE = 1;
	bsf	(95/8),(95)&7
	line	267
;KeeLoq_RX1.c: 267: RFstate = 0;
	clrf	(_RFstate)
	line	268
	
l9225:	
;KeeLoq_RX1.c: 269: XTMR = 0;
	bcf	(_RFFull/8),(_RFFull)&7
	line	270
;KeeLoq_RX1.c: 270: RFtype = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_RFtype)
	line	272
	
l5372:	
	return
	opt stack 0
GLOBAL	__end_of_InitReceiver
	__end_of_InitReceiver:
;; =============== function _InitReceiver ends ============

	signat	_InitReceiver,88
	global	_Interrupt
psect	text1344,local,class=CODE,delta=2
global __ptext1344
__ptext1344:

;; *************** function _Interrupt *****************
;; Defined at:
;;		line 622 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_rxi
;;		_ssp_isr
;;		_tmr1_isr
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1344
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
	line	622
	global	__size_of_Interrupt
	__size_of_Interrupt	equ	__end_of_Interrupt-_Interrupt
	
_Interrupt:	
	opt	stack 1
; Regs used in _Interrupt: [allreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_Interrupt+0)
	movf	fsr0,w
	movwf	(??_Interrupt+1)
	movf	pclath,w
	movwf	(??_Interrupt+2)
	ljmp	_Interrupt
psect	text1344
	line	623
	
i1l8001:	
;main.c: 623: if(T0IF)
	btfss	(90/8),(90)&7
	goto	u174_21
	goto	u174_20
u174_21:
	goto	i1l8005
u174_20:
	line	624
	
i1l8003:	
;main.c: 624: rxi();
	fcall	_rxi
	line	625
	
i1l8005:	
;main.c: 625: if(SSPIF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(99/8),(99)&7
	goto	u175_21
	goto	u175_20
u175_21:
	goto	i1l8009
u175_20:
	line	626
	
i1l8007:	
;main.c: 626: ssp_isr();
	fcall	_ssp_isr
	line	627
	
i1l8009:	
;main.c: 627: if(TMR1IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u176_21
	goto	u176_20
u176_21:
	goto	i1l1059
u176_20:
	line	628
	
i1l8011:	
;main.c: 628: tmr1_isr();
	fcall	_tmr1_isr
	line	631
	
i1l1059:	
	movf	(??_Interrupt+2),w
	movwf	pclath
	movf	(??_Interrupt+1),w
	movwf	fsr0
	movf	(??_Interrupt+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Interrupt
	__end_of_Interrupt:
;; =============== function _Interrupt ends ============

	signat	_Interrupt,88
	global	_ssp_isr
psect	text1345,local,class=CODE,delta=2
global __ptext1345
__ptext1345:

;; *************** function _ssp_isr *****************
;; Defined at:
;;		line 101 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  val             1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_i2c_write_data
;; This function is called by:
;;		_Interrupt
;; This function uses a non-reentrant model
;;
psect	text1345
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\i2c.c"
	line	101
	global	__size_of_ssp_isr
	__size_of_ssp_isr	equ	__end_of_ssp_isr-_ssp_isr
	
_ssp_isr:	
	opt	stack 1
; Regs used in _ssp_isr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	104
	
i1l8143:	
;i2c.c: 102: unsigned char val;
;i2c.c: 104: SSPIF=0;
	bcf	(99/8),(99)&7
	line	128
;i2c.c: 129: {
;i2c.c: 130: i2c_errors++;
	btfss	(166/8),(166)&7
	goto	u205_21
	goto	u205_20
u205_21:
	goto	i1l4497
u205_20:
	line	131
	
i1l8145:	
;i2c.c: 131: SSPOV=0;
	bcf	(166/8),(166)&7
	line	132
	
i1l4497:	
	line	134
;i2c.c: 135: {
;i2c.c: 136: i2c_errors++;
	btfss	(167/8),(167)&7
	goto	u206_21
	goto	u206_20
u206_21:
	goto	i1l8193
u206_20:
	line	137
	
i1l8147:	
;i2c.c: 137: WCOL=0;
	bcf	(167/8),(167)&7
	goto	i1l8193
	line	153
	
i1l8149:	
;i2c.c: 153: i2c_rcv_size=0;
	clrf	(_i2c_rcv_size)
	line	154
	
i1l8151:	
;i2c.c: 154: i2c_rcv_ptr = &i2c_rcv_buf[0];
	movlw	(_i2c_rcv_buf)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_i2c_rcv_ptr)
	line	155
	
i1l8153:	
	movf	(19),w	;volatile
	goto	i1l4501
	line	163
	
i1l8157:	
;i2c.c: 163: val = SSPBUF;
	bcf	status, 5	;RP0=0, select bank0
	movf	(19),w	;volatile
	movwf	(ssp_isr@val)
	line	165
;i2c.c: 165: if ( i2c_rcv_size < 5 )
	movlw	(05h)
	subwf	(_i2c_rcv_size),w
	skipnc
	goto	u207_21
	goto	u207_20
u207_21:
	goto	i1l4501
u207_20:
	line	167
	
i1l8159:	
;i2c.c: 166: {
;i2c.c: 167: *i2c_rcv_ptr++ = val;
	movf	(_i2c_rcv_ptr),w
	movwf	fsr0
	movf	(ssp_isr@val),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l8161:	
	incf	(_i2c_rcv_ptr),f
	line	168
	
i1l8163:	
;i2c.c: 168: if ( ++i2c_rcv_size >= 5 )
	movlw	(05h)
	incf	(_i2c_rcv_size),f
	subwf	((_i2c_rcv_size)),w
	skipc
	goto	u208_21
	goto	u208_20
u208_21:
	goto	i1l4501
u208_20:
	line	169
	
i1l8165:	
;i2c.c: 169: i2c_rcv_avail = 1;
	clrf	(_i2c_rcv_avail)
	incf	(_i2c_rcv_avail),f
	goto	i1l4501
	line	178
	
i1l8167:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(19),w	;volatile
	line	179
	
i1l8169:	
;i2c.c: 179: WCOL=0;
	bcf	(167/8),(167)&7
	line	180
	
i1l8171:	
;i2c.c: 180: i2c_xmt_size=0;
	clrf	(_i2c_xmt_size)
	line	181
	
i1l8173:	
;i2c.c: 181: i2c_write_data( i2c_xmt_buf[ i2c_xmt_size ] );
	movf	(_i2c_xmt_size),w
	addlw	_i2c_xmt_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	fcall	_i2c_write_data
	line	183
	
i1l8175:	
;i2c.c: 183: i2c_xmt_size=1;
	clrf	(_i2c_xmt_size)
	incf	(_i2c_xmt_size),f
	goto	i1l4501
	line	190
;i2c.c: 190: case (0x2C):
	
i1l4506:	
	line	191
;i2c.c: 191: WCOL=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(167/8),(167)&7
	line	192
	
i1l8179:	
;i2c.c: 192: i2c_write_data( i2c_xmt_buf[ i2c_xmt_size ] );
	movf	(_i2c_xmt_size),w
	addlw	_i2c_xmt_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	fcall	_i2c_write_data
	line	193
	
i1l8181:	
;i2c.c: 193: i2c_xmt_size += 1;
	incf	(_i2c_xmt_size),f
	goto	i1l4501
	line	200
;i2c.c: 200: case (0x28):
	
i1l4507:	
	line	201
;i2c.c: 201: _nop();
	nop
	line	202
;i2c.c: 202: return;
	goto	i1l4501
	line	210
	
i1l8185:	
;i2c.c: 210: i2c_illegal_sspcon = SSPSTAT;
	movf	(148)^080h,w	;volatile
	goto	i1l4507
	line	143
	
i1l8193:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(148)^080h,w
	andlw	02Dh
	movwf	(??_ssp_isr+0)+0
	clrf	(??_ssp_isr+0)+0+1
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Bytes Cycles
; simple_byte     4     3 (average)
; direct_byte    22    19 (fixed)
;	Chosen strategy is simple_byte

	movf 1+(??_ssp_isr+0)+0,w
	xorlw	0^0	; case 0
	skipnz
	goto	i1l10295
	goto	i1l8185
	
i1l10295:	
; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 9 to 44
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    16     9 (average)
; direct_byte   130    22 (fixed)
;	Chosen strategy is simple_byte

	movf 0+(??_ssp_isr+0)+0,w
	xorlw	9^0	; case 9
	skipnz
	goto	i1l8149
	xorlw	13^9	; case 13
	skipnz
	goto	i1l8167
	xorlw	40^13	; case 40
	skipnz
	goto	i1l4507
	xorlw	41^40	; case 41
	skipnz
	goto	i1l8157
	xorlw	44^41	; case 44
	skipnz
	goto	i1l4506
	goto	i1l8185

	line	216
	
i1l4501:	
	return
	opt stack 0
GLOBAL	__end_of_ssp_isr
	__end_of_ssp_isr:
;; =============== function _ssp_isr ends ============

	signat	_ssp_isr,88
	global	_i2c_write_data
psect	text1346,local,class=CODE,delta=2
global __ptext1346
__ptext1346:

;; *************** function _i2c_write_data *****************
;; Defined at:
;;		line 82 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\i2c.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ssp_isr
;; This function uses a non-reentrant model
;;
psect	text1346
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\i2c.c"
	line	82
	global	__size_of_i2c_write_data
	__size_of_i2c_write_data	equ	__end_of_i2c_write_data-_i2c_write_data
	
_i2c_write_data:	
	opt	stack 1
; Regs used in _i2c_write_data: [wreg]
;i2c_write_data@data stored from wreg
	movwf	(i2c_write_data@data)
	line	83
	
i1l8273:	
;i2c.c: 83: while( BF );
	
i1l4489:	
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1184/8)^080h,(1184)&7
	goto	u216_21
	goto	u216_20
u216_21:
	goto	i1l4489
u216_20:
	line	85
;i2c.c: 85: do
	
i1l4492:	
	line	87
;i2c.c: 86: {
;i2c.c: 87: WCOL=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(167/8),(167)&7
	line	88
	
i1l8275:	
;i2c.c: 88: SSPBUF = data;
	movf	(i2c_write_data@data),w
	movwf	(19)	;volatile
	line	90
	
i1l8277:	
;i2c.c: 89: }
;i2c.c: 90: while( WCOL);
	btfsc	(167/8),(167)&7
	goto	u217_21
	goto	u217_20
u217_21:
	goto	i1l4492
u217_20:
	
i1l4493:	
	line	91
;i2c.c: 91: CKP = 1;
	bsf	(164/8),(164)&7
	line	92
	
i1l4494:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_write_data
	__end_of_i2c_write_data:
;; =============== function _i2c_write_data ends ============

	signat	_i2c_write_data,4216
	global	_tmr1_isr
psect	text1347,local,class=CODE,delta=2
global __ptext1347
__ptext1347:

;; *************** function _tmr1_isr *****************
;; Defined at:
;;		line 722 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Interrupt
;; This function uses a non-reentrant model
;;
psect	text1347
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\main.c"
	line	722
	global	__size_of_tmr1_isr
	__size_of_tmr1_isr	equ	__end_of_tmr1_isr-_tmr1_isr
	
_tmr1_isr:	
	opt	stack 2
; Regs used in _tmr1_isr: [status,2]
	line	723
	
i1l8201:	
;main.c: 723: TMR1ON= 0;
	bcf	(128/8),(128)&7
	line	724
	
i1l8203:	
;main.c: 724: TMR1L = 0x00;
	clrf	(14)	;volatile
	line	725
;main.c: 725: TMR1H = 0x00;
	clrf	(15)	;volatile
	line	726
	
i1l8205:	
;main.c: 726: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	727
	
i1l8207:	
;main.c: 727: TMR1ON = 1;
	bsf	(128/8),(128)&7
	line	728
	
i1l8209:	
;main.c: 728: Continue_Count = 1;
	clrf	(_Continue_Count)
	incf	(_Continue_Count),f
	line	729
	
i1l1083:	
	return
	opt stack 0
GLOBAL	__end_of_tmr1_isr
	__end_of_tmr1_isr:
;; =============== function _tmr1_isr ends ============

	signat	_tmr1_isr,88
	global	_rxi
psect	text1348,local,class=CODE,delta=2
global __ptext1348
__ptext1348:

;; *************** function _rxi *****************
;; Defined at:
;;		line 83 in file "I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\KeeLoq_RX1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Interrupt
;; This function uses a non-reentrant model
;;
psect	text1348
	file	"I:\remotecontrol\AN1248 PICmicro MCU Keeloq Receiver with UART interface\SourceCode\KeeLoq_RX1.c"
	line	83
	global	__size_of_rxi
	__size_of_rxi	equ	__end_of_rxi-_rxi
	
_rxi:	
	opt	stack 2
; Regs used in _rxi: [wreg-fsr0h+status,2+status,0]
	line	85
	
i1l8013:	
;KeeLoq_RX1.c: 85: RFBit = RFIn;
	bcf	(_RFBit/8),(_RFBit)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(44/8),(44)&7
	goto	u177_25
	bsf	(_RFBit/8),(_RFBit)&7
u177_25:

	line	86
	
i1l8015:	
;KeeLoq_RX1.c: 86: TMR0 = 0xAC;
	movlw	(0ACh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	87
	
i1l8017:	
;KeeLoq_RX1.c: 88: XTMR++;
	bcf	(90/8),(90)&7
	line	89
	
i1l8019:	
;KeeLoq_RX1.c: 89: if (RFFull)
	btfss	(_RFFull/8),(_RFFull)&7
	goto	u178_21
	goto	u178_20
u178_21:
	goto	i1l8141
u178_20:
	goto	i1l5333
	line	95
;KeeLoq_RX1.c: 93: {
;KeeLoq_RX1.c: 95: case 2:
	
i1l5335:	
	line	97
;KeeLoq_RX1.c: 97: if ( RFBit == 0)
	btfsc	(_RFBit/8),(_RFBit)&7
	goto	u179_21
	goto	u179_20
u179_21:
	goto	i1l8025
u179_20:
	line	103
	
i1l8023:	
;KeeLoq_RX1.c: 99: {
;KeeLoq_RX1.c: 103: RFstate = 3;
	movlw	(03h)
	movwf	(_RFstate)
	line	104
;KeeLoq_RX1.c: 104: }
	goto	i1l5333
	line	107
	
i1l8025:	
;KeeLoq_RX1.c: 105: else
;KeeLoq_RX1.c: 106: {
;KeeLoq_RX1.c: 107: RFcount--;
	decf	(_RFcount),f
	line	108
	
i1l8027:	
;KeeLoq_RX1.c: 108: if ( RFcount < -7)
	movf	(_RFcount),w
	xorlw	80h
	addlw	-((-7)^80h)
	skipnc
	goto	u180_21
	goto	u180_20
u180_21:
	goto	i1l5333
u180_20:
	line	110
	
i1l8029:	
;KeeLoq_RX1.c: 109: {
;KeeLoq_RX1.c: 110: if (BitCount <65)
	movlw	(041h)
	subwf	(_BitCount),w
	skipnc
	goto	u181_21
	goto	u181_20
u181_21:
	goto	i1l8035
u181_20:
	line	112
	
i1l8031:	
;KeeLoq_RX1.c: 111: {
;KeeLoq_RX1.c: 112: RFtype = 0;
	clrf	(_RFtype)
	line	113
	
i1l8033:	
;KeeLoq_RX1.c: 113: RFstate = 1;
	clrf	(_RFstate)
	incf	(_RFstate),f
	line	114
;KeeLoq_RX1.c: 114: Bptr = 0;
	clrf	(_Bptr)
	line	115
;KeeLoq_RX1.c: 115: BitCount = 0;
	clrf	(_BitCount)
	line	116
;KeeLoq_RX1.c: 116: break;
	goto	i1l5333
	line	118
	
i1l8035:	
;KeeLoq_RX1.c: 117: }
;KeeLoq_RX1.c: 118: if ((BitCount>=65) & (BitCount < 100))
	movlw	(041h)
	subwf	(_BitCount),w
	skipc
	goto	u182_21
	goto	u182_20
u182_21:
	goto	i1l8041
u182_20:
	
i1l8037:	
	movlw	(064h)
	subwf	(_BitCount),w
	skipnc
	goto	u183_21
	goto	u183_20
u183_21:
	goto	i1l8041
u183_20:
	line	120
	
i1l8039:	
;KeeLoq_RX1.c: 119: {
;KeeLoq_RX1.c: 120: RFtype = 1;
	clrf	(_RFtype)
	incf	(_RFtype),f
	line	123
	
i1l8041:	
;KeeLoq_RX1.c: 121: }
;KeeLoq_RX1.c: 123: if ((BitCount>=100) & (BitCount < 160))
	movlw	(064h)
	subwf	(_BitCount),w
	skipc
	goto	u184_21
	goto	u184_20
u184_21:
	goto	i1l5342
u184_20:
	
i1l8043:	
	movlw	(0A0h)
	subwf	(_BitCount),w
	skipnc
	goto	u185_21
	goto	u185_20
u185_21:
	goto	i1l5342
u185_20:
	line	125
	
i1l8045:	
;KeeLoq_RX1.c: 124: {
;KeeLoq_RX1.c: 125: RFtype = 3;
	movlw	(03h)
	movwf	(_RFtype)
	line	126
	
i1l5342:	
	line	127
;KeeLoq_RX1.c: 126: }
;KeeLoq_RX1.c: 127: if (BitCount>=160)
	movlw	(0A0h)
	subwf	(_BitCount),w
	skipc
	goto	u186_21
	goto	u186_20
u186_21:
	goto	i1l8049
u186_20:
	line	129
	
i1l8047:	
;KeeLoq_RX1.c: 128: {
;KeeLoq_RX1.c: 129: RFtype = 2;
	movlw	(02h)
	movwf	(_RFtype)
	line	132
	
i1l8049:	
;KeeLoq_RX1.c: 130: }
;KeeLoq_RX1.c: 132: RFstate = 0;
	clrf	(_RFstate)
	line	133
	
i1l8051:	
;KeeLoq_RX1.c: 133: RFFull = 0x01;
	bsf	(_RFFull/8),(_RFFull)&7
	goto	i1l5333
	line	139
;KeeLoq_RX1.c: 139: case 3:
	
i1l5344:	
	line	140
;KeeLoq_RX1.c: 140: if ( RFBit)
	btfss	(_RFBit/8),(_RFBit)&7
	goto	u187_21
	goto	u187_20
u187_21:
	goto	i1l8075
u187_20:
	line	145
	
i1l8053:	
;KeeLoq_RX1.c: 141: {
;KeeLoq_RX1.c: 145: RFstate= 2;
	movlw	(02h)
	movwf	(_RFstate)
	line	146
	
i1l8055:	
;KeeLoq_RX1.c: 146: RX_Buffer[Bptr] >>= 1;
	movf	(_Bptr),w
	addlw	_RX_Buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrc
	rrf	indf,f
	line	147
	
i1l8057:	
;KeeLoq_RX1.c: 147: if ( RFcount >= 0)
	btfsc	(_RFcount),7
	goto	u188_21
	goto	u188_20
u188_21:
	goto	i1l8061
u188_20:
	line	149
	
i1l8059:	
;KeeLoq_RX1.c: 148: {
;KeeLoq_RX1.c: 149: RX_Buffer[Bptr]+=0x80;
	movf	(_Bptr),w
	addlw	_RX_Buffer&0ffh
	movwf	fsr0
	movlw	(080h)
	addwf	indf,f
	line	151
	
i1l8061:	
;KeeLoq_RX1.c: 150: }
;KeeLoq_RX1.c: 151: RFcount = 0;
	clrf	(_RFcount)
	line	153
	
i1l8063:	
;KeeLoq_RX1.c: 153: if ( ( ++BitCount & 7) == 0)
	incf	(_BitCount),f
	movf	((_BitCount)),w
	andlw	07h
	btfss	status,2
	goto	u189_21
	goto	u189_20
u189_21:
	goto	i1l8067
u189_20:
	line	154
	
i1l8065:	
;KeeLoq_RX1.c: 154: Bptr++;
	incf	(_Bptr),f
	line	155
	
i1l8067:	
;KeeLoq_RX1.c: 155: if (BitCount == (160+10))
	movf	(_BitCount),w
	xorlw	0AAh
	skipz
	goto	u190_21
	goto	u190_20
u190_21:
	goto	i1l5333
u190_20:
	line	157
	
i1l8069:	
;KeeLoq_RX1.c: 156: {
;KeeLoq_RX1.c: 157: RFstate = 0;
	clrf	(_RFstate)
	line	158
	
i1l8071:	
;KeeLoq_RX1.c: 158: RFFull = 0x1;
	bsf	(_RFFull/8),(_RFFull)&7
	line	159
	
i1l8073:	
;KeeLoq_RX1.c: 159: RFtype = 2;
	movlw	(02h)
	movwf	(_RFtype)
	goto	i1l5333
	line	164
	
i1l8075:	
;KeeLoq_RX1.c: 162: else
;KeeLoq_RX1.c: 163: {
;KeeLoq_RX1.c: 164: RFcount++;
	incf	(_RFcount),f
	line	165
	
i1l8077:	
;KeeLoq_RX1.c: 165: if ( RFcount >= 7)
	movf	(_RFcount),w
	xorlw	80h
	addlw	-((07h)^80h)
	skipc
	goto	u191_21
	goto	u191_20
u191_21:
	goto	i1l5333
u191_20:
	line	168
	
i1l8079:	
;KeeLoq_RX1.c: 166: {
;KeeLoq_RX1.c: 168: RX_Buffer[Bptr] >>= 1;
	movf	(_Bptr),w
	addlw	_RX_Buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrc
	rrf	indf,f
	line	169
	
i1l8081:	
;KeeLoq_RX1.c: 169: if ( RFcount >= 0)
	btfsc	(_RFcount),7
	goto	u192_21
	goto	u192_20
u192_21:
	goto	i1l8085
u192_20:
	line	171
	
i1l8083:	
;KeeLoq_RX1.c: 170: {
;KeeLoq_RX1.c: 171: RX_Buffer[Bptr]+=0x80;
	movf	(_Bptr),w
	addlw	_RX_Buffer&0ffh
	movwf	fsr0
	movlw	(080h)
	addwf	indf,f
	line	174
	
i1l8085:	
;KeeLoq_RX1.c: 172: }
;KeeLoq_RX1.c: 174: if (BitCount <65)
	movlw	(041h)
	subwf	(_BitCount),w
	skipnc
	goto	u193_21
	goto	u193_20
u193_21:
	goto	i1l8091
u193_20:
	goto	i1l8031
	line	182
	
i1l8091:	
;KeeLoq_RX1.c: 181: }
;KeeLoq_RX1.c: 182: if (BitCount>=65 & BitCount < 100)
	movlw	(041h)
	subwf	(_BitCount),w
	skipc
	goto	u194_21
	goto	u194_20
u194_21:
	goto	i1l8097
u194_20:
	
i1l8093:	
	movlw	(064h)
	subwf	(_BitCount),w
	skipnc
	goto	u195_21
	goto	u195_20
u195_21:
	goto	i1l8097
u195_20:
	line	184
	
i1l8095:	
;KeeLoq_RX1.c: 183: {
;KeeLoq_RX1.c: 184: RFtype = 1;
	clrf	(_RFtype)
	incf	(_RFtype),f
	line	187
	
i1l8097:	
;KeeLoq_RX1.c: 185: }
;KeeLoq_RX1.c: 187: if (BitCount>=100 & BitCount < 160)
	movlw	(064h)
	subwf	(_BitCount),w
	skipc
	goto	u196_21
	goto	u196_20
u196_21:
	goto	i1l5354
u196_20:
	
i1l8099:	
	movlw	(0A0h)
	subwf	(_BitCount),w
	skipnc
	goto	u197_21
	goto	u197_20
u197_21:
	goto	i1l5354
u197_20:
	line	189
	
i1l8101:	
;KeeLoq_RX1.c: 188: {
;KeeLoq_RX1.c: 189: RFtype = 3;
	movlw	(03h)
	movwf	(_RFtype)
	line	190
	
i1l5354:	
	line	191
;KeeLoq_RX1.c: 190: }
;KeeLoq_RX1.c: 191: if (BitCount>=160)
	movlw	(0A0h)
	subwf	(_BitCount),w
	skipc
	goto	u198_21
	goto	u198_20
u198_21:
	goto	i1l8049
u198_20:
	goto	i1l8047
	line	203
;KeeLoq_RX1.c: 203: case 1:
	
i1l5356:	
	line	204
;KeeLoq_RX1.c: 204: if ( RFBit)
	btfss	(_RFBit/8),(_RFBit)&7
	goto	u199_21
	goto	u199_20
u199_21:
	goto	i1l8121
u199_20:
	line	209
	
i1l8109:	
;KeeLoq_RX1.c: 205: {
;KeeLoq_RX1.c: 209: if ( ( RFcount < 25) || ( RFcount >= 45))
	movf	(_RFcount),w
	xorlw	80h
	addlw	-((019h)^80h)
	skipc
	goto	u200_21
	goto	u200_20
u200_21:
	goto	i1l8113
u200_20:
	
i1l8111:	
	movf	(_RFcount),w
	xorlw	80h
	addlw	-((02Dh)^80h)
	skipc
	goto	u201_21
	goto	u201_20
u201_21:
	goto	i1l8117
u201_20:
	line	211
	
i1l8113:	
;KeeLoq_RX1.c: 210: {
;KeeLoq_RX1.c: 211: RFstate = 0;
	clrf	(_RFstate)
	line	212
;KeeLoq_RX1.c: 212: RFcount = 0;
	clrf	(_RFcount)
	line	213
;KeeLoq_RX1.c: 213: break;
	goto	i1l5333
	line	217
	
i1l8117:	
;KeeLoq_RX1.c: 215: else
;KeeLoq_RX1.c: 216: {
;KeeLoq_RX1.c: 217: RFcount =0;
	clrf	(_RFcount)
	line	218
	
i1l8119:	
;KeeLoq_RX1.c: 218: RFstate= 2;
	movlw	(02h)
	movwf	(_RFstate)
	goto	i1l5333
	line	223
	
i1l8121:	
;KeeLoq_RX1.c: 221: else
;KeeLoq_RX1.c: 222: {
;KeeLoq_RX1.c: 223: RFcount++;
	incf	(_RFcount),f
	goto	i1l5333
	line	228
;KeeLoq_RX1.c: 228: case 4:
	
i1l5363:	
	line	229
;KeeLoq_RX1.c: 229: if (!RFsynch)
	btfsc	(_RFsynch/8),(_RFsynch)&7
	goto	u202_21
	goto	u202_20
u202_21:
	goto	i1l5364
u202_20:
	line	231
	
i1l8123:	
;KeeLoq_RX1.c: 230: {
;KeeLoq_RX1.c: 231: if (RFBit)
	btfss	(_RFBit/8),(_RFBit)&7
	goto	u203_21
	goto	u203_20
u203_21:
	goto	i1l5333
u203_20:
	line	233
	
i1l8125:	
;KeeLoq_RX1.c: 232: {
;KeeLoq_RX1.c: 233: RFsynch = 1;
	bsf	(_RFsynch/8),(_RFsynch)&7
	goto	i1l5333
	line	236
	
i1l5364:	
	line	238
;KeeLoq_RX1.c: 236: else
;KeeLoq_RX1.c: 237: {
;KeeLoq_RX1.c: 238: if (!RFBit)
	btfsc	(_RFBit/8),(_RFBit)&7
	goto	u204_21
	goto	u204_20
u204_21:
	goto	i1l5333
u204_20:
	line	240
	
i1l8127:	
;KeeLoq_RX1.c: 239: {
;KeeLoq_RX1.c: 240: RFstate = 1;
	clrf	(_RFstate)
	incf	(_RFstate),f
	line	241
;KeeLoq_RX1.c: 241: RFsynch = 0;
	bcf	(_RFsynch/8),(_RFsynch)&7
	goto	i1l5333
	line	249
	
i1l8129:	
;KeeLoq_RX1.c: 249: RFstate = 4;
	movlw	(04h)
	movwf	(_RFstate)
	line	250
	
i1l8131:	
;KeeLoq_RX1.c: 250: RFcount = 0;
	clrf	(_RFcount)
	line	251
	
i1l8133:	
;KeeLoq_RX1.c: 251: Bptr = 0;
	clrf	(_Bptr)
	line	252
	
i1l8135:	
;KeeLoq_RX1.c: 252: BitCount = 0;
	clrf	(_BitCount)
	line	253
	
i1l8137:	
;KeeLoq_RX1.c: 253: RFsynch = 0;
	bcf	(_RFsynch/8),(_RFsynch)&7
	line	254
;KeeLoq_RX1.c: 254: break;
	goto	i1l5333
	line	92
	
i1l8141:	
	movf	(_RFstate),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    16     9 (average)
; direct_byte    34    19 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	i1l8129
	xorlw	1^0	; case 1
	skipnz
	goto	i1l5356
	xorlw	2^1	; case 2
	skipnz
	goto	i1l5335
	xorlw	3^2	; case 3
	skipnz
	goto	i1l5344
	xorlw	4^3	; case 4
	skipnz
	goto	i1l5363
	goto	i1l8129

	line	257
	
i1l5333:	
	return
	opt stack 0
GLOBAL	__end_of_rxi
	__end_of_rxi:
;; =============== function _rxi ends ============

	signat	_rxi,88
psect	text1349,local,class=CODE,delta=2
global __ptext1349
__ptext1349:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
