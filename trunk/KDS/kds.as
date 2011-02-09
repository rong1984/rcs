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
# 10 "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 10 "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
	dw 0x3FDF & 0x3FFC & 0x3FF7 & 0x3FFF & 0x3FBF & 0x3F7F ;#
	FNCALL	_main,_init_pic16f636
	FNCALL	_main,_delay_ms
	FNCALL	_main,_init_receiver
	FNCALL	_main,_remote
	FNCALL	_main,_ClearMem
	FNCALL	_remote,_memcpy
	FNCALL	_remote,_NormalKeyGen
	FNCALL	_remote,_Decrypt
	FNCALL	_remote,_delay_ms
	FNCALL	_remote,_DecCHK
	FNCALL	_remote,_Find
	FNCALL	_remote,_Insert
	FNCALL	_remote,_IDWrite
	FNCALL	_remote,_HopUpdate
	FNCALL	_remote,_HopCHK
	FNCALL	_ClearMem,_WRword
	FNCALL	_HopUpdate,_WRword
	FNCALL	_IDWrite,_WRword
	FNCALL	_Insert,_RDword
	FNCALL	_Find,_RDword
	FNCALL	_Find,_RDnext
	FNCALL	_WRword,_eeprom_write
	FNCALL	_RDword,_eeprom_read
	FNCALL	_HopCHK,_ReqResync
	FNCALL	_NormalKeyGen,_memcpy
	FNCALL	_NormalKeyGen,_LoadManufCode
	FNCALL	_NormalKeyGen,_Decrypt
	FNROOT	_main
	FNCALL	_Interrupt,_rxi
	FNCALL	_Interrupt,_tmr1_isr
	FNCALL	intlevel1,_Interrupt
	global	intlevel1
	FNROOT	intlevel1
	global	_Dato
	global	_EHop
	global	_ETemp
	global	_Hop
	global	_Ind
	global	_NextHop
	global	_Bptr
	global	_CFlash
	global	_CLearn
	global	_COut
	global	_CTFlash
	global	_CTLearn
	global	_Continue_Count
	global	_FCode
	global	_RFstate
	global	_RFtype
	global	_aux
	global	_BitCount
	global	_RFcount
	global	_F2Chance
	global	_FHopOK
	global	_FLearn
	global	_FSame
	global	_RFBit
	global	_RFFull
	global	_RFsynch
	global	_Buffer
	global	_DKEY
	global	_SEED
	global	_RX_Buffer
	global	_CMCON0
psect	text817,local,class=CODE,delta=2
global __ptext817
__ptext817:
_CMCON0	set	25
	global	_INTCON
_INTCON	set	11
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_TMR0
_TMR0	set	1
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
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA5
_RA5	set	45
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_EEADR
_EEADR	set	155
	global	_EECON1
_EECON1	set	156
	global	_EECON2
_EECON2	set	157
	global	_EEDATA
_EEDATA	set	154
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WDA
_WDA	set	151
	global	_WPUDA
_WPUDA	set	149
	global	_RD
_RD	set	1248
	global	_T0CS
_T0CS	set	1037
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TRISA1
_TRISA1	set	1065
	global	_TRISA5
_TRISA5	set	1069
	global	_WR
_WR	set	1249
	global	_WREN
_WREN	set	1250
	file	"kds.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
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

_RFcount:
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

_Bptr:
       ds      1

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

_RFstate:
       ds      1

_RFtype:
       ds      1

_aux:
       ds      1

_Buffer:
       ds      22

_DKEY:
       ds      8

_SEED:
       ds      4

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_RX_Buffer:
       ds      22

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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+039h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+016h)
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
	global	?_NormalKeyGen
?_NormalKeyGen:	; 0 bytes @ 0x0
	global	?_Decrypt
?_Decrypt:	; 0 bytes @ 0x0
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x0
	global	?_init_receiver
?_init_receiver:	; 0 bytes @ 0x0
	global	?_rxi
?_rxi:	; 0 bytes @ 0x0
	global	??_rxi
??_rxi:	; 0 bytes @ 0x0
	global	?_init_pic16f636
?_init_pic16f636:	; 0 bytes @ 0x0
	global	?_remote
?_remote:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_tmr1_isr
?_tmr1_isr:	; 0 bytes @ 0x0
	global	??_tmr1_isr
??_tmr1_isr:	; 0 bytes @ 0x0
	global	?_Interrupt
?_Interrupt:	; 0 bytes @ 0x0
	global	??_Interrupt
??_Interrupt:	; 0 bytes @ 0x0
	global	?_LoadManufCode
?_LoadManufCode:	; 0 bytes @ 0x0
	global	?_RDnext
?_RDnext:	; 0 bytes @ 0x0
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
	global	?_ClearMem
?_ClearMem:	; 1 bytes @ 0x0
	global	?_eeprom_read
?_eeprom_read:	; 1 bytes @ 0x0
	global	?_ReqResync
?_ReqResync:	; 1 bytes @ 0x0
	ds	3
	global	??_Decrypt
??_Decrypt:	; 0 bytes @ 0x3
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x3
	global	??_DecCHK
??_DecCHK:	; 0 bytes @ 0x3
	global	??_HopCHK
??_HopCHK:	; 0 bytes @ 0x3
	global	??_init_receiver
??_init_receiver:	; 0 bytes @ 0x3
	global	??_eeprom_read
??_eeprom_read:	; 0 bytes @ 0x3
	global	?_eeprom_write
?_eeprom_write:	; 0 bytes @ 0x3
	global	??_init_pic16f636
??_init_pic16f636:	; 0 bytes @ 0x3
	global	??_LoadManufCode
??_LoadManufCode:	; 0 bytes @ 0x3
	global	??_ReqResync
??_ReqResync:	; 0 bytes @ 0x3
	global	??_RDnext
??_RDnext:	; 0 bytes @ 0x3
	global	?_memcpy
?_memcpy:	; 1 bytes @ 0x3
	global	delay_ms@cnt
delay_ms@cnt:	; 1 bytes @ 0x3
	global	Decrypt@key
Decrypt@key:	; 1 bytes @ 0x3
	global	eeprom_write@value
eeprom_write@value:	; 1 bytes @ 0x3
	global	memcpy@s1
memcpy@s1:	; 1 bytes @ 0x3
	ds	1
	global	??_eeprom_write
??_eeprom_write:	; 0 bytes @ 0x4
	global	delay_ms@i
delay_ms@i:	; 1 bytes @ 0x4
	global	Decrypt@i
Decrypt@i:	; 1 bytes @ 0x4
	global	eeprom_write@addr
eeprom_write@addr:	; 1 bytes @ 0x4
	global	memcpy@n
memcpy@n:	; 2 bytes @ 0x4
	ds	1
	global	?_WRword
?_WRword:	; 0 bytes @ 0x5
	global	delay_ms@_dcnt
delay_ms@_dcnt:	; 1 bytes @ 0x5
	global	Decrypt@j
Decrypt@j:	; 1 bytes @ 0x5
	global	eeprom_read@addr
eeprom_read@addr:	; 1 bytes @ 0x5
	global	WRword@Ind
WRword@Ind:	; 2 bytes @ 0x5
	ds	1
	global	??_memcpy
??_memcpy:	; 0 bytes @ 0x6
	global	?_RDword
?_RDword:	; 0 bytes @ 0x6
	global	Decrypt@p
Decrypt@p:	; 1 bytes @ 0x6
	global	RDword@Ind
RDword@Ind:	; 2 bytes @ 0x6
	ds	1
	global	??_NormalKeyGen
??_NormalKeyGen:	; 0 bytes @ 0x7
	global	??_IDWrite
??_IDWrite:	; 0 bytes @ 0x7
	global	??_HopUpdate
??_HopUpdate:	; 0 bytes @ 0x7
	global	??_ClearMem
??_ClearMem:	; 0 bytes @ 0x7
	global	??_WRword
??_WRword:	; 0 bytes @ 0x7
	ds	1
	global	??_Find
??_Find:	; 0 bytes @ 0x8
	global	??_Insert
??_Insert:	; 0 bytes @ 0x8
	global	??_main
??_main:	; 0 bytes @ 0x8
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_RDword
??_RDword:	; 0 bytes @ 0x0
	global	memcpy@d1
memcpy@d1:	; 1 bytes @ 0x0
	ds	1
	global	memcpy@d
memcpy@d:	; 1 bytes @ 0x1
	ds	1
	global	Find@Found
Find@Found:	; 1 bytes @ 0x2
	global	memcpy@s
memcpy@s:	; 1 bytes @ 0x2
	ds	1
	global	NormalKeyGen@HOPtemp
NormalKeyGen@HOPtemp:	; 4 bytes @ 0x3
	ds	4
	global	NormalKeyGen@SKEYtemp
NormalKeyGen@SKEYtemp:	; 4 bytes @ 0x7
	ds	4
	global	??_remote
??_remote:	; 0 bytes @ 0xB
	ds	2
	global	remote@k
remote@k:	; 1 bytes @ 0xD
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0xE
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 81, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8      11
;; BANK0           80     15      72
;; BANK1           32      0      22

;;
;; Pointer list with targets:

