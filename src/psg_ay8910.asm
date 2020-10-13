;

song1	raw		../VGM/AY8910/06_TX-55_Metal_Gear.vgm

A4PORT		equ		$ff60
B4PORT		equ		A4PORT+2

PSG_Init
;
;	Initialize AY chip
;
			lda		#$00
			sta		A4PORT+1
			sta		B4PORT+1
;
			lda		#$ff
			sta		A4PORT
			sta		B4PORT
;
			lda		#$04
			sta		A4PORT+1
			sta		B4PORT+1
;
			lda		#$00
			sta		A4PORT
			sta		B4PORT
;
;	Initialize PIA
;
			ldd		#$3d3f
			sta		$ff03
			stb		$ff23
;
;	Set up the channels
;
			ldd		#$07fe
			bsr		AY8910_Write
			ldd		#$080f
			bsr		AY8910_Write
;
			rts


AY8910_Write
			pshs	a
			lda		#$c0			*	Strobe register latch
			sta		B4PORT			*	-
			puls	a
			sta		A4PORT			*	Store register address
			clr		B4PORT			*	Strobe inactive
			stb		A4PORT			*	Store register data
			lda		#$80			*	Strobe data
			sta		B4PORT			*	-
			clr		B4PORT			*	Stobe inactive
			rts

DemoSongs_Play
;
		lda		#'1
		sta		$405
		ldy		#song1+128
		jsr		Player_Run
;
		rts



