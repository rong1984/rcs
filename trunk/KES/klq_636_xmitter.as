opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6738"

opt pagewidth 120

	opt pm

	processor	16F636
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
# 6 "C:\Users\xxxx\Desktop\20110118\PIC16F636\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 6 "C:\Users\xxxx\Desktop\20110118\PIC16F636\main.c"
	dw 0x3FDF & 0x3FFC & 0x3FF7 & 0x3FFF & 0x3FBF & 0x3F7F ;#
	FNCALL	_main,_Init_pic16f636
	FNCALL	_main,_delay_ms
	FNCALL	_main,_eeprom_read
	FNCALL	_main,_eeprom_write
	FNROOT	_main
	FNCALL	_isr,_key_process
	FNCALL	_key_process,i1_delay_ms
	FNCALL	_key_process,i1_eeprom_write
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_syscfg1
	global	_tx_index
	global	_CMCON0
psect	text209,local,class=CODE,delta=2
global __ptext209
__ptext209:
_CMCON0	set	25
	global	_PORTA
_PORTA	set	5
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RA0
_RA0	set	40
	global	_RAIE
_RAIE	set	91
	global	_RAIF
_RAIF	set	88
	global	_EEADR
_EEADR	set	155
	global	_EECON1
_EECON1	set	156
	global	_EECON2
_EECON2	set	157
	global	_EEDATA
_EEDATA	set	154
	global	_IOCA
_IOCA	set	150
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_WDA
_WDA	set	151
	global	_WPUDA
_WPUDA	set	149
	global	_RD
_RD	set	1248
	global	_WR
_WR	set	1249
	global	_WREN
_WREN	set	1250
	file	"klq_636_xmitter.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_tx_index:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_syscfg1:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x0
	global	?_Init_pic16f636
?_Init_pic16f636:	; 0 bytes @ 0x0
	global	?_key_process
?_key_process:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	?i1_delay_ms
?i1_delay_ms:	; 0 bytes @ 0x0
	global	??i1_delay_ms
??i1_delay_ms:	; 0 bytes @ 0x0
	global	?i1_eeprom_write
?i1_eeprom_write:	; 0 bytes @ 0x0
	global	?_eeprom_read
?_eeprom_read:	; 1 bytes @ 0x0
	global	i1delay_ms@cnt
i1delay_ms@cnt:	; 1 bytes @ 0x0
	global	i1eeprom_write@value
i1eeprom_write@value:	; 1 bytes @ 0x0
	ds	1
	global	??i1_eeprom_write
??i1_eeprom_write:	; 0 bytes @ 0x1
	global	i1delay_ms@i
i1delay_ms@i:	; 1 bytes @ 0x1
	global	i1eeprom_write@addr
i1eeprom_write@addr:	; 1 bytes @ 0x1
	ds	1
	global	i1delay_ms@_dcnt
i1delay_ms@_dcnt:	; 1 bytes @ 0x2
	ds	1
	global	??_key_process
??_key_process:	; 0 bytes @ 0x3
	global	key_process@i
key_process@i:	; 1 bytes @ 0x3
	ds	1
	global	key_process@cnt
key_process@cnt:	; 1 bytes @ 0x4
	ds	1
	global	key_process@tmp
key_process@tmp:	; 1 bytes @ 0x5
	ds	1
	global	??_isr
??_isr:	; 0 bytes @ 0x6
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_eeprom_write
?_eeprom_write:	; 0 bytes @ 0x0
	global	??_eeprom_read
??_eeprom_read:	; 0 bytes @ 0x0
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x0
	global	??_Init_pic16f636
??_Init_pic16f636:	; 0 bytes @ 0x0
	global	delay_ms@cnt
delay_ms@cnt:	; 1 bytes @ 0x0
	global	eeprom_write@value
eeprom_write@value:	; 1 bytes @ 0x0
	ds	1
	global	??_eeprom_write
??_eeprom_write:	; 0 bytes @ 0x1
	global	delay_ms@i
