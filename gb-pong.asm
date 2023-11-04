;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.7 #12016 (MINGW64)
;--------------------------------------------------------
	.module gb_pong
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_sprite_data
	.globl _joypad
	.globl _delay
	.globl _puts
	.globl _printf
	.globl _clear
	.globl _ball
	.globl _paddle2
	.globl _paddle
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_paddle::
	.ds 64
_paddle2::
	.ds 64
_ball::
	.ds 16
_clear::
	.ds 16
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;gb-pong.c:5: unsigned char paddle[] =
	ld	hl, #_paddle
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0001)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0002)
	ld	(hl), #0x93
	ld	hl, #(_paddle + 0x0003)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0004)
	ld	(hl), #0xa5
	ld	hl, #(_paddle + 0x0005)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0006)
	ld	(hl), #0xc9
	ld	hl, #(_paddle + 0x0007)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0008)
	ld	(hl), #0x93
	ld	hl, #(_paddle + 0x0009)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x000a)
	ld	(hl), #0xa5
	ld	hl, #(_paddle + 0x000b)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x000c)
	ld	(hl), #0xc9
	ld	hl, #(_paddle + 0x000d)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x000e)
	ld	(hl), #0x93
	ld	hl, #(_paddle + 0x000f)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0010)
	ld	(hl), #0xa5
	ld	hl, #(_paddle + 0x0011)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0012)
	ld	(hl), #0xc9
	ld	hl, #(_paddle + 0x0013)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0014)
	ld	(hl), #0x93
	ld	hl, #(_paddle + 0x0015)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0016)
	ld	(hl), #0xa5
	ld	hl, #(_paddle + 0x0017)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0018)
	ld	(hl), #0xc9
	ld	hl, #(_paddle + 0x0019)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x001a)
	ld	(hl), #0x93
	ld	hl, #(_paddle + 0x001b)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x001c)
	ld	(hl), #0xa5
	ld	hl, #(_paddle + 0x001d)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x001e)
	ld	(hl), #0xc9
	ld	hl, #(_paddle + 0x001f)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0020)
	ld	(hl), #0x93
	ld	hl, #(_paddle + 0x0021)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0022)
	ld	(hl), #0xa5
	ld	hl, #(_paddle + 0x0023)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0024)
	ld	(hl), #0xc9
	ld	hl, #(_paddle + 0x0025)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0026)
	ld	(hl), #0x93
	ld	hl, #(_paddle + 0x0027)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0028)
	ld	(hl), #0xa5
	ld	hl, #(_paddle + 0x0029)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x002a)
	ld	(hl), #0xc9
	ld	hl, #(_paddle + 0x002b)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x002c)
	ld	(hl), #0x93
	ld	hl, #(_paddle + 0x002d)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x002e)
	ld	(hl), #0xa5
	ld	hl, #(_paddle + 0x002f)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0030)
	ld	(hl), #0xc9
	ld	hl, #(_paddle + 0x0031)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0032)
	ld	(hl), #0x93
	ld	hl, #(_paddle + 0x0033)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0034)
	ld	(hl), #0xa5
	ld	hl, #(_paddle + 0x0035)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0036)
	ld	(hl), #0xc9
	ld	hl, #(_paddle + 0x0037)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x0038)
	ld	(hl), #0x93
	ld	hl, #(_paddle + 0x0039)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x003a)
	ld	(hl), #0xa5
	ld	hl, #(_paddle + 0x003b)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x003c)
	ld	(hl), #0xc9
	ld	hl, #(_paddle + 0x003d)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x003e)
	ld	(hl), #0xff
	ld	hl, #(_paddle + 0x003f)
	ld	(hl), #0xff