;; ?_memcpy	PTR void  size(1) Largest target is 22
;;		 -> NormalKeyGen@SKEYtemp(BANK0[4]), NormalKeyGen@HOPtemp(BANK0[4]), SEED(BANK0[4]), DKEY(BANK0[8]), 
;;		 -> Buffer(BANK0[22]), 
;;
;; memcpy@d1	PTR void  size(1) Largest target is 22
;;		 -> NormalKeyGen@SKEYtemp(BANK0[4]), NormalKeyGen@HOPtemp(BANK0[4]), SEED(BANK0[4]), DKEY(BANK0[8]), 
;;		 -> Buffer(BANK0[22]), 
;;
;; memcpy@d	PTR unsigned char  size(1) Largest target is 22
;;		 -> NormalKeyGen@SKEYtemp(BANK0[4]), NormalKeyGen@HOPtemp(BANK0[4]), SEED(BANK0[4]), DKEY(BANK0[8]), 
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
;; sp__memcpy	PTR void  size(1) Largest target is 22
;;		 -> NormalKeyGen@SKEYtemp(BANK0[4]), NormalKeyGen@HOPtemp(BANK0[4]), SEED(BANK0[4]), DKEY(BANK0[8]), 
;;		 -> Buffer(BANK0[22]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _remote->_IDWrite
;;   _ClearMem->_WRword
;;   _HopUpdate->_WRword
;;   _IDWrite->_WRword
;;   _Insert->_RDword
;;   _Find->_RDword
;;   _WRword->_eeprom_write
;;   _RDword->_eeprom_read
;;   _NormalKeyGen->_memcpy
;;   _NormalKeyGen->_Decrypt
;;
;; Critical Paths under _Interrupt in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_remote
;;   _remote->_NormalKeyGen
;;   _Insert->_RDword
;;   _Find->_RDword
;;   _NormalKeyGen->_memcpy
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0    1742
;;                                             14 BANK0      1     1      0
;;                     _init_pic16f636
;;                           _delay_ms
;;                      _init_receiver
;;                             _remote
;;                           _ClearMem
;; ---------------------------------------------------------------------------------
;; (1) _remote                                               3     3      0    1518
;;                                             11 BANK0      3     3      0
;;                             _memcpy
;;                       _NormalKeyGen
;;                            _Decrypt
;;                           _delay_ms
;;                             _DecCHK
;;                               _Find
;;                             _Insert
;;                            _IDWrite
;;                          _HopUpdate
;;                             _HopCHK
;; ---------------------------------------------------------------------------------
;; (1) _ClearMem                                             0     0      0      88
;;                             _WRword
;; ---------------------------------------------------------------------------------
;; (2) _HopUpdate                                            0     0      0      88
;;                             _WRword
;; ---------------------------------------------------------------------------------
;; (2) _IDWrite                                              1     1      0      88
;;                                              7 COMMON     1     1      0
;;                             _WRword
;; ---------------------------------------------------------------------------------
;; (2) _Insert                                               0     0      0      93
;;                             _RDword
;; ---------------------------------------------------------------------------------
;; (2) _Find                                                 1     1      0     161
;;                                              2 BANK0      1     1      0
;;                             _RDword
;;                             _RDnext
;; ---------------------------------------------------------------------------------
;; (2) _WRword                                               2     0      2      88
;;                                              5 COMMON     2     0      2
;;                       _eeprom_write
;; ---------------------------------------------------------------------------------
;; (3) _RDword                                               4     2      2      93
;;                                              6 COMMON     2     0      2
;;                                              0 BANK0      2     2      0
;;                        _eeprom_read
;; ---------------------------------------------------------------------------------
;; (2) _HopCHK                                               0     0      0       0
;;                          _ReqResync
;; ---------------------------------------------------------------------------------
;; (2) _NormalKeyGen                                         8     8      0     479
;;                                              3 BANK0      8     8      0
;;                             _memcpy
;;                      _LoadManufCode
;;                            _Decrypt
;; ---------------------------------------------------------------------------------
;; (3) _eeprom_write                                         2     1      1      44
;;                                              3 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (3) _RDnext                                               2     2      0       0
;;                                              3 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (4) _eeprom_read                                          3     3      0      31
;;                                              3 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (3) _ReqResync                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _LoadManufCode                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _init_receiver                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _DecCHK                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _delay_ms                                             3     3      0      68
;;                                              3 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _Decrypt                                              4     4      0     163
;;                                              3 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (3) _memcpy                                               7     4      3     174
;;                                              3 COMMON     4     1      3
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _init_pic16f636                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _Interrupt                                            3     3      0       0
;;                                              0 COMMON     3     3      0
;;                                _rxi
;;                           _tmr1_isr
;; ---------------------------------------------------------------------------------
;; (6) _rxi                                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; (6) _tmr1_isr                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init_pic16f636
;;   _delay_ms
;;   _init_receiver
;;   _remote
;;     _memcpy
;;     _NormalKeyGen
;;       _memcpy
;;       _LoadManufCode
;;       _Decrypt
;;     _Decrypt
;;     _delay_ms
;;     _DecCHK
;;     _Find
;;       _RDword
;;         _eeprom_read
;;       _RDnext
;;     _Insert
;;       _RDword
;;         _eeprom_read
;;     _IDWrite
;;       _WRword
;;         _eeprom_write
;;     _HopUpdate
;;       _WRword
;;         _eeprom_write
;;     _HopCHK
;;       _ReqResync
;;   _ClearMem
;;     _WRword
;;       _eeprom_write
;;
;; _Interrupt (ROOT)
;;   _rxi
;;   _tmr1_isr
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       8       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      F      48       4       90.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITBANK1            20      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               20      0      16       6       68.8%
;;ABS                  0      0      69       7        0.0%
;;DATA                 0      0      71       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 223 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   14[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_init_pic16f636
;;		_delay_ms
;;		_init_receiver
;;		_remote
;;		_ClearMem
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
	line	223
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	225
	
l3521:	
;main.c: 224: char i;
;main.c: 225: init_pic16f636();
	fcall	_init_pic16f636
	line	227
	
l3523:	
;main.c: 227: for(i=0; i< 5; i++ )
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@i)
	line	228
	
l480:	
	line	230
;main.c: 228: {
;main.c: 230: RA5 = 1;
	bsf	(45/8),(45)&7
	line	231
	
l3529:	
;main.c: 231: delay_ms(200);
	movlw	(0C8h)
	fcall	_delay_ms
	line	233
	
l3531:	
;main.c: 233: RA5 = 0;
	bcf	(45/8),(45)&7
	line	234
;main.c: 234: delay_ms(200);
	movlw	(0C8h)
	fcall	_delay_ms
	line	227
	
l3533:	
	incf	(main@i),f
	
l3535:	
	movlw	(05h)
	subwf	(main@i),w
	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l480
u2320:
	line	238
	
l3537:	
;main.c: 235: }
;main.c: 238: TMR1L = 0x00;
	clrf	(14)	;volatile
	line	239
;main.c: 239: TMR1H = 0x00;
	clrf	(15)	;volatile
	line	240
	
l3539:	
;main.c: 240: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	241
	
l3541:	
;main.c: 241: T1CON = 0x11;
	movlw	(011h)
	movwf	(16)	;volatile
	line	242
	
l3543:	
;main.c: 242: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	244
	
l3545:	
;main.c: 244: init_receiver();
	fcall	_init_receiver
	line	246
	
l3547:	
;main.c: 246: INTCON = 0x60;
	movlw	(060h)
	movwf	(11)	;volatile
	line	247
	
l3549:	
;main.c: 247: GIE = 1;
	bsf	(95/8),(95)&7
	line	252
	
l3551:	
;main.c: 250: {
;main.c: 252: if(RFFull)
	btfss	(_RFFull/8),(_RFFull)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l3561
u2330:
	line	254
	
l3553:	
;main.c: 253: {
;main.c: 254: RA5 = 1;
	bsf	(45/8),(45)&7
	line	255
	
l3555:	
;main.c: 255: remote();
	fcall	_remote
	line	256
	
l3557:	
;main.c: 256: RA5 = 0;
	bcf	(45/8),(45)&7
	line	257
	
l3559:	
;main.c: 257: RFFull = 0;
	bcf	(_RFFull/8),(_RFFull)&7
	line	262
	
l3561:	
;main.c: 258: }
;main.c: 262: if(Continue_Count)
	movf	(_Continue_Count),w
	skipz
	goto	u2340
	goto	l3551
u2340:
	line	264
	
l3563:	
;main.c: 263: {
;main.c: 264: Continue_Count = 0;
	clrf	(_Continue_Count)
	line	266
	
l3565:	
;main.c: 266: if(!RA2)
	btfsc	(42/8),(42)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l3589
u2350:
	line	268
	
l3567:	
;main.c: 267: {
;main.c: 268: CLearn++;
	incf	(_CLearn),f
	line	270
	
l3569:	
;main.c: 270: if(CLearn == 128)
	movf	(_CLearn),w
	xorlw	080h
	skipz
	goto	u2361
	goto	u2360
u2361:
	goto	l3581
u2360:
	line	272
	
l3571:	
;main.c: 271: {
;main.c: 272: RA5 = 0;
	bcf	(45/8),(45)&7
	line	273
;main.c: 273: while(!RA2);
	
l487:	
	btfss	(42/8),(42)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l487
u2370:
	
l489:	
	line	274
;main.c: 274: RA5 = 1;
	bsf	(45/8),(45)&7
	line	275
	
l3573:	
;main.c: 275: ClearMem();
	fcall	_ClearMem
	line	277
	
l3575:	
;main.c: 277: COut = 4;
	movlw	(04h)
	movwf	(_COut)
	line	278
	
l3577:	
;main.c: 278: CLearn = 0;
	clrf	(_CLearn)
	line	279
	
l3579:	
;main.c: 279: FLearn = 0;
	bcf	(_FLearn/8),(_FLearn)&7
	line	282
	
l3581:	
;main.c: 280: }
;main.c: 282: if(CLearn == 4)
	movf	(_CLearn),w
	xorlw	04h
	skipz
	goto	u2381
	goto	u2380
u2381:
	goto	l3591
u2380:
	line	284
	
l3583:	
;main.c: 283: {
;main.c: 284: FLearn = 1;
	bsf	(_FLearn/8),(_FLearn)&7
	line	285
	
l3585:	
;main.c: 285: CTLearn = 255;
	movlw	(0FFh)
	movwf	(_CTLearn)
	line	286
	
l3587:	
;main.c: 286: RA5 = 1;
	bsf	(45/8),(45)&7
	goto	l3591
	line	290
	
l3589:	
;main.c: 289: else
;main.c: 290: CLearn=0;
	clrf	(_CLearn)
	line	292
	
l3591:	
;main.c: 292: if(COut > 0)
	movf	(_COut),w
	skipz
	goto	u2390
	goto	l3597
u2390:
	line	294
	
l3593:	
;main.c: 293: {
;main.c: 294: COut--;
	decf	(_COut),f
	line	295
;main.c: 295: if(COut == 0)
	movf	(_COut),f
	skipz
	goto	u2401
	goto	u2400
u2401:
	goto	l3597
u2400:
	line	297
	
l3595:	
;main.c: 296: {
;main.c: 297: RA5 = 0;
	bcf	(45/8),(45)&7
	line	298
;main.c: 298: RA1 = 0;
	bcf	(41/8),(41)&7
	line	306
	
l3597:	
;main.c: 303: }
;main.c: 304: }
;main.c: 306: if(CTLearn > 0)
	movf	(_CTLearn),w
	skipz
	goto	u2410
	goto	l3603
u2410:
	line	308
	
l3599:	
;main.c: 307: {
;main.c: 308: CTLearn--;
	decf	(_CTLearn),f
	line	309
;main.c: 309: if(CTLearn == 0)
	movf	(_CTLearn),f
	skipz
	goto	u2421
	goto	u2420
u2421:
	goto	l3603
u2420:
	line	311
	
l3601:	
;main.c: 310: {
;main.c: 311: RA5 = 0;
	bcf	(45/8),(45)&7
	line	312
;main.c: 312: FLearn = 0;
	bcf	(_FLearn/8),(_FLearn)&7
	line	316
	
l3603:	
;main.c: 313: }
;main.c: 314: }
;main.c: 316: if(CFlash > 0)
	movf	(_CFlash),w
	skipz
	goto	u2430
	goto	l3551
u2430:
	line	318
	
l3605:	
;main.c: 317: {
;main.c: 318: CTFlash--;
	decf	(_CTFlash),f
	line	319
;main.c: 319: if(CTFlash == 0)
	movf	(_CTFlash),f
	skipz
	goto	u2441
	goto	u2440
u2441:
	goto	l3551
u2440:
	line	321
	
l3607:	
;main.c: 320: {
;main.c: 321: CTFlash = 5;
	movlw	(05h)
	movwf	(_CTFlash)
	line	322
	
l3609:	
;main.c: 322: CFlash--;
	decf	(_CFlash),f
	line	323
	
l3611:	
;main.c: 323: RA5 = 0;
	bcf	(45/8),(45)&7
	line	324
	
l3613:	
;main.c: 324: if(CFlash & 1)
	btfss	(_CFlash),(0)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l484
u2450:
	line	325
	
l3615:	
;main.c: 325: RA5 = 1;
	bsf	(45/8),(45)&7
	goto	l3551
	line	328
	
l484:	
	goto	l3551
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	330
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_remote
psect	text818,local,class=CODE,delta=2
global __ptext818
__ptext818:

;; *************** function _remote *****************
;; Defined at:
;;		line 109 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       2       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_memcpy
;;		_NormalKeyGen
;;		_Decrypt
;;		_delay_ms
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
psect	text818
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
	line	109
	global	__size_of_remote
	__size_of_remote	equ	__end_of_remote-_remote
	
_remote:	
	opt	stack 2
; Regs used in _remote: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	114
	
l3413:	
;main.c: 112: char k;
;main.c: 114: memcpy(Buffer, RX_Buffer, 13);
	movlw	(_RX_Buffer)&0ffh
	movwf	(?_memcpy)
	movlw	0Dh
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(_Buffer)&0ffh
	fcall	_memcpy
	line	115
	
l3415:	
;main.c: 115: RFFull = 0;
	bcf	(_RFFull/8),(_RFFull)&7
	line	117
;main.c: 117: switch(RFtype)
	goto	l3469
	line	120
	
l3417:	
;main.c: 120: NormalKeyGen();
	fcall	_NormalKeyGen
	line	121
;main.c: 121: Decrypt();
	fcall	_Decrypt
	line	122
;main.c: 122: switch(Buffer[3]&0xF0)
	goto	l3463
	line	125
	
l3419:	
;main.c: 125: for(k=0;k<1;k++)
	clrf	(remote@k)
	line	126
	
l451:	
	line	127
;main.c: 126: {
;main.c: 127: RC5 = 1;
	bsf	(61/8),(61)&7
	line	128
	
l3425:	
;main.c: 128: delay_ms(100);
	movlw	(064h)
	fcall	_delay_ms
	line	129
	
l3427:	
;main.c: 129: RC5 = 0;
	bcf	(61/8),(61)&7
	line	130
;main.c: 130: delay_ms(100);
	movlw	(064h)
	fcall	_delay_ms
	line	125
	
l3429:	
	incf	(remote@k),f
	
l3431:	
	movf	(remote@k),w
	skipz
	goto	u2200
	goto	l451
u2200:
	goto	l3471
	line	134
	
l3433:	
;main.c: 134: for(k=0;k<3;k++)
	clrf	(remote@k)
	line	135
	
l455:	
	line	136
;main.c: 135: {
;main.c: 136: RC4 = 1;
	bsf	(60/8),(60)&7
	line	137
	
l3439:	
;main.c: 137: delay_ms(100);
	movlw	(064h)
	fcall	_delay_ms
	line	138
	
l3441:	
;main.c: 138: RC4 = 0;
	bcf	(60/8),(60)&7
	line	139
;main.c: 139: delay_ms(100);
	movlw	(064h)
	fcall	_delay_ms
	line	134
	
l3443:	
	incf	(remote@k),f
	
l3445:	
	movlw	(03h)
	subwf	(remote@k),w
	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l455
u2210:
	goto	l3471
	line	143
	
l3447:	
;main.c: 143: for(k=0;k<5;k++)
	clrf	(remote@k)
	line	144
	
l458:	
	line	145
;main.c: 144: {
;main.c: 145: RA1 = 1;
	bsf	(41/8),(41)&7
	line	146
	
l3453:	
;main.c: 146: delay_ms(100);
	movlw	(064h)
	fcall	_delay_ms
	line	147
	
l3455:	
;main.c: 147: RA1 = 0;
	bcf	(41/8),(41)&7
	line	148
;main.c: 148: delay_ms(100);
	movlw	(064h)
	fcall	_delay_ms
	line	143
	
l3457:	
	incf	(remote@k),f
	
l3459:	
	movlw	(05h)
	subwf	(remote@k),w
	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l458
u2220:
	goto	l3471
	line	122
	
l3463:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_Buffer)+03h,w
	andlw	0F0h
	movwf	(??_remote+0)+0
	clrf	(??_remote+0)+0+1
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Bytes Cycles
; simple_byte     4     3 (average)
; direct_byte    14    13 (fixed)
;	Chosen strategy is simple_byte

	movf 1+(??_remote+0)+0,w
	xorlw	0^0	; case 0
	skipnz
	goto	l3637
	goto	l3471
	
l3637:	
; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 16 to 64
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    10     6 (average)
; direct_byte    65    16 (fixed)
;	Chosen strategy is simple_byte

	movf 0+(??_remote+0)+0,w
	xorlw	16^0	; case 16
	skipnz
	goto	l3419
	xorlw	32^16	; case 32
	skipnz
	goto	l3433
	xorlw	64^32	; case 64
	skipnz
	goto	l3447
	goto	l3471

	line	163
	
l3465:	
;main.c: 163: NormalKeyGen();
	fcall	_NormalKeyGen
	line	164
;main.c: 164: Decrypt();
	fcall	_Decrypt
	line	165
;main.c: 165: break;
	goto	l3471
	line	117
	
l3469:	
	movf	(_RFtype),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    10     6 (average)
; direct_byte    19    16 (fixed)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l3417
	xorlw	2^1	; case 2
	skipnz
	goto	l3471
	xorlw	3^2	; case 3
	skipnz
	goto	l3471
	goto	l3465

	line	168
	
l3471:	
;main.c: 168: if(DecCHK() == 0)
	fcall	_DecCHK
	iorlw	0
	skipz
	goto	u2231
	goto	u2230
u2231:
	goto	l464
u2230:
	goto	l465
	line	171
	
l464:	
	line	173
;main.c: 171: }
;main.c: 173: if(FLearn)
	btfss	(_FLearn/8),(_FLearn)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l3493
u2240:
	line	175
	
l3475:	
;main.c: 174: {
;main.c: 175: if(Find()== 0)
	fcall	_Find
	iorlw	0
	skipz
	goto	u2251
	goto	u2250
u2251:
	goto	l3481
u2250:
	line	177
	
l3477:	
;main.c: 176: {
;main.c: 177: if(!Insert())
	fcall	_Insert
	iorlw	0
	skipz
	goto	u2261
	goto	u2260
u2261:
	goto	l3481
u2260:
	goto	l465
	line	181
	
l3481:	
;main.c: 179: }
;main.c: 181: IDWrite();
	fcall	_IDWrite
	line	182
	
l3483:	
;main.c: 182: FHopOK = 1;
	bsf	(_FHopOK/8),(_FHopOK)&7
	line	183
;main.c: 183: HopUpdate();
	fcall	_HopUpdate
	line	185
	
l3485:	
;main.c: 185: CFlash = 10;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_CFlash)
	line	186
	
l3487:	
;main.c: 186: CTFlash = 5;
	movlw	(05h)
	movwf	(_CTFlash)
	line	187
	
l3489:	
;main.c: 187: RA5 = 1;
	bsf	(45/8),(45)&7
	line	188
	
l3491:	
;main.c: 188: FLearn = 0;
	bcf	(_FLearn/8),(_FLearn)&7
	line	189
;main.c: 189: }
	goto	l465
	line	192
	
l3493:	
;main.c: 190: else
;main.c: 191: {
;main.c: 192: if(Find()== 0)
	fcall	_Find
	iorlw	0
	skipz
	goto	u2271
	goto	u2270
u2271:
	goto	l3499
u2270:
	goto	l465
	line	198
	
l3499:	
;main.c: 196: else
;main.c: 197: {
;main.c: 198: if(!HopCHK())
	fcall	_HopCHK
	iorlw	0
	skipz
	goto	u2281
	goto	u2280
u2281:
	goto	l472
u2280:
	goto	l465
	line	201
	
l472:	
	line	202
;main.c: 201: }
;main.c: 202: if(FSame)
	btfss	(_FSame/8),(_FSame)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l3507
u2290:
	line	204
	
l3503:	
;main.c: 203: {
;main.c: 204: if(COut >0)
	movf	(_COut),w
	skipz
	goto	u2300
	goto	l465
u2300:
	line	205
	
l3505:	
;main.c: 205: COut = 4;
	movlw	(04h)
	movwf	(_COut)
	goto	l465
	line	211
	
l3507:	
;main.c: 209: else
;main.c: 210: {
;main.c: 211: HopUpdate();
	fcall	_HopUpdate
	line	212
	
l3509:	
;main.c: 212: RA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7
	line	213
	
l3511:	
;main.c: 213: if(((Buffer[7] ^ FCode) & 0xf0) == 0)
	movf	0+(_Buffer)+07h,w
	xorwf	(_FCode),w
	andlw	0F0h
	btfss	status,2
	goto	u2311
	goto	u2310
u2311:
	goto	l3505
u2310:
	line	214
	
l3513:	
;main.c: 214: RA5 = 1;
	bsf	(45/8),(45)&7
	goto	l3505
	line	219
	
l465:	
	return
	opt stack 0
GLOBAL	__end_of_remote
	__end_of_remote:
;; =============== function _remote ends ============

	signat	_remote,88
	global	_ClearMem
psect	text819,local,class=CODE,delta=2
global __ptext819
__ptext819:

;; *************** function _ClearMem *****************
;; Defined at:
;;		line 299 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
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
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_WRword
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text819
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
	line	299
	global	__size_of_ClearMem
	__size_of_ClearMem	equ	__end_of_ClearMem-_ClearMem
	
_ClearMem:	
	opt	stack 3
; Regs used in _ClearMem: [wreg+status,2+status,0+pclath+cstack]
	line	301
	
l3055:	
;table.c: 301: for (Ind=0; Ind < (8 * 8); Ind+=8)
	clrf	(_Ind)
	clrf	(_Ind+1)
	
l3057:	
	movlw	high(040h)
	subwf	(_Ind+1),w
	movlw	low(040h)
	skipnz
	subwf	(_Ind),w
	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l3061
u1740:
	goto	l1423
	line	303
	
l3061:	
;table.c: 302: {
;table.c: 303: Dato = 0xffff;
	movlw	low(0FFFFh)
	movwf	(_Dato)
	movlw	high(0FFFFh)
	movwf	((_Dato))+1
	line	304
	
l3063:	
;table.c: 304: WRword( Ind);
	movf	(_Ind+1),w
	movwf	(?_WRword+1)
	movf	(_Ind),w
	movwf	(?_WRword)
	fcall	_WRword
	line	301
	
l3065:	
	movlw	08h
	bcf	status, 5	;RP0=0, select bank0
	addwf	(_Ind),f
	skipnc
	incf	(_Ind+1),f
	goto	l3057
	line	307
	
l1423:	
	return
	opt stack 0
GLOBAL	__end_of_ClearMem
	__end_of_ClearMem:
;; =============== function _ClearMem ends ============

	signat	_ClearMem,89
	global	_HopUpdate
psect	text820,local,class=CODE,delta=2
global __ptext820
__ptext820:

;; *************** function _HopUpdate *****************
;; Defined at:
;;		line 276 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_WRword
;; This function is called by:
;;		_remote
;; This function uses a non-reentrant model
;;
psect	text820
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
	line	276
	global	__size_of_HopUpdate
	__size_of_HopUpdate	equ	__end_of_HopUpdate-_HopUpdate
	
_HopUpdate:	
	opt	stack 2
; Regs used in _HopUpdate: [wreg+status,2+status,0+pclath+cstack]
	line	277
	
l3041:	
;table.c: 277: if (!FHopOK)
	btfsc	(_FHopOK/8),(_FHopOK)&7
	goto	u1731
	goto	u1730
u1731:
	goto	l3045
u1730:
	goto	l1418
	line	280
	
l3045:	
;table.c: 280: Hop = ((unsigned int)Buffer[1]<<8) + Buffer[0];
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(_Buffer)+01h,w
	movwf	(_Hop+1)
	movf	(_Buffer),w
	movwf	(_Hop)
	line	281
;table.c: 281: Dato = Hop;
	movf	(_Hop+1),w
	movwf	(_Dato+1)
	movf	(_Hop),w
	movwf	(_Dato)
	line	282
	
l3047:	
;table.c: 282: WRword(Ind+4);
	movf	(_Ind+1),w
	movwf	(?_WRword+1)
	movf	(_Ind),w
	movwf	(?_WRword)
	movlw	04h
	addwf	(?_WRword),f
	skipnc
	incf	(?_WRword+1),f
	fcall	_WRword
	line	283
	
l3049:	
;table.c: 283: Dato = Hop;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Hop+1),w
	movwf	(_Dato+1)
	movf	(_Hop),w
	movwf	(_Dato)
	line	284
;table.c: 284: WRword(Ind+6);
	movf	(_Ind+1),w
	movwf	(?_WRword+1)
	movf	(_Ind),w
	movwf	(?_WRword)
	movlw	06h
	addwf	(?_WRword),f
	skipnc
	incf	(?_WRword+1),f
	fcall	_WRword
	line	285
	
l3051:	
;table.c: 285: FHopOK = 0;
	bcf	(_FHopOK/8),(_FHopOK)&7
	line	288
	
l1418:	
	return
	opt stack 0
GLOBAL	__end_of_HopUpdate
	__end_of_HopUpdate:
;; =============== function _HopUpdate ends ============

	signat	_HopUpdate,89
	global	_IDWrite
psect	text821,local,class=CODE,delta=2
global __ptext821
__ptext821:

;; *************** function _IDWrite *****************
;; Defined at:
;;		line 250 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
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
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          1       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_WRword
;; This function is called by:
;;		_remote
;; This function uses a non-reentrant model
;;
psect	text821
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
	line	250
	global	__size_of_IDWrite
	__size_of_IDWrite	equ	__end_of_IDWrite-_IDWrite
	
_IDWrite:	
	opt	stack 2
; Regs used in _IDWrite: [wreg+status,2+status,0+pclath+cstack]
	line	251
	
l3025:	
;table.c: 251: if (!FLearn)
	btfsc	(_FLearn/8),(_FLearn)&7
	goto	u1721
	goto	u1720
u1721:
	goto	l3029
u1720:
	goto	l1414
	line	254
	
l3029:	
;table.c: 254: Dato = Buffer[7];
	movf	0+(_Buffer)+07h,w
	movwf	(_Dato)
	clrf	(_Dato+1)
	line	255
;table.c: 255: Dato = (Dato<<8) + Buffer[4];
	movf	(_Dato),w
	movwf	(??_IDWrite+0)+0
	movf	0+(_Buffer)+04h,w
	movwf	(_Dato)
	movf	(??_IDWrite+0)+0,w
	movwf	(_Dato+1)
	line	256
	
l3031:	
;table.c: 256: WRword(Ind);
	movf	(_Ind+1),w
	movwf	(?_WRword+1)
	movf	(_Ind),w
	movwf	(?_WRword)
	fcall	_WRword
	line	258
	
l3033:	
;table.c: 258: Dato = Buffer[6];
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(_Buffer)+06h,w
	movwf	(_Dato)
	clrf	(_Dato+1)
	line	259
	
l3035:	
;table.c: 259: Dato = (Dato<<8) + Buffer[5];
	movf	(_Dato),w
	movwf	(??_IDWrite+0)+0
	movf	0+(_Buffer)+05h,w
	movwf	(_Dato)
	movf	(??_IDWrite+0)+0,w
	movwf	(_Dato+1)
	line	260
	
l3037:	
;table.c: 260: WRword(Ind+2);
	movf	(_Ind+1),w
	movwf	(?_WRword+1)
	movf	(_Ind),w
	movwf	(?_WRword)
	movlw	02h
	addwf	(?_WRword),f
	skipnc
	incf	(?_WRword+1),f
	fcall	_WRword
	line	263
	
l1414:	
	return
	opt stack 0
GLOBAL	__end_of_IDWrite
	__end_of_IDWrite:
;; =============== function _IDWrite ends ============

	signat	_IDWrite,89
	global	_Insert
psect	text822,local,class=CODE,delta=2
global __ptext822
__ptext822:

;; *************** function _Insert *****************
;; Defined at:
;;		line 224 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
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
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RDword
;; This function is called by:
;;		_remote
;; This function uses a non-reentrant model
;;
psect	text822
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
	line	224
	global	__size_of_Insert
	__size_of_Insert	equ	__end_of_Insert-_Insert
	
_Insert:	
	opt	stack 2
; Regs used in _Insert: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	225
	
l3391:	
;table.c: 225: for (Ind=0; Ind < (8 * 8); Ind+=8)
	clrf	(_Ind)
	clrf	(_Ind+1)
	
l3393:	
	movlw	high(040h)
	subwf	(_Ind+1),w
	movlw	low(040h)
	skipnz
	subwf	(_Ind),w
	skipc
	goto	u2171
	goto	u2170
u2171:
	goto	l3397
u2170:
	goto	l3409
	line	227
	
l3397:	
;table.c: 226: {
;table.c: 227: RDword(Ind);
	movf	(_Ind+1),w
	movwf	(?_RDword+1)
	movf	(_Ind),w
	movwf	(?_RDword)
	fcall	_RDword
	line	228
	
l3399:	
;table.c: 228: FCode = (Dato>>8);
	movf	(_Dato+1),w
	movwf	(_FCode)
	line	230
	
l3401:	
;table.c: 230: if ( (FCode & 0xf0) == 0xf0)
	movf	(_FCode),w
	andlw	0F0h
	xorlw	0F0h
	skipz
	goto	u2181
	goto	u2180
u2181:
	goto	l3407
u2180:
	line	231
	
l3403:	
;table.c: 231: return 1;
	movlw	(01h)
	goto	l1410
	line	225
	
l3407:	
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
	goto	u2191
	goto	u2190
u2191:
	goto	l3397
u2190:
	line	234
	
l3409:	
;table.c: 232: }
;table.c: 234: return 0;
	movlw	(0)
	line	235
	
l1410:	
	return
	opt stack 0
GLOBAL	__end_of_Insert
	__end_of_Insert:
;; =============== function _Insert ends ============

	signat	_Insert,89
	global	_Find
psect	text823,local,class=CODE,delta=2
global __ptext823
__ptext823:

;; *************** function _Find *****************
;; Defined at:
;;		line 174 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  Found           1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RDword
;;		_RDnext
;; This function is called by:
;;		_remote
;; This function uses a non-reentrant model
;;
psect	text823
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
	line	174
	global	__size_of_Find
	__size_of_Find	equ	__end_of_Find-_Find
	
_Find:	
	opt	stack 2
; Regs used in _Find: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	176
	
l3353:	
;table.c: 175: unsigned char Found;
;table.c: 176: Found = 0;
	clrf	(Find@Found)
	line	178
;table.c: 178: for (Ind=0; Ind < (8 * 8); Ind+=8)
	clrf	(_Ind)
	clrf	(_Ind+1)
	
l3355:	
	movlw	high(040h)
	subwf	(_Ind+1),w
	movlw	low(040h)
	skipnz
	subwf	(_Ind),w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l3359
u2100:
	goto	l3381
	line	180
	
l3359:	
;table.c: 179: {
;table.c: 180: RDword( Ind);
	movf	(_Ind+1),w
	movwf	(?_RDword+1)
	movf	(_Ind),w
	movwf	(?_RDword)
	fcall	_RDword
	line	181
	
l3361:	
;table.c: 181: FCode = (Dato>>8);
	movf	(_Dato+1),w
	movwf	(_FCode)
	line	183
	
l3363:	
;table.c: 183: if ( (FCode & 0xf0) == 0xf0)
	movf	(_FCode),w
	andlw	0F0h
	xorlw	0F0h
	skipz
	goto	u2111
	goto	u2110
u2111:
	goto	l3367
u2110:
	goto	l3379
	line	186
	
l3367:	
;table.c: 186: if (Buffer[4] != (Dato & 0xff))
	movf	0+(_Buffer)+04h,w
	xorwf	(_Dato),w
	skipnz
	goto	u2121
	goto	u2120
u2121:
	goto	l3371
u2120:
	goto	l3379
	line	189
	
l3371:	
;table.c: 189: RDnext();
	fcall	_RDnext
	line	190
	
l3373:	
;table.c: 190: if ( ( (Dato & 0xff) == Buffer[5]) && ( (Dato>>8) == Buffer[6]))
	movf	0+(_Buffer)+05h,w
	xorwf	(_Dato),w
	skipz
	goto	u2131
	goto	u2130
u2131:
	goto	l3379
u2130:
	
l3375:	
	movf	(_Dato+1),w
	xorwf	0+(_Buffer)+06h,w
	skipz
	goto	u2141
	goto	u2140
u2141:
	goto	l3379
u2140:
	line	192
	
l3377:	
;table.c: 191: {
;table.c: 192: Found = 1;
	clrf	(Find@Found)
	incf	(Find@Found),f
	line	193
;table.c: 193: break;
	goto	l3381
	line	178
	
l3379:	
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
	goto	u2151
	goto	u2150
u2151:
	goto	l3359
u2150:
	line	197
	
l3381:	
;table.c: 194: }
;table.c: 195: }
;table.c: 197: if (Found == 1)
	decf	(Find@Found),w
	skipz
	goto	u2161
	goto	u2160
u2161:
	goto	l1403
u2160:
	line	199
	
l3383:	
;table.c: 198: {
;table.c: 199: RDnext();
	fcall	_RDnext
	line	200
	
l3385:	
;table.c: 200: EHop = Dato;
	movf	(_Dato+1),w
	movwf	(_EHop+1)
	movf	(_Dato),w
	movwf	(_EHop)
	line	201
	
l3387:	
;table.c: 201: RDnext();
	fcall	_RDnext
	line	202
;table.c: 202: ETemp= Dato;
	movf	(_Dato+1),w
	movwf	(_ETemp+1)
	movf	(_Dato),w
	movwf	(_ETemp)
	line	203
	
l1403:	
	line	205
;table.c: 203: }
;table.c: 205: return Found;
	movf	(Find@Found),w
	line	206
	
l1404:	
	return
	opt stack 0
GLOBAL	__end_of_Find
	__end_of_Find:
;; =============== function _Find ends ============

	signat	_Find,89
	global	_WRword
psect	text824,local,class=CODE,delta=2
global __ptext824
__ptext824:

;; *************** function _WRword *****************
;; Defined at:
;;		line 149 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
;; Parameters:    Size  Location     Type
;;  Ind             2    5[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_eeprom_write
;; This function is called by:
;;		_IDWrite
;;		_HopUpdate
;;		_ClearMem
;; This function uses a non-reentrant model
;;
psect	text824
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
	line	149
	global	__size_of_WRword
	__size_of_WRword	equ	__end_of_WRword-_WRword
	
_WRword:	
	opt	stack 3
; Regs used in _WRword: [wreg+status,2+status,0+pclath+cstack]
	line	151
	
l2959:	
;table.c: 151: eeprom_write(Ind, Dato);
	movf	(_Dato),w
	movwf	(?_eeprom_write)
	movf	(WRword@Ind),w
	fcall	_eeprom_write
	line	152
	
l2961:	
;table.c: 152: GIE = 1;
	bsf	(95/8),(95)&7
	line	154
;table.c: 154: eeprom_write(Ind+1, Dato>>8);
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Dato+1),w
	movwf	(?_eeprom_write)
	incf	(WRword@Ind),w
	fcall	_eeprom_write
	line	155
	
l2963:	
;table.c: 155: GIE = 1;
	bsf	(95/8),(95)&7
	line	156
	
l1394:	
	return
	opt stack 0
GLOBAL	__end_of_WRword
	__end_of_WRword:
;; =============== function _WRword ends ============

	signat	_WRword,4216
	global	_RDword
psect	text825,local,class=CODE,delta=2
global __ptext825
__ptext825:

;; *************** function _RDword *****************
;; Defined at:
;;		line 126 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
;; Parameters:    Size  Location     Type
;;  Ind             2    6[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       0       0
;;      Temps:          0       2       0
;;      Totals:         2       2       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_eeprom_read
;; This function is called by:
;;		_Find
;;		_Insert
;; This function uses a non-reentrant model
;;
psect	text825
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
	line	126
	global	__size_of_RDword
	__size_of_RDword	equ	__end_of_RDword-_RDword
	
_RDword:	
	opt	stack 2
; Regs used in _RDword: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	129
	
l3349:	
;table.c: 129: Dato = eeprom_read(Ind);
	movf	(RDword@Ind),w
	fcall	_eeprom_read
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_Dato)
	clrf	(_Dato+1)
	line	130
	
l3351:	
;table.c: 130: Dato += (unsigned int) eeprom_read(Ind+1) <<8;
	incf	(RDword@Ind),w
	fcall	_eeprom_read
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_RDword+0)+0
	clrf	(??_RDword+0)+0+1
	movlw	08h
	movwf	btemp+1
u2095:
	clrc
	rlf	(??_RDword+0)+0,f
	rlf	(??_RDword+0)+1,f
	decfsz	btemp+1,f
	goto	u2095
	movf	0+(??_RDword+0)+0,w
	addwf	(_Dato),f
	skipnc
	incf	(_Dato+1),f
	movf	1+(??_RDword+0)+0,w
	addwf	(_Dato+1),f
	line	131
	
l1388:	
	return
	opt stack 0
GLOBAL	__end_of_RDword
	__end_of_RDword:
;; =============== function _RDword ends ============

	signat	_RDword,4216
	global	_HopCHK
psect	text826,local,class=CODE,delta=2
global __ptext826
__ptext826:

;; *************** function _HopCHK *****************
;; Defined at:
;;		line 180 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keygen.c"
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
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ReqResync
;; This function is called by:
;;		_remote
;; This function uses a non-reentrant model
;;
psect	text826
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keygen.c"
	line	180
	global	__size_of_HopCHK
	__size_of_HopCHK	equ	__end_of_HopCHK-_HopCHK
	
_HopCHK:	
	opt	stack 3
; Regs used in _HopCHK: [wreg+status,2+status,0+pclath+cstack]
	line	181
	
l2911:	
;keygen.c: 181: FHopOK = 0;
	bcf	(_FHopOK/8),(_FHopOK)&7
	line	182
;keygen.c: 182: FSame = 0;
	bcf	(_FSame/8),(_FSame)&7
	line	185
	
l2913:	
;keygen.c: 185: Hop = ((unsigned int)Buffer[1] << 8) + Buffer[0];
	movf	0+(_Buffer)+01h,w
	movwf	(_Hop+1)
	movf	(_Buffer),w
	movwf	(_Hop)
	line	187
	
l2915:	
;keygen.c: 187: if ( F2Chance)
	btfss	(_F2Chance/8),(_F2Chance)&7
	goto	u1561
	goto	u1560
u1561:
	goto	l2925
u1560:
	line	188
	
l2917:	
;keygen.c: 188: if ( NextHop == Hop)
	movf	(_Hop+1),w
	xorwf	(_NextHop+1),w
	skipz
	goto	u1575
	movf	(_Hop),w
	xorwf	(_NextHop),w
u1575:

	skipz
	goto	u1571
	goto	u1570
u1571:
	goto	l2925
u1570:
	line	190
	
l2919:	
;keygen.c: 189: {
;keygen.c: 190: F2Chance = 0;
	bcf	(_F2Chance/8),(_F2Chance)&7
	line	191
;keygen.c: 191: FHopOK = 1;
	bsf	(_FHopOK/8),(_FHopOK)&7
	line	192
	
l2921:	
;keygen.c: 192: return 1;
	movlw	(01h)
	goto	l982
	line	196
	
l2925:	
;keygen.c: 193: }
;keygen.c: 196: if ( EHop != ETemp)
	movf	(_ETemp+1),w
	xorwf	(_EHop+1),w
	skipz
	goto	u1585
	movf	(_ETemp),w
	xorwf	(_EHop),w
u1585:

	skipnz
	goto	u1581
	goto	u1580
u1581:
	goto	l2931
u1580:
	line	197
	
l2927:	
;keygen.c: 197: return ReqResync();
	fcall	_ReqResync
	goto	l982
	line	200
	
l2931:	
;keygen.c: 200: ETemp = Hop - EHop;
	movf	(_Hop+1),w
	movwf	(_ETemp+1)
	movf	(_Hop),w
	movwf	(_ETemp)
	movf	(_EHop),w
	subwf	(_ETemp),f
	movf	(_EHop+1),w
	skipc
	decf	(_ETemp+1),f
	subwf	(_ETemp+1),f
	line	205
;keygen.c: 202: if ( ETemp < 0)
	
l2939:	
;keygen.c: 205: else if ( ETemp > 16)
	movlw	high(011h)
	subwf	(_ETemp+1),w
	movlw	low(011h)
	skipnz
	subwf	(_ETemp),w
	skipc
	goto	u1591
	goto	u1590
u1591:
	goto	l2947
u1590:
	goto	l2927
	line	210
	
l2947:	
;keygen.c: 208: else
;keygen.c: 209: {
;keygen.c: 210: if ( ETemp == 0)
	movf	((_ETemp+1)),w
	iorwf	((_ETemp)),w
	skipz
	goto	u1601
	goto	u1600
u1601:
	goto	l988
u1600:
	line	211
	
l2949:	
;keygen.c: 211: FSame = 1;
	bsf	(_FSame/8),(_FSame)&7
	
l988:	
	line	213
;keygen.c: 213: FHopOK = 1;
	bsf	(_FHopOK/8),(_FHopOK)&7
	goto	l2921
	line	216
	
l982:	
	return
	opt stack 0
GLOBAL	__end_of_HopCHK
	__end_of_HopCHK:
;; =============== function _HopCHK ends ============

	signat	_HopCHK,89
	global	_NormalKeyGen
psect	text827,local,class=CODE,delta=2
global __ptext827
__ptext827:

;; *************** function _NormalKeyGen *****************
;; Defined at:
;;		line 93 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keygen.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  SKEYtemp        4    7[BANK0 ] unsigned char [4]
;;  HOPtemp         4    3[BANK0 ] unsigned char [4]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       8       0
;;      Temps:          0       0       0
;;      Totals:         0       8       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_memcpy
;;		_LoadManufCode
;;		_Decrypt
;; This function is called by:
;;		_remote
;; This function uses a non-reentrant model
;;
psect	text827
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keygen.c"
	line	93
	global	__size_of_NormalKeyGen
	__size_of_NormalKeyGen	equ	__end_of_NormalKeyGen-_NormalKeyGen
	
_NormalKeyGen:	
	opt	stack 3
; Regs used in _NormalKeyGen: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	103
	
l3319:	
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
	goto	u2041
	goto	u2040
u2041:
	goto	l3329
u2040:
	
l3321:	
	movf	0+(_SEED)+01h,w
	xorwf	0+(_Buffer)+05h,w
	skipz
	goto	u2051
	goto	u2050
u2051:
	goto	l3329
u2050:
	
l3323:	
	movf	0+(_SEED)+02h,w
	xorwf	0+(_Buffer)+06h,w
	skipz
	goto	u2061
	goto	u2060
u2061:
	goto	l3329
u2060:
	
l3325:	
	movf	0+(_Buffer)+07h,w
	andlw	0Fh
	xorwf	0+(_SEED)+03h,w
	skipz
	goto	u2071
	goto	u2070
u2071:
	goto	l3329
u2070:
	
l3327:	
	movf	(_COut),f
	skipz
	goto	u2081
	goto	u2080
u2081:
	goto	l970
u2080:
	line	105
	
l3329:	
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
	
l3331:	
;keygen.c: 107: SEED[3] &= 0x0f;
	movlw	(0Fh)
	andwf	0+(_SEED)+03h,f
	line	110
	
l3333:	
;keygen.c: 110: memcpy( Buffer, SEED, 4);
	movlw	(_SEED)&0ffh
	movwf	(?_memcpy)
	movlw	04h
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(_Buffer)&0ffh
	fcall	_memcpy
	line	111
	
l3335:	
;keygen.c: 111: Buffer[3] |= 0x20;
	bsf	0+(_Buffer)+03h+(5/8),(5)&7
	line	112
	
l3337:	
;keygen.c: 112: LoadManufCode();
	fcall	_LoadManufCode
	line	113
	
l3339:	
;keygen.c: 113: Decrypt();
	fcall	_Decrypt
	line	114
	
l3341:	
;keygen.c: 114: memcpy( SKEYtemp, Buffer, 4);
	movlw	(_Buffer)&0ffh
	movwf	(?_memcpy)
	movlw	04h
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(NormalKeyGen@SKEYtemp)&0ffh
	fcall	_memcpy
	line	117
	
l3343:	
;keygen.c: 117: memcpy( Buffer, SEED, 4);
	movlw	(_SEED)&0ffh
	movwf	(?_memcpy)
	movlw	04h
	movwf	0+(?_memcpy)+01h
	clrf	1+(?_memcpy)+01h
	movlw	(_Buffer)&0ffh
	fcall	_memcpy
	line	118
	
l3345:	
;keygen.c: 118: Buffer[3] |= 0x60;
	movlw	(060h)
	iorwf	0+(_Buffer)+03h,f
	line	119
	
l3347:	
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
	
l970:	
	return
	opt stack 0
GLOBAL	__end_of_NormalKeyGen
	__end_of_NormalKeyGen:
;; =============== function _NormalKeyGen ends ============

	signat	_NormalKeyGen,88
	global	_eeprom_write
psect	text828,local,class=CODE,delta=2
global __ptext828
__ptext828:

;; *************** function _eeprom_write *****************
;; Defined at:
;;		line 8 in file "C:\Program Files\HI-TECH Software\PICC\9.80\sources\eewrite.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  value           1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_WRword
;; This function uses a non-reentrant model
;;
psect	text828
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\eewrite.c"
	line	8
	global	__size_of_eeprom_write
	__size_of_eeprom_write	equ	__end_of_eeprom_write-_eeprom_write
	
_eeprom_write:	
	opt	stack 3
; Regs used in _eeprom_write: [wreg+status,2+status,0]
;eeprom_write@addr stored from wreg
	movwf	(eeprom_write@addr)
	line	9
	
l1457:	
	
l1458:	
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1249/8)^080h,(1249)&7
	goto	u1481
	goto	u1480
u1481:
	goto	l1458
u1480:
	
l2861:	
	movf	(eeprom_write@addr),w
	movwf	(155)^080h	;volatile
	movf	(eeprom_write@value),w
	movwf	(154)^080h	;volatile
	
l2863:	
	movlw	(03Fh)
	andwf	(156)^080h,f	;volatile
	
l2865:	
	bcf	(24/8),(24)&7
	
l2867:	
	btfss	(95/8),(95)&7
	goto	u1491
	goto	u1490
u1491:
	goto	l1461
u1490:
	
l2869:	
	bsf	(24/8),(24)&7
	
l1461:	
	bcf	(95/8),(95)&7
	bsf	(1250/8)^080h,(1250)&7
	
l2871:	
	movlw	(055h)
	movwf	(157)^080h	;volatile
	movlw	(0AAh)
	movwf	(157)^080h	;volatile
	
l2873:	
	bsf	(1249/8)^080h,(1249)&7
	
l2875:	
	bcf	(1250/8)^080h,(1250)&7
	
l2877:	
	btfss	(24/8),(24)&7
	goto	u1501
	goto	u1500
u1501:
	goto	l1464
u1500:
	
l2879:	
	bsf	(95/8),(95)&7
	line	10
	
l1464:	
	return
	opt stack 0
GLOBAL	__end_of_eeprom_write
	__end_of_eeprom_write:
;; =============== function _eeprom_write ends ============

	signat	_eeprom_write,8312
	global	_RDnext
psect	text829,local,class=CODE,delta=2
global __ptext829
__ptext829:

;; *************** function _RDnext *****************
;; Defined at:
;;		line 137 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
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
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Find
;; This function uses a non-reentrant model
;;
psect	text829
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\table.c"
	line	137
	global	__size_of_RDnext
	__size_of_RDnext	equ	__end_of_RDnext-_RDnext
	
_RDnext:	
	opt	stack 3
; Regs used in _RDnext: [wreg+status,2+status,0+btemp+1]
	line	139
	
l3307:	
;table.c: 139: EEADR++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(155)^080h,f	;volatile
	line	140
	
l3309:	
;table.c: 140: Dato = ((RD=1), EEDATA);
	bsf	(1248/8)^080h,(1248)&7
	
l3311:	
	movf	(154)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_Dato)
	clrf	(_Dato+1)
	line	141
	
l3313:	
;table.c: 141: EEADR++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(155)^080h,f	;volatile
	line	142
	
l3315:	
;table.c: 142: Dato += ((RD=1), EEDATA)<<8;
	bsf	(1248/8)^080h,(1248)&7
	
l3317:	
	movf	(154)^080h,w	;volatile
	movwf	(??_RDnext+0)+0
	clrf	(??_RDnext+0)+0+1
	movlw	08h
	movwf	btemp+1
u2035:
	clrc
	rlf	(??_RDnext+0)+0,f
	rlf	(??_RDnext+0)+1,f
	decfsz	btemp+1,f
	goto	u2035
	movf	0+(??_RDnext+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	addwf	(_Dato),f
	skipnc
	incf	(_Dato+1),f
	movf	1+(??_RDnext+0)+0,w
	addwf	(_Dato+1),f
	line	143
	
l1391:	
	return
	opt stack 0
GLOBAL	__end_of_RDnext
	__end_of_RDnext:
;; =============== function _RDnext ends ============

	signat	_RDnext,88
	global	_eeprom_read
psect	text830,local,class=CODE,delta=2
global __ptext830
__ptext830:

;; *************** function _eeprom_read *****************
;; Defined at:
;;		line 8 in file "eeread.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          2       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_RDword
;; This function uses a non-reentrant model
;;
psect	text830
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\eeread.c"
	line	8
	global	__size_of_eeprom_read
	__size_of_eeprom_read	equ	__end_of_eeprom_read-_eeprom_read
	
_eeprom_read:	
	opt	stack 2
; Regs used in _eeprom_read: [wreg+status,2+status,0]
;eeprom_read@addr stored from wreg
	line	10
	movwf	(eeprom_read@addr)
	line	9
	
l1436:	
	line	10
# 10 "C:\Program Files\HI-TECH Software\PICC\9.80\sources\eeread.c"
clrwdt ;#
psect	text830
	line	11
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1249/8)^080h,(1249)&7
	goto	u2021
	goto	u2020
u2021:
	goto	l1436
u2020:
	line	12
	
l3303:	
	movf	(eeprom_read@addr),w
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

	movwf	(??_eeprom_read+0)+0
	clrf	(??_eeprom_read+0)+0+1
	movf	(154)^080h,w	;volatile
	line	13
	
l1438:	
	return
	opt stack 0
GLOBAL	__end_of_eeprom_read
	__end_of_eeprom_read:
;; =============== function _eeprom_read ends ============

	signat	_eeprom_read,4217
	global	_ReqResync
psect	text831,local,class=CODE,delta=2
global __ptext831
__ptext831:

;; *************** function _ReqResync *****************
;; Defined at:
;;		line 168 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keygen.c"
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
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_HopCHK
;; This function uses a non-reentrant model
;;
psect	text831
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keygen.c"
	line	168
	global	__size_of_ReqResync
	__size_of_ReqResync	equ	__end_of_ReqResync-_ReqResync
	
_ReqResync:	
	opt	stack 3
; Regs used in _ReqResync: [wreg+status,2+status,0]
	line	169
	
l2835:	
;keygen.c: 169: F2Chance= 1;
	bsf	(_F2Chance/8),(_F2Chance)&7
	line	170
	
l2837:	
;keygen.c: 170: NextHop = Hop+1;
	movf	(_Hop+1),w
	movwf	(_NextHop+1)
	movf	(_Hop),w
	movwf	(_NextHop)
	
l2839:	
	incf	(_NextHop),f
	skipnz
	incf	(_NextHop+1),f
	line	171
	
l2841:	
;keygen.c: 171: return 0;
	movlw	(0)
	line	172
	
l977:	
	return
	opt stack 0
GLOBAL	__end_of_ReqResync
	__end_of_ReqResync:
;; =============== function _ReqResync ends ============

	signat	_ReqResync,89
	global	_LoadManufCode
psect	text832,local,class=CODE,delta=2
global __ptext832
__ptext832:

;; *************** function _LoadManufCode *****************
;; Defined at:
;;		line 69 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keygen.c"
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
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_NormalKeyGen
;; This function uses a non-reentrant model
;;
psect	text832
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keygen.c"
	line	69
	global	__size_of_LoadManufCode
	__size_of_LoadManufCode	equ	__end_of_LoadManufCode-_LoadManufCode
	
_LoadManufCode:	
	opt	stack 3
; Regs used in _LoadManufCode: [wreg]
	line	70
	
l2831:	
;keygen.c: 70: DKEY[0]=0xEF;
	movlw	(0EFh)
	movwf	(_DKEY)
	line	71
;keygen.c: 71: DKEY[1]=0xCD;
	movlw	(0CDh)
	movwf	0+(_DKEY)+01h
	line	72
;keygen.c: 72: DKEY[2]=0xAB;
	movlw	(0ABh)
	movwf	0+(_DKEY)+02h
	line	73
;keygen.c: 73: DKEY[3]=0x89;
	movlw	(089h)
	movwf	0+(_DKEY)+03h
	line	74
;keygen.c: 74: DKEY[4]=0x67;
	movlw	(067h)
	movwf	0+(_DKEY)+04h
	line	75
;keygen.c: 75: DKEY[5]=0x45;
	movlw	(045h)
	movwf	0+(_DKEY)+05h
	line	76
;keygen.c: 76: DKEY[6]=0x23;
	movlw	(023h)
	movwf	0+(_DKEY)+06h
	line	77
	
l2833:	
;keygen.c: 77: DKEY[7]=0x01;
	clrf	0+(_DKEY)+07h
	incf	0+(_DKEY)+07h,f
	line	78
	
l963:	
	return
	opt stack 0
GLOBAL	__end_of_LoadManufCode
	__end_of_LoadManufCode:
;; =============== function _LoadManufCode ends ============

	signat	_LoadManufCode,88
	global	_init_receiver
psect	text833,local,class=CODE,delta=2
global __ptext833
__ptext833:

;; *************** function _init_receiver *****************
;; Defined at:
;;		line 260 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_rx.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text833
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_rx.c"
	line	260
	global	__size_of_init_receiver
	__size_of_init_receiver	equ	__end_of_init_receiver-_init_receiver
	
_init_receiver:	
	opt	stack 5
; Regs used in _init_receiver: [status,2]
	line	261
	
l2671:	
;keeloq_rx.c: 261: TMR0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(1)	;volatile
	line	262
	
l2673:	
;keeloq_rx.c: 262: T0CS = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	263
	
l2675:	
;keeloq_rx.c: 263: T0IF = 0;
	bcf	(90/8),(90)&7
	line	264
	
l2677:	
;keeloq_rx.c: 264: T0IE = 1;
	bsf	(93/8),(93)&7
	line	265
	
l2679:	
;keeloq_rx.c: 265: GIE = 1;
	bsf	(95/8),(95)&7
	line	266
;keeloq_rx.c: 266: RFstate = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_RFstate)
	line	267
	
l2681:	
;keeloq_rx.c: 268: XTMR = 0;
	bcf	(_RFFull/8),(_RFFull)&7
	line	269
;keeloq_rx.c: 269: RFtype = 0;
	clrf	(_RFtype)
	line	270
	
l934:	
	return
	opt stack 0
GLOBAL	__end_of_init_receiver
	__end_of_init_receiver:
;; =============== function _init_receiver ends ============

	signat	_init_receiver,88
	global	_DecCHK
psect	text834,local,class=CODE,delta=2
global __ptext834
__ptext834:

;; *************** function _DecCHK *****************
;; Defined at:
;;		line 142 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keygen.c"
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
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_remote
;; This function uses a non-reentrant model
;;
psect	text834
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keygen.c"
	line	142
	global	__size_of_DecCHK
	__size_of_DecCHK	equ	__end_of_DecCHK-_DecCHK
	
_DecCHK:	
	opt	stack 4
; Regs used in _DecCHK: [wreg+status,2+status,0]
	line	152
	
l2661:	
;keygen.c: 152: if ( ((Buffer[3] ^ Buffer[7]) & 0xf0)!= 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_Buffer)+03h,w
	xorwf	0+(_Buffer)+07h,w
	andlw	0F0h
	btfsc	status,2
	goto	u1141
	goto	u1140
u1141:
	goto	l2667
u1140:
	line	153
	
l2663:	
;keygen.c: 153: return 0;
	movlw	(0)
	goto	l974
	line	155
	
l2667:	
;keygen.c: 155: return 1;
	movlw	(01h)
	line	156
	
l974:	
	return
	opt stack 0
GLOBAL	__end_of_DecCHK
	__end_of_DecCHK:
;; =============== function _DecCHK ends ============

	signat	_DecCHK,89
	global	_delay_ms
psect	text835,local,class=CODE,delta=2
global __ptext835
__ptext835:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 45 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\delay.c"
;; Parameters:    Size  Location     Type
;;  cnt             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cnt             1    3[COMMON] unsigned char 
;;  _dcnt           1    5[COMMON] unsigned char 
;;  i               1    4[COMMON] unsigned char 
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_remote
;;		_main
;; This function uses a non-reentrant model
;;
psect	text835
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\delay.c"
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
	
l512:	
	line	55
	
l2659:	
;delay.c: 55: i = 4;
	movlw	(04h)
	movwf	(delay_ms@i)
	line	56
;delay.c: 56: do {
	
l513:	
	line	57
;delay.c: 57: { unsigned char _dcnt; _dcnt = (250)/((12*1000L)/(8*1000L))|1; while(--_dcnt != 0) continue; };
	movlw	(0FBh)
	movwf	(delay_ms@_dcnt)
	
l514:	
	decfsz	(delay_ms@_dcnt),f
	goto	u1111
	goto	u1110
u1111:
	goto	l514
u1110:
	
l516:	
	line	58
;delay.c: 58: } while(--i);
	decfsz	(delay_ms@i),f
	goto	u1121
	goto	u1120
u1121:
	goto	l513
u1120:
	
l517:	
	line	59
;delay.c: 59: } while(--cnt);
	decfsz	(delay_ms@cnt),f
	goto	u1131
	goto	u1130
u1131:
	goto	l512
u1130:
	line	61
	
l519:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_Decrypt
psect	text836,local,class=CODE,delta=2
global __ptext836
__ptext836:

;; *************** function _Decrypt *****************
;; Defined at:
;;		line 47 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_alg.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  p               1    6[COMMON] char 
;;  j               1    5[COMMON] unsigned char 
;;  i               1    4[COMMON] unsigned char 
;;  key             1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         4       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_remote
;;		_NormalKeyGen
;; This function uses a non-reentrant model
;;
psect	text836
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_alg.c"
	line	47
	global	__size_of_Decrypt
	__size_of_Decrypt	equ	__end_of_Decrypt-_Decrypt
	
_Decrypt:	
	opt	stack 4
; Regs used in _Decrypt: [wreg-fsr0h+status,2+status,0]
	line	52
	
l2601:	
;keeloq_alg.c: 48: unsigned char i, j, key;
;keeloq_alg.c: 49: signed char p;
;keeloq_alg.c: 52: p = 1;
	clrf	(Decrypt@p)
	incf	(Decrypt@p),f
	line	54
	
l2603:	
;keeloq_alg.c: 54: for (j=66; j>0; j--)
	movlw	(042h)
	movwf	(Decrypt@j)
	line	56
	
l2609:	
;keeloq_alg.c: 55: {
;keeloq_alg.c: 56: key = DKEY[p--];
	movf	(Decrypt@p),w
	addlw	_DKEY&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(Decrypt@key)
	
l2611:	
	decf	(Decrypt@p),f
	line	57
	
l2613:	
;keeloq_alg.c: 57: if ( p < 0)
	btfss	(Decrypt@p),7
	goto	u1021
	goto	u1020
u1021:
	goto	l2617
u1020:
	line	58
	
l2615:	
;keeloq_alg.c: 58: p += 8;
	movlw	(08h)
	addwf	(Decrypt@p),f
	line	59
	
l2617:	
;keeloq_alg.c: 59: for (i=8; i>0; i--)
	movlw	(08h)
	movwf	(Decrypt@i)
	line	60
	
l1000:	
	line	62
;keeloq_alg.c: 60: {
;keeloq_alg.c: 62: if ( (((Buffer[3]) & (1<<(6))) != 0))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	0+(_Buffer)+03h,(6)&7
	goto	u1031
	goto	u1030
u1031:
	goto	l1002
u1030:
	line	64
	
l2621:	
;keeloq_alg.c: 63: {
;keeloq_alg.c: 64: if ( !(((Buffer[3]) & (1<<(1))) != 0))
	btfsc	0+(_Buffer)+03h,(1)&7
	goto	u1041
	goto	u1040
u1041:
	goto	l2625
u1040:
	line	65
	
l2623:	
;keeloq_alg.c: 65: aux = 0b00111010;
	movlw	(03Ah)
	movwf	(_aux)
	goto	l2631
	line	67
	
l2625:	
;keeloq_alg.c: 66: else
;keeloq_alg.c: 67: aux = 0b01011100;
	movlw	(05Ch)
	movwf	(_aux)
	goto	l2631
	line	69
	
l1002:	
	line	71
;keeloq_alg.c: 69: else
;keeloq_alg.c: 70: {
;keeloq_alg.c: 71: if ( !(((Buffer[3]) & (1<<(1))) != 0))
	btfsc	0+(_Buffer)+03h,(1)&7
	goto	u1051
	goto	u1050
u1051:
	goto	l2629
u1050:
	line	72
	
l2627:	
;keeloq_alg.c: 72: aux = 0b01110100;
	movlw	(074h)
	movwf	(_aux)
	goto	l2631
	line	74
	
l2629:	
;keeloq_alg.c: 73: else
;keeloq_alg.c: 74: aux = 0b00101110;
	movlw	(02Eh)
	movwf	(_aux)
	line	79
	
l2631:	
;keeloq_alg.c: 75: }
;keeloq_alg.c: 79: if ( (((Buffer[2]) & (1<<(3))) != 0))
	btfss	0+(_Buffer)+02h,(3)&7
	goto	u1061
	goto	u1060
u1061:
	goto	l1008
u1060:
	line	80
	
l2633:	
# 80 "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_alg.c"
swapf _aux,f ;#
psect	text836
	
l1008:	
	line	81
;keeloq_alg.c: 81: if ( (((Buffer[1]) & (1<<(0))) != 0))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	0+(_Buffer)+01h,(0)&7
	goto	u1071
	goto	u1070
u1071:
	goto	l1009
u1070:
	line	82
	
l2635:	
;keeloq_alg.c: 82: aux<<=2;
	clrc
	rlf	(_aux),f
	clrc
	rlf	(_aux),f
	
l1009:	
	line	83
;keeloq_alg.c: 83: if ((((Buffer[0]) & (1<<(0))) != 0))
	btfss	(_Buffer),(0)&7
	goto	u1081
	goto	u1080
u1081:
	goto	l2639
u1080:
	line	84
	
l2637:	
;keeloq_alg.c: 84: aux<<=1;
	clrc
	rlf	(_aux),f
	line	87
	
l2639:	
;keeloq_alg.c: 87: aux ^= Buffer[1] ^ Buffer[3] ^ key;
	movf	0+(_Buffer)+01h,w
	xorwf	0+(_Buffer)+03h,w
	xorwf	(Decrypt@key),w
	xorwf	(_aux),f
	line	91
	
l2641:	
# 91 "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_alg.c"
            rlf _aux,w ;#
psect	text836
	line	92
	
l2643:	
# 92 "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_alg.c"
            rlf _Buffer,f ;#
psect	text836
	line	93
	
l2645:	
# 93 "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_alg.c"
            rlf _Buffer+1,f ;#
psect	text836
	line	94
	
l2647:	
# 94 "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_alg.c"
            rlf _Buffer+2,f ;#
psect	text836
	line	95
	
l2649:	
# 95 "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_alg.c"
            rlf _Buffer+3,F ;#
psect	text836
	line	99
	
l2651:	
;keeloq_alg.c: 99: key<<=1;
	clrc
	rlf	(Decrypt@key),f
	line	59
	
l2653:	
	decf	(Decrypt@i),f
	
l2655:	
	movf	(Decrypt@i),f
	skipz
	goto	u1091
	goto	u1090
u1091:
	goto	l1000
u1090:
	line	54
	
l2657:	
	decf	(Decrypt@j),f
	movf	(Decrypt@j),f
	skipz
	goto	u1101
	goto	u1100
u1101:
	goto	l2609
u1100:
	line	102
	
l1011:	
	return
	opt stack 0
GLOBAL	__end_of_Decrypt
	__end_of_Decrypt:
;; =============== function _Decrypt ends ============

	signat	_Decrypt,88
	global	_memcpy
psect	text837,local,class=CODE,delta=2
global __ptext837
__ptext837:

;; *************** function _memcpy *****************
;; Defined at:
;;		line 10 in file "C:\Program Files\HI-TECH Software\PICC\9.80\sources\memcpy.c"
;; Parameters:    Size  Location     Type
;;  d1              1    wreg     PTR void 
;;		 -> NormalKeyGen@SKEYtemp(4), NormalKeyGen@HOPtemp(4), SEED(4), DKEY(8), 
;;		 -> Buffer(22), 
;;  s1              1    3[COMMON] PTR const void 
;;		 -> NormalKeyGen@SKEYtemp(4), NormalKeyGen@HOPtemp(4), SEED(4), RX_Buffer(22), 
;;		 -> Buffer(22), 
;;  n               2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  d1              1    0[BANK0 ] PTR void 
;;		 -> NormalKeyGen@SKEYtemp(4), NormalKeyGen@HOPtemp(4), SEED(4), DKEY(8), 
;;		 -> Buffer(22), 
;;  s               1    2[BANK0 ] PTR const unsigned char 
;;		 -> NormalKeyGen@SKEYtemp(4), NormalKeyGen@HOPtemp(4), SEED(4), RX_Buffer(22), 
;;		 -> Buffer(22), 
;;  d               1    1[BANK0 ] PTR unsigned char 
;;		 -> NormalKeyGen@SKEYtemp(4), NormalKeyGen@HOPtemp(4), SEED(4), DKEY(8), 
;;		 -> Buffer(22), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         0       3       0
;;      Temps:          1       0       0
;;      Totals:         4       3       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_remote
;;		_NormalKeyGen
;; This function uses a non-reentrant model
;;
psect	text837
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\memcpy.c"
	line	10
	global	__size_of_memcpy
	__size_of_memcpy	equ	__end_of_memcpy-_memcpy
	
_memcpy:	
	opt	stack 3
; Regs used in _memcpy: [wreg-fsr0h+status,2+status,0]
;memcpy@d1 stored from wreg
	line	19
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(memcpy@d1)
	
l3293:	
	movf	(memcpy@s1),w
	movwf	(memcpy@s)
	line	20
	movf	(memcpy@d1),w
	movwf	(memcpy@d)
	line	21
	goto	l3301
	line	22
	
l3295:	
	movf	(memcpy@s),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_memcpy+0)+0
	movf	(memcpy@d),w
	movwf	fsr0
	movf	(??_memcpy+0)+0,w
	movwf	indf
	
l3297:	
	incf	(memcpy@s),f
	
l3299:	
	incf	(memcpy@d),f
	line	21
	
l3301:	
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
	goto	u2011
	goto	u2010
u2011:
	goto	l3295
u2010:
	line	24
	
l1470:	
	return
	opt stack 0
GLOBAL	__end_of_memcpy
	__end_of_memcpy:
;; =============== function _memcpy ends ============

	signat	_memcpy,12409
	global	_init_pic16f636
psect	text838,local,class=CODE,delta=2
global __ptext838
__ptext838:

;; *************** function _init_pic16f636 *****************
;; Defined at:
;;		line 57 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text838
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
	line	57
	global	__size_of_init_pic16f636
	__size_of_init_pic16f636	equ	__end_of_init_pic16f636-_init_pic16f636
	
_init_pic16f636:	
	opt	stack 5
; Regs used in _init_pic16f636: [wreg+status,2]
	line	58
	
l2569:	
;main.c: 58: CMCON0 = 0x07;
	movlw	(07h)
	movwf	(25)	;volatile
	line	59
	
l2571:	
;main.c: 59: PORTA = 0;
	clrf	(5)	;volatile
	line	60
	
l2573:	
;main.c: 60: PORTC = 0;
	clrf	(7)	;volatile
	line	61
	
l2575:	
;main.c: 61: TMR1L = 0;
	clrf	(14)	;volatile
	line	62
	
l2577:	
;main.c: 62: TMR1H = 0;
	clrf	(15)	;volatile
	line	63
;main.c: 63: T1CON = 0x31;
	movlw	(031h)
	movwf	(16)	;volatile
	line	64
;main.c: 64: TRISA = 0x3F;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	70
	
l2579:	
;main.c: 70: TRISA5 = 0;
	bcf	(1069/8)^080h,(1069)&7
	line	71
	
l2581:	
;main.c: 71: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	72
	
l2583:	
;main.c: 72: TRISC = 0x00;
	clrf	(135)^080h	;volatile
	line	74
	
l2585:	
;main.c: 74: OSCCON = 0x75;
	movlw	(075h)
	movwf	(143)^080h	;volatile
	line	76
	
l2587:	
;main.c: 76: OPTION = 0x0F;
	movlw	(0Fh)
	movwf	(129)^080h	;volatile
	line	77
	
l2589:	
;main.c: 77: WPUDA = 0x3C;
	movlw	(03Ch)
	movwf	(149)^080h	;volatile
	line	81
;main.c: 81: WDA = 0;
	clrf	(151)^080h	;volatile
	line	83
	
l439:	
	return
	opt stack 0
GLOBAL	__end_of_init_pic16f636
	__end_of_init_pic16f636:
;; =============== function _init_pic16f636 ends ============

	signat	_init_pic16f636,88
	global	_Interrupt
psect	text839,local,class=CODE,delta=2
global __ptext839
__ptext839:

;; *************** function _Interrupt *****************
;; Defined at:
;;		line 354 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          3       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_rxi
;;		_tmr1_isr
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text839
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
	line	354
	global	__size_of_Interrupt
	__size_of_Interrupt	equ	__end_of_Interrupt-_Interrupt
	
_Interrupt:	
	opt	stack 2
; Regs used in _Interrupt: [wreg-fsr0h+status,2+status,0+pclath+cstack]
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
psect	text839
	line	355
	
i1l2693:	
;main.c: 355: if(T0IF)
	btfss	(90/8),(90)&7
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l2697
u115_20:
	line	356
	
i1l2695:	
;main.c: 356: rxi();
	fcall	_rxi
	line	357
	
i1l2697:	
;main.c: 357: if(TMR1IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l509
u116_20:
	line	358
	
i1l2699:	
;main.c: 358: tmr1_isr();
	fcall	_tmr1_isr
	line	359
	
i1l509:	
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
	global	_rxi
psect	text840,local,class=CODE,delta=2
global __ptext840
__ptext840:

;; *************** function _rxi *****************
;; Defined at:
;;		line 82 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_rx.c"
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
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Interrupt
;; This function uses a non-reentrant model
;;
psect	text840
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\keeloq_rx.c"
	line	82
	global	__size_of_rxi
	__size_of_rxi	equ	__end_of_rxi-_rxi
	
_rxi:	
	opt	stack 2
; Regs used in _rxi: [wreg-fsr0h+status,2+status,0]
	line	84
	
i1l2701:	
;keeloq_rx.c: 84: RFBit = RA0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(40/8),(40)&7
	goto	u117_21
	goto	u117_20
	
u117_21:
	bsf	(_RFBit/8),(_RFBit)&7
	goto	u118_24
u117_20:
	bcf	(_RFBit/8),(_RFBit)&7
u118_24:
	line	85
	
i1l2703:	
;keeloq_rx.c: 85: TMR0 = 0x98;
	movlw	(098h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	87
	
i1l2705:	
;keeloq_rx.c: 88: XTMR++;
	bcf	(90/8),(90)&7
	line	89
	
i1l2707:	
;keeloq_rx.c: 89: if (RFFull)
	btfss	(_RFFull/8),(_RFFull)&7
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l2829
u119_20:
	goto	i1l895
	line	95
;keeloq_rx.c: 93: {
;keeloq_rx.c: 95: case 2:
	
i1l897:	
	line	97
;keeloq_rx.c: 97: if ( RFBit == 0)
	btfsc	(_RFBit/8),(_RFBit)&7
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l2713
u120_20:
	line	103
	
i1l2711:	
;keeloq_rx.c: 99: {
;keeloq_rx.c: 103: RFstate = 3;
	movlw	(03h)
	movwf	(_RFstate)
	line	104
;keeloq_rx.c: 104: }
	goto	i1l895
	line	107
	
i1l2713:	
;keeloq_rx.c: 105: else
;keeloq_rx.c: 106: {
;keeloq_rx.c: 107: RFcount--;
	decf	(_RFcount),f
	line	108
	
i1l2715:	
;keeloq_rx.c: 108: if ( RFcount < -7)
	movf	(_RFcount),w
	xorlw	80h
	addlw	-((-7)^80h)
	skipnc
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l895
u121_20:
	line	110
	
i1l2717:	
;keeloq_rx.c: 109: {
;keeloq_rx.c: 110: if (BitCount <65)
	movlw	(041h)
	subwf	(_BitCount),w
	skipnc
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l2723
u122_20:
	line	112
	
i1l2719:	
;keeloq_rx.c: 111: {
;keeloq_rx.c: 112: RFtype = 0;
	clrf	(_RFtype)
	line	113
	
i1l2721:	
;keeloq_rx.c: 113: RFstate = 1;
	clrf	(_RFstate)
	incf	(_RFstate),f
	line	114
;keeloq_rx.c: 114: Bptr = 0;
	clrf	(_Bptr)
	line	115
;keeloq_rx.c: 115: BitCount = 0;
	clrf	(_BitCount)
	line	116
;keeloq_rx.c: 116: break;
	goto	i1l895
	line	118
	
i1l2723:	
;keeloq_rx.c: 117: }
;keeloq_rx.c: 118: if ((BitCount>=65) & (BitCount < 100))
	movlw	(041h)
	subwf	(_BitCount),w
	skipc
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l2729
u123_20:
	
i1l2725:	
	movlw	(064h)
	subwf	(_BitCount),w
	skipnc
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l2729
u124_20:
	line	120
	
i1l2727:	
;keeloq_rx.c: 119: {
;keeloq_rx.c: 120: RFtype = 1;
	clrf	(_RFtype)
	incf	(_RFtype),f
	line	123
	
i1l2729:	
;keeloq_rx.c: 121: }
;keeloq_rx.c: 123: if ((BitCount>=100) & (BitCount < 160))
	movlw	(064h)
	subwf	(_BitCount),w
	skipc
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l904
u125_20:
	
i1l2731:	
	movlw	(0A0h)
	subwf	(_BitCount),w
	skipnc
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l904
u126_20:
	line	125
	
i1l2733:	
;keeloq_rx.c: 124: {
;keeloq_rx.c: 125: RFtype = 3;
	movlw	(03h)
	movwf	(_RFtype)
	line	126
	
i1l904:	
	line	127
;keeloq_rx.c: 126: }
;keeloq_rx.c: 127: if (BitCount>=160)
	movlw	(0A0h)
	subwf	(_BitCount),w
	skipc
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l2737
u127_20:
	line	129
	
i1l2735:	
;keeloq_rx.c: 128: {
;keeloq_rx.c: 129: RFtype = 2;
	movlw	(02h)
	movwf	(_RFtype)
	line	132
	
i1l2737:	
;keeloq_rx.c: 130: }
;keeloq_rx.c: 132: RFstate = 0;
	clrf	(_RFstate)
	line	133
	
i1l2739:	
;keeloq_rx.c: 133: RFFull = 0x01;
	bsf	(_RFFull/8),(_RFFull)&7
	goto	i1l895
	line	139
;keeloq_rx.c: 139: case 3:
	
i1l906:	
	line	140
;keeloq_rx.c: 140: if ( RFBit)
	btfss	(_RFBit/8),(_RFBit)&7
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l2763
u128_20:
	line	145
	
i1l2741:	
;keeloq_rx.c: 141: {
;keeloq_rx.c: 145: RFstate= 2;
	movlw	(02h)
	movwf	(_RFstate)
	line	146
	
i1l2743:	
;keeloq_rx.c: 146: RX_Buffer[Bptr] >>= 1;
	movf	(_Bptr),w
	addlw	_RX_Buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrc
	rrf	indf,f
	line	147
	
i1l2745:	
;keeloq_rx.c: 147: if ( RFcount >= 0)
	btfsc	(_RFcount),7
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l2749
u129_20:
	line	149
	
i1l2747:	
;keeloq_rx.c: 148: {
;keeloq_rx.c: 149: RX_Buffer[Bptr]+=0x80;
	movf	(_Bptr),w
	addlw	_RX_Buffer&0ffh
	movwf	fsr0
	movlw	(080h)
	addwf	indf,f
	line	151
	
i1l2749:	
;keeloq_rx.c: 150: }
;keeloq_rx.c: 151: RFcount = 0;
	clrf	(_RFcount)
	line	153
	
i1l2751:	
;keeloq_rx.c: 153: if ( ( ++BitCount & 7) == 0)
	incf	(_BitCount),f
	movf	((_BitCount)),w
	andlw	07h
	btfss	status,2
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l2755
u130_20:
	line	154
	
i1l2753:	
;keeloq_rx.c: 154: Bptr++;
	incf	(_Bptr),f
	line	155
	
i1l2755:	
;keeloq_rx.c: 155: if (BitCount == (160+10))
	movf	(_BitCount),w
	xorlw	0AAh
	skipz
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l895
u131_20:
	line	157
	
i1l2757:	
;keeloq_rx.c: 156: {
;keeloq_rx.c: 157: RFstate = 0;
	clrf	(_RFstate)
	line	158
	
i1l2759:	
;keeloq_rx.c: 158: RFFull = 0x1;
	bsf	(_RFFull/8),(_RFFull)&7
	line	159
	
i1l2761:	
;keeloq_rx.c: 159: RFtype = 2;
	movlw	(02h)
	movwf	(_RFtype)
	goto	i1l895
	line	164
	
i1l2763:	
;keeloq_rx.c: 162: else
;keeloq_rx.c: 163: {
;keeloq_rx.c: 164: RFcount++;
	incf	(_RFcount),f
	line	165
	
i1l2765:	
;keeloq_rx.c: 165: if ( RFcount >= 7)
	movf	(_RFcount),w
	xorlw	80h
	addlw	-((07h)^80h)
	skipc
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l895
u132_20:
	line	168
	
i1l2767:	
;keeloq_rx.c: 166: {
;keeloq_rx.c: 168: RX_Buffer[Bptr] >>= 1;
	movf	(_Bptr),w
	addlw	_RX_Buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrc
	rrf	indf,f
	line	169
	
i1l2769:	
;keeloq_rx.c: 169: if ( RFcount >= 0)
	btfsc	(_RFcount),7
	goto	u133_21
	goto	u133_20
u133_21:
	goto	i1l2773
u133_20:
	line	171
	
i1l2771:	
;keeloq_rx.c: 170: {
;keeloq_rx.c: 171: RX_Buffer[Bptr]+=0x80;
	movf	(_Bptr),w
	addlw	_RX_Buffer&0ffh
	movwf	fsr0
	movlw	(080h)
	addwf	indf,f
	line	174
	
i1l2773:	
;keeloq_rx.c: 172: }
;keeloq_rx.c: 174: if (BitCount <65)
	movlw	(041h)
	subwf	(_BitCount),w
	skipnc
	goto	u134_21
	goto	u134_20
u134_21:
	goto	i1l2779
u134_20:
	goto	i1l2719
	line	182
	
i1l2779:	
;keeloq_rx.c: 181: }
;keeloq_rx.c: 182: if (BitCount>=65 & BitCount < 100)
	movlw	(041h)
	subwf	(_BitCount),w
	skipc
	goto	u135_21
	goto	u135_20
u135_21:
	goto	i1l2785
u135_20:
	
i1l2781:	
	movlw	(064h)
	subwf	(_BitCount),w
	skipnc
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l2785
u136_20:
	line	184
	
i1l2783:	
;keeloq_rx.c: 183: {
;keeloq_rx.c: 184: RFtype = 1;
	clrf	(_RFtype)
	incf	(_RFtype),f
	line	187
	
i1l2785:	
;keeloq_rx.c: 185: }
;keeloq_rx.c: 187: if (BitCount>=100 & BitCount < 160)
	movlw	(064h)
	subwf	(_BitCount),w
	skipc
	goto	u137_21
	goto	u137_20
u137_21:
	goto	i1l916
u137_20:
	
i1l2787:	
	movlw	(0A0h)
	subwf	(_BitCount),w
	skipnc
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l916
u138_20:
	line	189
	
i1l2789:	
;keeloq_rx.c: 188: {
;keeloq_rx.c: 189: RFtype = 3;
	movlw	(03h)
	movwf	(_RFtype)
	line	190
	
i1l916:	
	line	191
;keeloq_rx.c: 190: }
;keeloq_rx.c: 191: if (BitCount>=160)
	movlw	(0A0h)
	subwf	(_BitCount),w
	skipc
	goto	u139_21
	goto	u139_20
u139_21:
	goto	i1l2737
u139_20:
	goto	i1l2735
	line	203
;keeloq_rx.c: 203: case 1:
	
i1l918:	
	line	204
;keeloq_rx.c: 204: if ( RFBit)
	btfss	(_RFBit/8),(_RFBit)&7
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l2809
u140_20:
	line	209
	
i1l2797:	
;keeloq_rx.c: 205: {
;keeloq_rx.c: 209: if ( ( RFcount < 25) || ( RFcount >= 45))
	movf	(_RFcount),w
	xorlw	80h
	addlw	-((019h)^80h)
	skipc
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l2801
u141_20:
	
i1l2799:	
	movf	(_RFcount),w
	xorlw	80h
	addlw	-((02Dh)^80h)
	skipc
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l2805
u142_20:
	line	211
	
i1l2801:	
;keeloq_rx.c: 210: {
;keeloq_rx.c: 211: RFstate = 0;
	clrf	(_RFstate)
	line	212
;keeloq_rx.c: 212: RFcount = 0;
	clrf	(_RFcount)
	line	213
;keeloq_rx.c: 213: break;
	goto	i1l895
	line	217
	
i1l2805:	
;keeloq_rx.c: 215: else
;keeloq_rx.c: 216: {
;keeloq_rx.c: 217: RFcount =0;
	clrf	(_RFcount)
	line	218
	
i1l2807:	
;keeloq_rx.c: 218: RFstate= 2;
	movlw	(02h)
	movwf	(_RFstate)
	goto	i1l895
	line	223
	
i1l2809:	
;keeloq_rx.c: 221: else
;keeloq_rx.c: 222: {
;keeloq_rx.c: 223: RFcount++;
	incf	(_RFcount),f
	goto	i1l895
	line	228
;keeloq_rx.c: 228: case 4:
	
i1l925:	
	line	229
;keeloq_rx.c: 229: if (!RFsynch)
	btfsc	(_RFsynch/8),(_RFsynch)&7
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l926
u143_20:
	line	231
	
i1l2811:	
;keeloq_rx.c: 230: {
;keeloq_rx.c: 231: if (RFBit)
	btfss	(_RFBit/8),(_RFBit)&7
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l895
u144_20:
	line	233
	
i1l2813:	
;keeloq_rx.c: 232: {
;keeloq_rx.c: 233: RFsynch = 1;
	bsf	(_RFsynch/8),(_RFsynch)&7
	goto	i1l895
	line	236
	
i1l926:	
	line	238
;keeloq_rx.c: 236: else
;keeloq_rx.c: 237: {
;keeloq_rx.c: 238: if (!RFBit)
	btfsc	(_RFBit/8),(_RFBit)&7
	goto	u145_21
	goto	u145_20
u145_21:
	goto	i1l895
u145_20:
	line	240
	
i1l2815:	
;keeloq_rx.c: 239: {
;keeloq_rx.c: 240: RFstate = 1;
	clrf	(_RFstate)
	incf	(_RFstate),f
	line	241
;keeloq_rx.c: 241: RFsynch = 0;
	bcf	(_RFsynch/8),(_RFsynch)&7
	goto	i1l895
	line	249
	
i1l2817:	
;keeloq_rx.c: 249: RFstate = 4;
	movlw	(04h)
	movwf	(_RFstate)
	line	250
	
i1l2819:	
;keeloq_rx.c: 250: RFcount = 0;
	clrf	(_RFcount)
	line	251
	
i1l2821:	
;keeloq_rx.c: 251: Bptr = 0;
	clrf	(_Bptr)
	line	252
	
i1l2823:	
;keeloq_rx.c: 252: BitCount = 0;
	clrf	(_BitCount)
	line	253
	
i1l2825:	
;keeloq_rx.c: 253: RFsynch = 0;
	bcf	(_RFsynch/8),(_RFsynch)&7
	line	254
;keeloq_rx.c: 254: break;
	goto	i1l895
	line	92
	
i1l2829:	
	movf	(_RFstate),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    16     9 (average)
; direct_byte    18    13 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	i1l2817
	xorlw	1^0	; case 1
	skipnz
	goto	i1l918
	xorlw	2^1	; case 2
	skipnz
	goto	i1l897
	xorlw	3^2	; case 3
	skipnz
	goto	i1l906
	xorlw	4^3	; case 4
	skipnz
	goto	i1l925
	goto	i1l2817

	line	257
	
i1l895:	
	return
	opt stack 0
GLOBAL	__end_of_rxi
	__end_of_rxi:
;; =============== function _rxi ends ============

	signat	_rxi,88
	global	_tmr1_isr
psect	text841,local,class=CODE,delta=2
global __ptext841
__ptext841:

;; *************** function _tmr1_isr *****************
;; Defined at:
;;		line 336 in file "C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
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
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Interrupt
;; This function uses a non-reentrant model
;;
psect	text841
	file	"C:\Users\xxxx\Desktop\20110127\RCS\KDS\KDS\main.c"
	line	336
	global	__size_of_tmr1_isr
	__size_of_tmr1_isr	equ	__end_of_tmr1_isr-_tmr1_isr
	
_tmr1_isr:	
	opt	stack 2
; Regs used in _tmr1_isr: [status,2]
	line	337
	
i1l2683:	
;main.c: 337: TMR1ON= 0;
	bcf	(128/8),(128)&7
	line	338
	
i1l2685:	
;main.c: 338: TMR1L = 0x00;
	clrf	(14)	;volatile
	line	339
;main.c: 339: TMR1H = 0x00;
	clrf	(15)	;volatile
	line	340
	
i1l2687:	
;main.c: 340: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	341
	
i1l2689:	
;main.c: 341: TMR1ON = 1;
	bsf	(128/8),(128)&7
	line	342
	
i1l2691:	
;main.c: 342: Continue_Count = 1;
	clrf	(_Continue_Count)
	incf	(_Continue_Count),f
	line	343
	
i1l504:	
	return
	opt stack 0
GLOBAL	__end_of_tmr1_isr
	__end_of_tmr1_isr:
;; =============== function _tmr1_isr ends ============

	signat	_tmr1_isr,88
psect	text842,local,class=CODE,delta=2
global __ptext842
__ptext842:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