delay_ms@i:	; 1 bytes @ 0x1
	global	eeprom_write@addr
eeprom_write@addr:	; 1 bytes @ 0x1
	ds	1
	global	delay_ms@_dcnt
delay_ms@_dcnt:	; 1 bytes @ 0x2
	global	eeprom_read@addr
eeprom_read@addr:	; 1 bytes @ 0x2
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x3
	global	main@i
main@i:	; 1 bytes @ 0x3
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      10
;; BANK0           80      4       5
;; BANK1           32      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   _isr->_key_process
;;   _key_process->i1_delay_ms
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_delay_ms
;;   _main->_eeprom_read
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
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
;; (0) _main                                                 3     3      0     180
;;                                              3 BANK0      1     1      0
;;                     _Init_pic16f636
;;                           _delay_ms
;;                        _eeprom_read
;;                       _eeprom_write
;; ---------------------------------------------------------------------------------
;; (1) _eeprom_read                                          3     3      0      22
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _eeprom_write                                         2     1      1      44
;;                                              0 BANK0      2     1      1
;; ---------------------------------------------------------------------------------
;; (1) _Init_pic16f636                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _delay_ms                                             3     3      0      68
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _isr                                                  4     4      0     443
;;                                              6 COMMON     3     3      0
;;                        _key_process
;; ---------------------------------------------------------------------------------
;; (3) _key_process                                          3     3      0     443
;;                                              3 COMMON     3     3      0
;;                         i1_delay_ms
;;                     i1_eeprom_write
;; ---------------------------------------------------------------------------------
;; (4) i1_eeprom_write                                       2     1      1     146
;;                                              0 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (4) i1_delay_ms                                           3     3      0     223
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Init_pic16f636
;;   _delay_ms
;;   _eeprom_read
;;   _eeprom_write
;;
;; _isr (ROOT)
;;   _key_process
;;     i1_delay_ms
;;     i1_eeprom_write
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      9       A       1       71.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       7       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      4       5       4        6.3%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITBANK1            20      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               20      0       0       6        0.0%
;;ABS                  0      0       F       7        0.0%
;;DATA                 0      0      16       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 84 in file "C:\Users\xxxx\Desktop\20110118\PIC16F636\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    3[BANK0 ] unsigned char 
;;  tmp             1    0        volatile unsigned char 
;;  cnt             1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_Init_pic16f636
;;		_delay_ms
;;		_eeprom_read
;;		_eeprom_write
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\xxxx\Desktop\20110118\PIC16F636\main.c"
	line	84
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	88
	
l1476:	
;main.c: 85: char i,cnt;
;main.c: 86: volatile char tmp;
;main.c: 88: Init_pic16f636();
	fcall	_Init_pic16f636
	line	90
	
l1478:	
;main.c: 90: for(i=0; i< 5; i++ )
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@i)
	line	91
	
l759:	
	line	92
;main.c: 91: {
;main.c: 92: RA0 = 0;
	bcf	(40/8),(40)&7
	line	93
	
l1484:	
;main.c: 93: delay_ms(200);
	movlw	(0C8h)
	fcall	_delay_ms
	line	94
	
l1486:	
;main.c: 94: RA0 = 1;
	bsf	(40/8),(40)&7
	line	95
;main.c: 95: delay_ms(200);
	movlw	(0C8h)
	fcall	_delay_ms
	line	90
	
l1488:	
	incf	(main@i),f
	
l1490:	
	movlw	(05h)
	subwf	(main@i),w
	skipc
	goto	u391
	goto	u390
u391:
	goto	l759
u390:
	line	98
	
l1492:	
;main.c: 96: }
;main.c: 98: syscfg1 = eeprom_read(0x3D);
	movlw	(03Dh)
	fcall	_eeprom_read
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_syscfg1)
	line	99
;main.c: 99: syscfg0 = eeprom_read(0x3F);
	movlw	(03Fh)
	fcall	_eeprom_read
	line	101