;gb-pong.c:17: unsigned char paddle2[] =
	ld	hl, #_paddle2
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0001)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0002)
	ld	(hl), #0x93
	ld	hl, #(_paddle2 + 0x0003)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0004)
	ld	(hl), #0xa5
	ld	hl, #(_paddle2 + 0x0005)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0006)
	ld	(hl), #0xc9
	ld	hl, #(_paddle2 + 0x0007)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0008)
	ld	(hl), #0x93
	ld	hl, #(_paddle2 + 0x0009)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x000a)
	ld	(hl), #0xa5
	ld	hl, #(_paddle2 + 0x000b)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x000c)
	ld	(hl), #0xc9
	ld	hl, #(_paddle2 + 0x000d)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x000e)
	ld	(hl), #0x93
	ld	hl, #(_paddle2 + 0x000f)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0010)
	ld	(hl), #0xa5
	ld	hl, #(_paddle2 + 0x0011)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0012)
	ld	(hl), #0xc9
	ld	hl, #(_paddle2 + 0x0013)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0014)
	ld	(hl), #0x93
	ld	hl, #(_paddle2 + 0x0015)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0016)
	ld	(hl), #0xa5
	ld	hl, #(_paddle2 + 0x0017)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0018)
	ld	(hl), #0xc9
	ld	hl, #(_paddle2 + 0x0019)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x001a)
	ld	(hl), #0x93
	ld	hl, #(_paddle2 + 0x001b)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x001c)
	ld	(hl), #0xa5
	ld	hl, #(_paddle2 + 0x001d)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x001e)
	ld	(hl), #0xc9
	ld	hl, #(_paddle2 + 0x001f)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0020)
	ld	(hl), #0x93
	ld	hl, #(_paddle2 + 0x0021)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0022)
	ld	(hl), #0xa5
	ld	hl, #(_paddle2 + 0x0023)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0024)
	ld	(hl), #0xc9
	ld	hl, #(_paddle2 + 0x0025)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0026)
	ld	(hl), #0x93
	ld	hl, #(_paddle2 + 0x0027)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0028)
	ld	(hl), #0xa5
	ld	hl, #(_paddle2 + 0x0029)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x002a)
	ld	(hl), #0xc9
	ld	hl, #(_paddle2 + 0x002b)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x002c)
	ld	(hl), #0x93
	ld	hl, #(_paddle2 + 0x002d)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x002e)
	ld	(hl), #0xa5
	ld	hl, #(_paddle2 + 0x002f)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0030)
	ld	(hl), #0xc9
	ld	hl, #(_paddle2 + 0x0031)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0032)
	ld	(hl), #0x93
	ld	hl, #(_paddle2 + 0x0033)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0034)
	ld	(hl), #0xa5
	ld	hl, #(_paddle2 + 0x0035)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0036)
	ld	(hl), #0xc9
	ld	hl, #(_paddle2 + 0x0037)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x0038)
	ld	(hl), #0x93
	ld	hl, #(_paddle2 + 0x0039)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x003a)
	ld	(hl), #0xa5
	ld	hl, #(_paddle2 + 0x003b)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x003c)
	ld	(hl), #0xc9
	ld	hl, #(_paddle2 + 0x003d)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x003e)
	ld	(hl), #0xff
	ld	hl, #(_paddle2 + 0x003f)
	ld	(hl), #0xff
;gb-pong.c:29: unsigned char ball[] =
	ld	hl, #_ball
	ld	(hl), #0x00
	ld	hl, #(_ball + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_ball + 0x0002)
	ld	(hl), #0x3c
	ld	hl, #(_ball + 0x0003)
	ld	(hl), #0x3c
	ld	hl, #(_ball + 0x0004)
	ld	(hl), #0x7e
	ld	hl, #(_ball + 0x0005)
	ld	(hl), #0x7e
	ld	hl, #(_ball + 0x0006)
	ld	(hl), #0x7e
	ld	hl, #(_ball + 0x0007)
	ld	(hl), #0x7e
	ld	hl, #(_ball + 0x0008)
	ld	(hl), #0x7e
	ld	hl, #(_ball + 0x0009)
	ld	(hl), #0x7e
	ld	hl, #(_ball + 0x000a)
	ld	(hl), #0x7e
	ld	hl, #(_ball + 0x000b)
	ld	(hl), #0x7e
	ld	hl, #(_ball + 0x000c)
	ld	(hl), #0x3c
	ld	hl, #(_ball + 0x000d)
	ld	(hl), #0x3c
	ld	hl, #(_ball + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_ball + 0x000f)
	ld	(hl), #0x00
;gb-pong.c:35: unsigned char clear[] =
	ld	hl, #_clear
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_clear + 0x000f)
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;gb-pong.c:41: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-18
;gb-pong.c:43: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG+0),a
;gb-pong.c:44: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG+0),a
;gb-pong.c:45: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG+0),a
;gb-pong.c:49: printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
	ld	hl, #___str_1
	push	hl
	call	_puts
	add	sp, #2
;gb-pong.c:50: printf(" %d               %d\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", yourScore, oppScore);
	ld	hl, #0x0000
	push	hl
	ld	l, h
	push	hl
	ld	hl, #___str_2
	push	hl
	call	_printf
	add	sp, #6
;gb-pong.c:52: bool ballRight = TRUE;
	ldhl	sp,	#0
;gb-pong.c:53: bool ballUp = TRUE;
;gb-pong.c:56: int y = 75;
	ld	a,#0x01
	ld	(hl+),a
	ld	(hl+), a
	ld	(hl), #0x4b
	xor	a, a
	inc	hl
	ld	(hl), a
;gb-pong.c:59: int oppy = 75;
	ldhl	sp,	#8
	ld	(hl), #0x4b
	xor	a, a
	inc	hl
;gb-pong.c:61: int ballx = 85;
	ld	(hl+), a
	ld	(hl), #0x55
	xor	a, a
	inc	hl
;gb-pong.c:62: int bally = 75;
	ld	(hl+), a
	ld	(hl), #0x4b
	xor	a, a
	inc	hl
	ld	(hl), a
;gb-pong.c:64: SPRITES_8x16;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x04
	ldh	(_LCDC_REG+0),a
;gb-pong.c:65: set_sprite_data(0, 8, paddle);
	ld	hl, #_paddle
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x00
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0x4b
	ld	(hl+), a
	ld	(hl), #0x0f
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), #0x06
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0x5b
	ld	(hl+), a
	ld	(hl), #0x0f
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000a)
	ld	(hl), #0x00
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0008)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0x4b
	ld	(hl+), a
	ld	(hl), #0x96
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000e)
	ld	(hl), #0x06
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x000c)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0x5b
	ld	(hl+), a
	ld	(hl), #0x96
;gb-pong.c:76: set_sprite_data(10, 1, ball);
	ld	hl, #_ball
	push	hl
	ld	de, #0x010a
	push	de
	call	_set_sprite_data
	add	sp, #4
;gb-pong.c:77: set_sprite_data(0x0B, 1, clear);
	ld	hl, #_clear
	push	hl
	ld	a, #0x01
	ld	d,a
	ld	e,#0x0b
	push	de
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0012)
	ld	(hl), #0x0a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0010)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0x4b
	ld	(hl+), a
	ld	(hl), #0x55
;gb-pong.c:81: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;gb-pong.c:83: while(1)
	xor	a, a
	ldhl	sp,	#14
	ld	(hl+), a
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl+), a
	ld	(hl), a
00153$:
;gb-pong.c:88: move_sprite(4, ballx, bally);
	ldhl	sp,	#12
	ld	c, (hl)
;gb-pong.c:85: if (ballRight)
	ldhl	sp,	#0
	bit	0, (hl)
	jr	Z, 00102$
;gb-pong.c:87: ballx++;
	ldhl	sp,	#10
	inc	(hl)
	jr	NZ, 00351$
	inc	hl
	inc	(hl)
00351$:
;gb-pong.c:88: move_sprite(4, ballx, bally);
	ldhl	sp,	#10
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0010)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;gb-pong.c:88: move_sprite(4, ballx, bally);
	jr	00103$
00102$:
;gb-pong.c:92: ballx--;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	dec	de
	dec	hl
	ld	a, e
	ld	(hl+), a
;gb-pong.c:93: move_sprite(4, ballx, bally);
	ld	a, d
	ld	(hl-), a
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0010)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;gb-pong.c:93: move_sprite(4, ballx, bally);
00103$:
;gb-pong.c:88: move_sprite(4, ballx, bally);
	ldhl	sp,	#10
	ld	c, (hl)