;main.c: 101: tx_index = eeprom_read(0xFF);
	movlw	(0FFh)
	fcall	_eeprom_read
	movwf	(_tx_index)
	line	102
	
l1494:	
;main.c: 102: if(tx_index==0xff)
	movf	(_tx_index),w
	xorlw	0FFh
	skipz
	goto	u401
	goto	u400
u401:
	goto	l763
u400:
	line	104
	
l1496:	
;main.c: 103: {
;main.c: 104: tx_index = 0;
	clrf	(_tx_index)
	line	105
	
l1498:	
;main.c: 105: eeprom_write(0xFF, tx_index);
	movf	(_tx_index),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_eeprom_write)
	movlw	(0FFh)
	fcall	_eeprom_write
	line	163
;main.c: 163: while(1)
	
l763:	
	line	165
# 165 "C:\Users\xxxx\Desktop\20110118\PIC16F636\main.c"
sleep ;#
psect	maintext
	goto	l763
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	167
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_eeprom_read
psect	text210,local,class=CODE,delta=2
global __ptext210
__ptext210:

;; *************** function _eeprom_read *****************
;; Defined at:
;;		line 8 in file "eeread.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       2       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text210
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\eeread.c"
	line	8
	global	__size_of_eeprom_read
	__size_of_eeprom_read	equ	__end_of_eeprom_read-_eeprom_read
	
_eeprom_read:	
	opt	stack 4
; Regs used in _eeprom_read: [wreg+status,2+status,0]
;eeprom_read@addr stored from wreg
	line	10
	bcf	status, 5	;RP0=0, select bank0
	movwf	(eeprom_read@addr)
	line	9
	
l783:	
	line	10
# 10 "C:\Program Files\HI-TECH Software\PICC\9.80\sources\eeread.c"
clrwdt ;#
psect	text210
	line	11
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1249/8)^080h,(1249)&7
	goto	u311
	goto	u310
u311:
	goto	l783
u310:
	line	12
	
l1440:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(eeprom_read@addr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	movlw	(03Fh)
	andwf	(156)^080h,f	;volatile
	bsf	(1248/8)^080h,(1248)&7
	clrc
	btfsc	(1248/8)^080h,(1248)&7
	setc
	movlw	0
	skipnc
	movlw	1

	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_eeprom_read+0)+0
	clrf	(??_eeprom_read+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	movf	(154)^080h,w	;volatile
	line	13
	
l785:	
	return
	opt stack 0
GLOBAL	__end_of_eeprom_read
	__end_of_eeprom_read:
;; =============== function _eeprom_read ends ============

	signat	_eeprom_read,4217
	global	_eeprom_write
psect	text211,local,class=CODE,delta=2
global __ptext211
__ptext211:

;; *************** function _eeprom_write *****************
;; Defined at:
;;		line 8 in file "C:\Program Files\HI-TECH Software\PICC\9.80\sources\eewrite.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  value           1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text211
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\eewrite.c"
	line	8
	global	__size_of_eeprom_write
	__size_of_eeprom_write	equ	__end_of_eeprom_write-_eeprom_write
	
_eeprom_write:	
	opt	stack 4
; Regs used in _eeprom_write: [wreg+status,2+status,0]
;eeprom_write@addr stored from wreg
	movwf	(eeprom_write@addr)
	line	9
	
l804:	
	
l805:	
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1249/8)^080h,(1249)&7
	goto	u281
	goto	u280
u281:
	goto	l805
u280:
	