;gb-pong.c:96: if (ballUp)
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00105$
;gb-pong.c:98: bally -= 2;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	dec	de
	dec	de
	dec	hl
	ld	a, e
	ld	(hl+), a
;gb-pong.c:99: move_sprite(4, ballx, bally);
	ld	a, d
	ld	(hl-), a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 0x0010)
	ld	(hl+), a
	ld	(hl), c
;gb-pong.c:99: move_sprite(4, ballx, bally);
	jr	00106$
00105$:
;gb-pong.c:103: bally += 2;
;c
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
;gb-pong.c:104: move_sprite(4, ballx, bally);
	ld	(hl-), a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 0x0010)
	ld	(hl+), a
	ld	(hl), c
;gb-pong.c:104: move_sprite(4, ballx, bally);
00106$:
;gb-pong.c:124: ballRight = !ballRight;
	ldhl	sp,	#0
	ld	a, (hl)
	xor	a, #0x01
	ldhl	sp,	#7
	ld	(hl), a
;gb-pong.c:107: if(ballx > oppx - 6)
	ldhl	sp,	#10
	ld	a, #0x90
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00352$
	bit	7, d
	jr	NZ, 00353$
	cp	a, a
	jr	00353$
00352$:
	bit	7, d
	jr	Z, 00353$
	scf
00353$:
	jp	NC, 00120$
;gb-pong.c:109: if(bally < oppy + 30 && bally > oppy - 8)
;c
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00354$
	bit	7, d
	jr	NZ, 00355$
	cp	a, a
	jr	00355$
00354$:
	bit	7, d
	jr	Z, 00355$
	scf
00355$:
	jr	NC, 00109$
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#12
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00356$
	bit	7, d
	jr	NZ, 00357$
	cp	a, a
	jr	00357$
00356$:
	bit	7, d
	jr	Z, 00357$
	scf
00357$:
	jr	NC, 00109$
;gb-pong.c:111: ballRight = FALSE;
	xor	a, a
	ldhl	sp,	#0
	ld	(hl), a
;gb-pong.c:113: NR10_REG = 0x7E;
	ld	a, #0x7e
	ldh	(_NR10_REG+0),a
;gb-pong.c:114: NR11_REG = 0xC1;
	ld	a, #0xc1
	ldh	(_NR11_REG+0),a
;gb-pong.c:115: NR12_REG = 0x66;
	ld	a, #0x66
	ldh	(_NR12_REG+0),a
;gb-pong.c:116: NR13_REG = 0x7C;
	ld	a, #0x7c
	ldh	(_NR13_REG+0),a
;gb-pong.c:117: NR14_REG = 0xC6;
	ld	a, #0xc6
	ldh	(_NR14_REG+0),a
	jp	00121$
00109$:
;gb-pong.c:121: ballx = 85;
	ldhl	sp,	#10
	ld	(hl), #0x55
	xor	a, a
	inc	hl
;gb-pong.c:122: bally = 75;
	ld	(hl+), a
	ld	(hl), #0x4b
	xor	a, a
	inc	hl
;gb-pong.c:123: yourScore++;
	ld	(hl+), a
	inc	(hl)
	jr	NZ, 00358$
	inc	hl
	inc	(hl)
00358$:
;gb-pong.c:124: ballRight = !ballRight;
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;gb-pong.c:127: for(i = 0; i < 5; i++)
	ld	bc, #0x0000
00181$:
;gb-pong.c:129: NR21_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR21_REG+0),a
;gb-pong.c:130: NR22_REG = 0xA6;
	ld	a, #0xa6
	ldh	(_NR22_REG+0),a
;gb-pong.c:131: NR23_REG = 0x37;
	ld	a, #0x37
	ldh	(_NR23_REG+0),a
;gb-pong.c:132: NR24_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR24_REG+0),a
;gb-pong.c:133: delay(180);
	push	bc
	ld	hl, #0x00b4
	push	hl
	call	_delay
	add	sp, #2
	pop	bc
;gb-pong.c:127: for(i = 0; i < 5; i++)
	inc	bc
	ld	a, c
	sub	a, #0x05
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00181$
;gb-pong.c:136: printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
	ld	hl, #___str_1
	push	hl
	call	_puts
	add	sp, #2
;gb-pong.c:137: printf(" %d               %d\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", yourScore, oppScore);
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #___str_2
	push	hl
	call	_printf
	add	sp, #6
	jp	00121$
00120$:
;gb-pong.c:140: else if(ballx < x + 6)
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, #0x15
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00359$
	bit	7, d
	jr	NZ, 00360$
	cp	a, a
	jr	00360$
00359$:
	bit	7, d
	jr	Z, 00360$
	scf
00360$:
	jp	NC, 00121$
;gb-pong.c:142: if(bally < y + 30 && bally > y - 8)
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00361$
	bit	7, d
	jr	NZ, 00362$
	cp	a, a
	jr	00362$
00361$:
	bit	7, d
	jr	Z, 00362$
	scf
00362$:
	jr	NC, 00114$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#12
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00363$
	bit	7, d
	jr	NZ, 00364$
	cp	a, a
	jr	00364$
00363$:
	bit	7, d
	jr	Z, 00364$
	scf
00364$:
	jr	NC, 00114$
;gb-pong.c:144: ballRight = TRUE;
	ldhl	sp,	#0
	ld	(hl), #0x01
;gb-pong.c:146: NR10_REG = 0x7E;
	ld	a, #0x7e
	ldh	(_NR10_REG+0),a
;gb-pong.c:147: NR11_REG = 0xC1;
	ld	a, #0xc1
	ldh	(_NR11_REG+0),a
;gb-pong.c:148: NR12_REG = 0x66;
	ld	a, #0x66
	ldh	(_NR12_REG+0),a
;gb-pong.c:149: NR13_REG = 0x7C;
	ld	a, #0x7c
	ldh	(_NR13_REG+0),a
;gb-pong.c:150: NR14_REG = 0xC6;
	ld	a, #0xc6
	ldh	(_NR14_REG+0),a
	jr	00121$
00114$:
;gb-pong.c:154: ballx = 85;
	ldhl	sp,	#10
	ld	(hl), #0x55
	xor	a, a
	inc	hl
;gb-pong.c:155: bally = 75;
	ld	(hl+), a
	ld	(hl), #0x4b
	xor	a, a
	inc	hl
	ld	(hl), a
;gb-pong.c:156: oppScore++;
	ldhl	sp,	#16
	inc	(hl)
	jr	NZ, 00365$
	inc	hl
	inc	(hl)
00365$:
;gb-pong.c:157: ballRight = !ballRight;
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;gb-pong.c:160: for(i = 0; i < 5; i++)
	ld	bc, #0x0000
00183$:
;gb-pong.c:162: NR21_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR21_REG+0),a
;gb-pong.c:163: NR22_REG = 0xA6;
	ld	a, #0xa6
	ldh	(_NR22_REG+0),a
;gb-pong.c:164: NR23_REG = 0x37;
	ld	a, #0x37
	ldh	(_NR23_REG+0),a
;gb-pong.c:165: NR24_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR24_REG+0),a
;gb-pong.c:166: delay(180);
	push	bc
	ld	hl, #0x00b4
	push	hl
	call	_delay
	add	sp, #2
	pop	bc
;gb-pong.c:160: for(i = 0; i < 5; i++)
	inc	bc
	ld	a, c
	sub	a, #0x05
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00183$
;gb-pong.c:169: printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
	ld	hl, #___str_1
	push	hl
	call	_puts
	add	sp, #2
;gb-pong.c:170: printf(" %d               %d\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", yourScore, oppScore);
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #___str_2
	push	hl
	call	_printf
	add	sp, #6
00121$:
;gb-pong.c:174: if(bally < 20)
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, #0x14
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00366$
	bit	7, d
	jr	NZ, 00367$
	cp	a, a
	jr	00367$