l1420:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(eeprom_write@addr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movf	(eeprom_write@value),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(154)^080h	;volatile
	
l1422:	
	movlw	(03Fh)
	andwf	(156)^080h,f	;volatile
	
l1424:	
	bcf	(24/8),(24)&7
	
l1426:	
	btfss	(95/8),(95)&7
	goto	u291
	goto	u290
u291:
	goto	l808
u290:
	
l1428:	
	bsf	(24/8),(24)&7
	
l808:	
	bcf	(95/8),(95)&7
	bsf	(1250/8)^080h,(1250)&7
	
l1430:	
	movlw	(055h)
	movwf	(157)^080h	;volatile
	movlw	(0AAh)
	movwf	(157)^080h	;volatile
	
l1432:	
	bsf	(1249/8)^080h,(1249)&7
	
l1434:	
	bcf	(1250/8)^080h,(1250)&7
	
l1436:	
	btfss	(24/8),(24)&7
	goto	u301
	goto	u300
u301:
	goto	l811
u300:
	
l1438:	
	bsf	(95/8),(95)&7
	line	10
	
l811:	
	return
	opt stack 0
GLOBAL	__end_of_eeprom_write
	__end_of_eeprom_write:
;; =============== function _eeprom_write ends ============

	signat	_eeprom_write,8312
	global	_Init_pic16f636
psect	text212,local,class=CODE,delta=2
global __ptext212
__ptext212:

;; *************** function _Init_pic16f636 *****************
;; Defined at:
;;		line 9 in file "C:\Users\xxxx\Desktop\20110118\PIC16F636\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text212
	file	"C:\Users\xxxx\Desktop\20110118\PIC16F636\main.c"
	line	9
	global	__size_of_Init_pic16f636
	__size_of_Init_pic16f636	equ	__end_of_Init_pic16f636-_Init_pic16f636
	
_Init_pic16f636:	
	opt	stack 4
; Regs used in _Init_pic16f636: [wreg+status,2]
	line	10
	
l1354:	
;main.c: 10: CMCON0 = 0x07;
	movlw	(07h)
	movwf	(25)	;volatile
	line	11
	
l1356:	
;main.c: 11: PORTA = 0;
	clrf	(5)	;volatile
	line	12
	
l1358:	
;main.c: 12: RA0 = 0;
	bcf	(40/8),(40)&7
	line	13
	
l1360:	
;main.c: 13: TMR1L = 0;
	clrf	(14)	;volatile
	line	14
	
l1362:	
;main.c: 14: TMR1H = 0;
	clrf	(15)	;volatile
	line	15
	
l1364:	
;main.c: 15: T1CON = 0x31;
	movlw	(031h)
	movwf	(16)	;volatile
	line	16
	
l1366:	
;main.c: 16: TRISA = 0x3C;
	movlw	(03Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	22
	
l1368:	
;main.c: 22: OSCCON = 0x61;
	movlw	(061h)
	movwf	(143)^080h	;volatile
	line	23
	
l1370:	
;main.c: 23: OPTION = 0x46;
	movlw	(046h)
	movwf	(129)^080h	;volatile
	line	24
	
l1372:	
;main.c: 24: WPUDA = 0x3C;
	movlw	(03Ch)
	movwf	(149)^080h	;volatile
	line	28
;main.c: 28: WDA = 0;
	clrf	(151)^080h	;volatile
	line	30
	
l1374:	
;main.c: 30: IOCA = 0x3C;
	movlw	(03Ch)
	movwf	(150)^080h	;volatile
	line	31
	
l1376:	
;main.c: 31: RAIF = 0;
	bcf	(88/8),(88)&7
	line	32
	
l1378:	
;main.c: 32: RAIE = 1;
	bsf	(91/8),(91)&7
	line	33
	
l1380:	
;main.c: 33: GIE = 1;
	bsf	(95/8),(95)&7
	line	34
	
l742:	
	return
	opt stack 0
GLOBAL	__end_of_Init_pic16f636
	__end_of_Init_pic16f636:
;; =============== function _Init_pic16f636 ends ============

	signat	_Init_pic16f636,88
	global	_delay_ms
psect	text213,local,class=CODE,delta=2
global __ptext213
__ptext213:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 45 in file "C:\Users\xxxx\Desktop\20110118\PIC16F636\delay.c"
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
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text213
	file	"C:\Users\xxxx\Desktop\20110118\PIC16F636\delay.c"
	line	45
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:	
	opt	stack 4
; Regs used in _delay_ms: [wreg]
;delay_ms@cnt stored from wreg
	movwf	(delay_ms@cnt)
	line	54
;delay.c: 53: unsigned char i;
;delay.c: 54: do {
	
l3:	
	line	55
	
l1352:	
;delay.c: 55: i = 4;
	movlw	(04h)
	movwf	(delay_ms@i)
	line	56
;delay.c: 56: do {
	
l4:	
	line	57
;delay.c: 57: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(delay_ms@_dcnt)
	
l5:	
	decfsz	(delay_ms@_dcnt),f
	goto	u241
	goto	u240
u241:
	goto	l5
u240:
	
l7:	
	line	58
;delay.c: 58: } while(--i);
	decfsz	(delay_ms@i),f
	goto	u251
	goto	u250
u251:
	goto	l4
u250:
	
l8:	
	line	59
;delay.c: 59: } while(--cnt);
	decfsz	(delay_ms@cnt),f
	goto	u261
	goto	u260
u261:
	goto	l3
u260:
	line	61
	
l10:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_isr
psect	text214,local,class=CODE,delta=2
global __ptext214
__ptext214:

;; *************** function _isr *****************
;; Defined at:
;;		line 171 in file "C:\Users\xxxx\Desktop\20110118\PIC16F636\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp             1    0        volatile unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          3       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_key_process
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text214
	file	"C:\Users\xxxx\Desktop\20110118\PIC16F636\main.c"
	line	171
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 4
; Regs used in _isr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_isr+0)
	movf	fsr0,w
	movwf	(??_isr+1)
	movf	pclath,w
	movwf	(??_isr+2)
	ljmp	_isr
psect	text214
	line	174
	
i1l1444:	
;main.c: 172: volatile unsigned char tmp;
;main.c: 174: if(RAIF)
	btfss	(88/8),(88)&7
	goto	u32_21
	goto	u32_20
u32_21:
	goto	i1l770
u32_20:
	line	176
	
i1l1446:	
;main.c: 175: {
;main.c: 176: RAIE = 0;
	bcf	(91/8),(91)&7
	line	188
	
i1l1448:	
;main.c: 188: key_process();
	fcall	_key_process
	line	189
	
i1l1450:	
;main.c: 189: RAIF = 0;
	bcf	(88/8),(88)&7
	line	190
	
i1l1452:	
;main.c: 190: RAIE = 1;
	bsf	(91/8),(91)&7
	line	192
	
i1l770:	
	movf	(??_isr+2),w
	movwf	pclath
	movf	(??_isr+1),w
	movwf	fsr0
	movf	(??_isr+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
	global	_key_process
psect	text215,local,class=CODE,delta=2
global __ptext215
__ptext215:

;; *************** function _key_process *****************
;; Defined at:
;;		line 43 in file "C:\Users\xxxx\Desktop\20110118\PIC16F636\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  cnt             1    4[COMMON] unsigned char 
;;  tmp             1    5[COMMON] volatile unsigned char 
;;  i               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_delay_ms
;;		i1_eeprom_write
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text215
	file	"C:\Users\xxxx\Desktop\20110118\PIC16F636\main.c"
	line	43
	global	__size_of_key_process
	__size_of_key_process	equ	__end_of_key_process-_key_process
	
_key_process:	
	opt	stack 4
; Regs used in _key_process: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	47
	
i1l1382:	
;main.c: 44: char i,cnt;
;main.c: 45: volatile char tmp;
;main.c: 47: tmp = PORTA&0x3C;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(5),w
	movwf	(key_process@tmp)	;volatile
	
i1l1384:	
	movlw	(03Ch)
	andwf	(key_process@tmp),f	;volatile
	line	48
	
i1l1386:	
;main.c: 48: delay_ms(20);
	movlw	(014h)
	fcall	i1_delay_ms
	line	49
;main.c: 49: if(tmp != PORTA&0x3C)
	goto	i1l1408
	line	55
	
i1l1390:	
;main.c: 55: tx_index = (tx_index+1)%4;
	incf	(_tx_index),f
	
i1l1392:	
	movlw	(03h)
	andwf	(_tx_index),f
	line	56
	
i1l1394:	
;main.c: 56: eeprom_write(0xFF, tx_index);
	movf	(_tx_index),w
	movwf	(?i1_eeprom_write)
	movlw	(0FFh)
	fcall	i1_eeprom_write
	line	57
	
i1l1396:	
;main.c: 57: cnt = tx_index+1;
	incf	(_tx_index),w
	movwf	(key_process@cnt)
	line	58
;main.c: 58: break;
	goto	i1l1410
	line	60
	
i1l1398:	
;main.c: 60: cnt = 2;
	movlw	(02h)
	movwf	(key_process@cnt)
	line	61
;main.c: 61: break;
	goto	i1l1410
	line	63
	
i1l1400:	
;main.c: 63: cnt = 3;
	movlw	(03h)
	movwf	(key_process@cnt)
	line	64
;main.c: 64: break;
	goto	i1l1410
	line	66
	
i1l1402:	
;main.c: 66: cnt = 4;
	movlw	(04h)
	movwf	(key_process@cnt)
	line	67
;main.c: 67: break;
	goto	i1l1410
	line	52
	
i1l1408:	
	movf	(key_process@tmp),w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 4 to 32
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    13     7 (average)
; direct_byte    45    16 (fixed)
;	Chosen strategy is simple_byte

	xorlw	4^0	; case 4
	skipnz
	goto	i1l1390
	xorlw	8^4	; case 8
	skipnz
	goto	i1l1402
	xorlw	16^8	; case 16
	skipnz
	goto	i1l1400
	xorlw	32^16	; case 32
	skipnz
	goto	i1l1398
	goto	i1l746

	line	73
	
i1l1410:	
;main.c: 73: for(i=0;i<cnt;i++)
	clrf	(key_process@i)
	goto	i1l1418
	line	74
	
i1l755:	
	line	75
;main.c: 74: {
;main.c: 75: RA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
	line	76
	
i1l1412:	
;main.c: 76: delay_ms(200);
	movlw	(0C8h)
	fcall	i1_delay_ms
	line	77
	
i1l1414:	
;main.c: 77: RA0 = 1;
	bsf	(40/8),(40)&7
	line	78
;main.c: 78: delay_ms(200);
	movlw	(0C8h)
	fcall	i1_delay_ms
	line	73
	
i1l1416:	
	incf	(key_process@i),f
	
i1l1418:	
	movf	(key_process@cnt),w
	subwf	(key_process@i),w
	skipc
	goto	u27_21
	goto	u27_20
u27_21:
	goto	i1l755
u27_20:
	line	81
	
i1l746:	
	return
	opt stack 0
GLOBAL	__end_of_key_process
	__end_of_key_process:
;; =============== function _key_process ends ============

	signat	_key_process,88
	global	i1_eeprom_write
psect	text216,local,class=CODE,delta=2
global __ptext216
__ptext216:

;; *************** function i1_eeprom_write *****************
;; Defined at:
;;		line 8 in file "C:\Program Files\HI-TECH Software\PICC\9.80\sources\eewrite.c"
;; Parameters:    Size  Location     Type
;;  eeprom_write    1    wreg     unsigned char 
;;  eeprom_write    1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  eeprom_write    1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_key_process
;; This function uses a non-reentrant model
;;
psect	text216
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\eewrite.c"
	line	8
	global	__size_ofi1_eeprom_write
	__size_ofi1_eeprom_write	equ	__end_ofi1_eeprom_write-i1_eeprom_write
	
i1_eeprom_write:	
	opt	stack 4
; Regs used in i1_eeprom_write: [wreg+status,2+status,0]
;i1eeprom_write@addr stored from wreg
	movwf	(i1eeprom_write@addr)
	line	9
	
i1l804:	
	
i1l805:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1249/8)^080h,(1249)&7
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l805
u36_20:
	
i1l1456:	
	movf	(i1eeprom_write@addr),w
	movwf	(155)^080h	;volatile
	movf	(i1eeprom_write@value),w
	movwf	(154)^080h	;volatile
	
i1l1458:	
	movlw	(03Fh)
	andwf	(156)^080h,f	;volatile
	
i1l1460:	
	bcf	(24/8),(24)&7
	
i1l1462:	
	btfss	(95/8),(95)&7
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l808
u37_20:
	
i1l1464:	
	bsf	(24/8),(24)&7
	
i1l808:	
	bcf	(95/8),(95)&7
	bsf	(1250/8)^080h,(1250)&7
	
i1l1466:	
	movlw	(055h)
	movwf	(157)^080h	;volatile
	movlw	(0AAh)
	movwf	(157)^080h	;volatile
	
i1l1468:	
	bsf	(1249/8)^080h,(1249)&7
	
i1l1470:	
	bcf	(1250/8)^080h,(1250)&7
	
i1l1472:	
	btfss	(24/8),(24)&7
	goto	u38_21
	goto	u38_20
u38_21:
	goto	i1l811
u38_20:
	
i1l1474:	
	bsf	(95/8),(95)&7
	line	10
	
i1l811:	
	return
	opt stack 0
GLOBAL	__end_ofi1_eeprom_write
	__end_ofi1_eeprom_write:
;; =============== function i1_eeprom_write ends ============

	signat	i1_eeprom_write,88
	global	i1_delay_ms
psect	text217,local,class=CODE,delta=2
global __ptext217
__ptext217:

;; *************** function i1_delay_ms *****************
;; Defined at:
;;		line 45 in file "C:\Users\xxxx\Desktop\20110118\PIC16F636\delay.c"
;; Parameters:    Size  Location     Type
;;  delay_ms        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  delay_ms        1    0[COMMON] unsigned char 
;;  delay_ms        1    2[COMMON] unsigned char 
;;  delay_ms        1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_key_process
;; This function uses a non-reentrant model
;;
psect	text217
	file	"C:\Users\xxxx\Desktop\20110118\PIC16F636\delay.c"
	line	45
	global	__size_ofi1_delay_ms
	__size_ofi1_delay_ms	equ	__end_ofi1_delay_ms-i1_delay_ms
	
i1_delay_ms:	
	opt	stack 4
; Regs used in i1_delay_ms: [wreg]
;i1delay_ms@cnt stored from wreg
	movwf	(i1delay_ms@cnt)
	line	54
;delay.c: 53: unsigned char i;
;delay.c: 54: do {
	
i1l3:	
	line	55
	
i1l1454:	
;delay.c: 55: i = 4;
	movlw	(04h)
	movwf	(i1delay_ms@i)
	line	56
;delay.c: 56: do {
	
i1l4:	
	line	57
;delay.c: 57: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(4*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(053h)
	movwf	(i1delay_ms@_dcnt)
	
i1l5:	
	decfsz	(i1delay_ms@_dcnt),f
	goto	u33_21
	goto	u33_20
u33_21:
	goto	i1l5
u33_20:
	
i1l7:	
	line	58
;delay.c: 58: } while(--i);
	decfsz	(i1delay_ms@i),f
	goto	u34_21
	goto	u34_20
u34_21:
	goto	i1l4
u34_20:
	
i1l8:	
	line	59
;delay.c: 59: } while(--cnt);
	decfsz	(i1delay_ms@cnt),f
	goto	u35_21
	goto	u35_20
u35_21:
	goto	i1l3
u35_20:
	line	61
	
i1l10:	
	return
	opt stack 0
GLOBAL	__end_ofi1_delay_ms
	__end_ofi1_delay_ms:
;; =============== function i1_delay_ms ends ============

	signat	i1_delay_ms,88
psect	text218,local,class=CODE,delta=2
global __ptext218
__ptext218:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