00366$:
	bit	7, d
	jr	Z, 00367$
	scf
00367$:
	jr	NC, 00125$
;gb-pong.c:176: ballUp = FALSE;
	xor	a, a
	ldhl	sp,	#1
	ld	(hl), a
	jr	00126$
00125$:
;gb-pong.c:178: else if(bally > 140)
	ldhl	sp,	#12
	ld	a, #0x8c
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00368$
	bit	7, d
	jr	NZ, 00369$
	cp	a, a
	jr	00369$
00368$:
	bit	7, d
	jr	Z, 00369$
	scf
00369$:
	jr	NC, 00126$
;gb-pong.c:180: ballUp = TRUE;
	ldhl	sp,	#1
	ld	(hl), #0x01
00126$:
;gb-pong.c:185: if (ballx > (95))
	ldhl	sp,	#10
	ld	a, #0x5f
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00370$
	bit	7, d
	jr	NZ, 00371$
	cp	a, a
	jr	00371$
00370$:
	bit	7, d
	jr	Z, 00371$
	scf
00371$:
	ld	a, #0x00
	rla
	ldhl	sp,	#4
	ld	(hl), a
;gb-pong.c:187: oppy++;
;c
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
;gb-pong.c:194: if (oppy < 75)
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	sub	a, #0x4b
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00372$
	bit	7, d
	jr	NZ, 00373$
	cp	a, a
	jr	00373$
00372$:
	bit	7, d
	jr	Z, 00373$
	scf
00373$:
	ld	a, #0x00
	rla
	ldhl	sp,	#7
	ld	(hl), a
;gb-pong.c:183: if (bally > oppy)
	ldhl	sp,	#8
	ld	e, l
	ld	d, h
	ldhl	sp,	#12
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00374$
	bit	7, d
	jr	NZ, 00375$
	cp	a, a
	jr	00375$
00374$:
	bit	7, d
	jr	Z, 00375$
	scf
00375$:
	jr	NC, 00144$
;gb-pong.c:185: if (ballx > (95))
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00132$
;gb-pong.c:187: oppy++;
	inc	hl
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	inc	hl
	ld	(hl+), a
;gb-pong.c:188: move_sprite(2, oppx, oppy);
	ld	a, e
	ld	(hl-), a
	ld	a, (hl-)
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 0x0008)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	a, #0x96
	ld	(bc), a
;gb-pong.c:189: move_sprite(3, oppx, oppy+16);
	inc	hl
	ld	a, (hl-)
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x10
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 0x000c)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	a, #0x96
	ld	(bc), a
;gb-pong.c:189: move_sprite(3, oppx, oppy+16);
	jp	00145$
00132$:
;gb-pong.c:194: if (oppy < 75)
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	Z, 00128$
;gb-pong.c:196: oppy++;
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	inc	hl
	ld	(hl+), a
	ld	(hl), e
00128$:
;gb-pong.c:199: if (oppy > 75)
	ldhl	sp,	#8
	ld	a, #0x4b
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00376$
	bit	7, d
	jr	NZ, 00377$
	cp	a, a
	jr	00377$
00376$:
	bit	7, d
	jr	Z, 00377$
	scf
00377$:
	jr	NC, 00130$
;gb-pong.c:201: oppy--;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	dec	de
	dec	hl
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00130$:
;gb-pong.c:204: move_sprite(2, oppx, oppy);
	ldhl	sp,	#8
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 0x0008)
	ld	(hl+), a
	ld	(hl), #0x96
;gb-pong.c:205: move_sprite(3, oppx, oppy+16);
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, #0x10
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 0x000c)
	ld	(hl+), a
	ld	(hl), #0x96
;gb-pong.c:205: move_sprite(3, oppx, oppy+16);
	jp	00145$
00144$:
;gb-pong.c:208: else if (bally < oppy)
	ldhl	sp,	#12
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00378$
	bit	7, d
	jr	NZ, 00379$
	cp	a, a
	jr	00379$
00378$:
	bit	7, d
	jr	Z, 00379$
	scf
00379$:
	jr	NC, 00145$
;gb-pong.c:210: if (ballx > (95))
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00139$
;gb-pong.c:212: oppy--;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	dec	de
	dec	hl
	ld	a, e
	ld	(hl+), a
;gb-pong.c:213: move_sprite(2, oppx, oppy);
	ld	a, d
	ld	(hl-), a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 0x0008)
	ld	(hl+), a
	ld	(hl), #0x96
;gb-pong.c:214: move_sprite(3, oppx, oppy+16);
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, #0x10
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 0x000c)
	ld	(hl+), a
	ld	(hl), #0x96
;gb-pong.c:214: move_sprite(3, oppx, oppy+16);
	jr	00145$
00139$:
;gb-pong.c:219: if (oppy < 75)
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	Z, 00135$
;gb-pong.c:221: oppy++;
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	inc	hl
	ld	(hl+), a
	ld	(hl), e
00135$:
;gb-pong.c:224: if (oppy > 75)
	ldhl	sp,	#8
	ld	a, #0x4b
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00380$
	bit	7, d
	jr	NZ, 00381$
	cp	a, a
	jr	00381$
00380$:
	bit	7, d
	jr	Z, 00381$
	scf
00381$:
	jr	NC, 00137$
;gb-pong.c:226: oppy--;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	dec	de
	dec	hl
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00137$:
;gb-pong.c:229: move_sprite(2, oppx, oppy);
	ldhl	sp,	#8
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 0x0008)
	ld	(hl+), a
	ld	(hl), #0x96
;gb-pong.c:230: move_sprite(3, oppx, oppy+16);
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, #0x10
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 0x000c)
	ld	(hl+), a
	ld	(hl), #0x96
;gb-pong.c:230: move_sprite(3, oppx, oppy+16);
00145$:
;gb-pong.c:234: if(joypad() == J_UP && y > 20)
	call	_joypad
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00147$
	ldhl	sp,	#2
	ld	a, #0x14
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00384$
	bit	7, d
	jr	NZ, 00385$
	cp	a, a
	jr	00385$
00384$:
	bit	7, d
	jr	Z, 00385$
	scf
00385$:
	jr	NC, 00147$
;gb-pong.c:236: y--;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
;gb-pong.c:237: y--;
	ld	de, #0x0001
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	(hl-), a
	ld	(hl), e
;gb-pong.c:238: move_sprite(0, x, y);
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #_shadow_OAM
	ld	(hl+), a
	ld	(hl), #0x0f
;gb-pong.c:239: move_sprite(1, x, y+16);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x10
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 0x0004)
	ld	(hl+), a
	ld	(hl), #0x0f
;gb-pong.c:239: move_sprite(1, x, y+16);
00147$:
;gb-pong.c:242: if(joypad() == J_DOWN && y < 120)
	call	_joypad
	ld	a, e
	sub	a, #0x08
	jr	NZ, 00150$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x78
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00388$
	bit	7, d
	jr	NZ, 00389$
	cp	a, a
	jr	00389$
00388$:
	bit	7, d
	jr	Z, 00389$
	scf
00389$:
	jr	NC, 00150$
;gb-pong.c:244: y++;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
;gb-pong.c:245: y++;
	inc	bc
	dec	hl
	ld	a, c
	ld	(hl+), a
;gb-pong.c:246: move_sprite(0, x, y);
	ld	a, b
	ld	(hl-), a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #_shadow_OAM
	ld	(hl+), a
	ld	(hl), #0x0f
;gb-pong.c:247: move_sprite(1, x, y+16);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x10
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 0x0004)
	ld	(hl+), a
	ld	(hl), #0x0f
;gb-pong.c:247: move_sprite(1, x, y+16);
00150$:
;gb-pong.c:250: delay(15);
	ld	hl, #0x000f
	push	hl
	call	_delay
	add	sp, #2
	jp	00153$
;gb-pong.c:252: }
	add	sp, #18
	ret
___str_1:
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x00
___str_2:
	.ascii " %d               %d"
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x00
	.area _CODE
	.area _CABS (ABS)
