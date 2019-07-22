	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L9
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L2
	ldr	r3, .L9+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L6
.L2:
	ldr	r3, .L9+8
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L7
	ldr	r3, .L9+12
	ldr	r3, [r3, #0]
	cmp	r3, #20
	beq	.L8
.L4:
	bl	shadowset
	ldmfd	sp!, {r3, lr}
	bx	lr
.L7:
	bl	goToLose
	ldr	r3, .L9+12
	ldr	r3, [r3, #0]
	cmp	r3, #20
	bne	.L4
.L8:
	bl	goToWin
	b	.L4
.L6:
	bl	goToPause
	b	.L2
.L10:
	.align	2
.L9:
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	updateGame, .-updateGame
	.align	2
	.global	shadowset
	.type	shadowset, %function
shadowset:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L48
	ldr	r2, [r4, #4]
	sub	r2, r2, #1
	ldrh	r0, [r4, #8]
	mov	r1, r2, asl #16
	mov	r3, #67108864
	mov	r1, r1, lsr #16
	strh	r0, [r3, #16]	@ movhi
	str	r2, [r4, #4]
	strh	r1, [r3, #18]	@ movhi
	bl	update
	ldr	r2, [r4, #0]
	cmp	r2, #9
	bgt	.L12
	ldr	r3, .L48+4
	mvn	r1, #32512
	sub	r1, r1, #115
	add	r2, r2, #107
	strh	r1, [r3, #240]	@ movhi
	mov	r0, #190	@ movhi
	strh	r2, [r3, #244]	@ movhi
	strh	r1, [r3, #248]	@ movhi
	mov	r2, #107	@ movhi
	mov	r1, #180	@ movhi
	strh	r0, [r3, #242]	@ movhi
	strh	r1, [r3, #250]	@ movhi
	strh	r2, [r3, #252]	@ movhi
.L13:
	ldr	r2, .L48+8
	ldr	r1, [r2, #0]
	mvn	r2, #32512
	sub	r2, r2, #115
	cmp	r1, #3
	ldr	r0, .L48+4
	strh	r2, [r3, #224]	@ movhi
	moveq	r4, #110	@ movhi
	mov	r2, #20	@ movhi
	strh	r2, [r3, #226]	@ movhi
	streqh	r4, [r0, #228]	@ movhi
	beq	.L15
	cmp	r1, #2
	moveq	ip, #109	@ movhi
	movne	r1, #108	@ movhi
	streqh	ip, [r0, #228]	@ movhi
	strneh	r1, [r0, #228]	@ movhi
.L15:
	ldr	r0, .L48+12
	ldr	r2, .L48+16
	ldr	ip, [r0, #4]
	ldr	r1, [r2, #20]
	ldrh	r0, [r0, #0]
	orr	ip, ip, #16384
	cmp	r1, #0
	mov	r4, #0	@ movhi
	ldr	r1, .L48+4
	strh	r0, [r3, #0]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	bne	.L17
	ldr	r0, [r2, #0]
	orr	r0, r0, #-16777216
	orr	r0, r0, #16711680
	orr	r0, r0, #33280
	ldrh	ip, [r2, #4]
	strh	r0, [r1, #208]	@ movhi
	mov	r0, #3	@ movhi
	strh	ip, [r1, #210]	@ movhi
	strh	r0, [r1, #212]	@ movhi
.L18:
	ldr	r2, [r2, #44]
	cmp	r2, #0
	ldr	r2, .L48+16
	bne	.L19
	ldr	r1, [r2, #24]
	orr	r1, r1, #-16777216
	orr	r1, r1, #16711680
	ldrh	r2, [r2, #28]
	orr	r1, r1, #33280
	mov	r0, #3	@ movhi
	strh	r1, [r3, #216]	@ movhi
	strh	r2, [r3, #218]	@ movhi
	strh	r0, [r3, #220]	@ movhi
.L20:
	ldr	r2, .L48+4
	ldr	r1, .L48+20
	mov	r3, r2
	mov	r0, #1
.L23:
	ldr	ip, [r1, #0]
	cmp	ip, #0
	ldreq	ip, [r1, #-20]
	ldrne	ip, [r1, #-20]
	orreq	ip, ip, #-16777216
	orreq	ip, ip, #16711680
	mvnne	ip, ip, asl #17
	orreq	ip, ip, #33280
	mvnne	ip, ip, lsr #17
	ldrh	r4, [r1, #-16]
	add	r0, r0, #1
	strh	ip, [r3, #8]	@ movhi
	cmp	r0, #6
	mov	ip, #3	@ movhi
	strh	r4, [r3, #10]	@ movhi
	strh	ip, [r3, #12]	@ movhi
	add	r1, r1, #24
	add	r3, r3, #8
	bne	.L23
	ldr	ip, .L48+24
	ldr	r3, .L48+28
	ldr	r0, [ip, #0]
	add	lr, r3, #640
.L37:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	bne	.L24
	add	r4, r0, #3
	ldr	r1, [r3, #4]
	cmp	r4, #6
	ldrh	r4, [r3, #0]
	orr	r1, r1, #16384
	strh	r4, [r2, #48]	@ movhi
	strh	r1, [r2, #50]	@ movhi
	bls	.L46
	add	r1, r0, #7
	cmp	r1, #14
	bls	.L32
	cmp	r0, #23
	bgt	.L30
	ldr	r1, [r3, #28]
	cmp	r1, #0
	movne	r1, #101	@ movhi
	moveq	r4, #104	@ movhi
	strneh	r1, [r2, #52]	@ movhi
	streqh	r4, [r2, #52]	@ movhi
.L27:
	add	r0, r0, #1
.L35:
	add	r3, r3, #32
	cmp	r3, lr
	add	r2, r2, #8
	bne	.L37
	mov	lr, #0
	str	lr, [ip, #0]
	mov	r0, #3
	ldr	r1, .L48+4
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L48+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L48+36
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L24:
	ldr	r4, [r3, #0]
	ldr	r1, [r3, #4]
	ldr	r5, [r3, #28]
	orr	r4, r4, #512
	cmp	r5, #0
	orr	r1, r1, #16384
	strh	r4, [r2, #48]	@ movhi
	strh	r1, [r2, #50]	@ movhi
	moveq	r4, #8	@ movhi
	movne	r1, #5	@ movhi
	strneh	r1, [r2, #52]	@ movhi
	streqh	r4, [r2, #52]	@ movhi
	b	.L35
.L30:
	cmp	r0, #31
	bgt	.L32
.L46:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	movne	r1, #5	@ movhi
	moveq	r4, #8	@ movhi
	strneh	r1, [r2, #52]	@ movhi
	streqh	r4, [r2, #52]	@ movhi
	b	.L27
.L32:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	movne	r1, #10	@ movhi
	moveq	r4, #13	@ movhi
	strneh	r1, [r2, #52]	@ movhi
	streqh	r4, [r2, #52]	@ movhi
	b	.L27
.L19:
	ldr	r1, [r2, #24]
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	ldrh	r2, [r2, #28]
	strh	r1, [r3, #216]	@ movhi
	mov	r1, #3	@ movhi
	strh	r2, [r3, #218]	@ movhi
	strh	r1, [r3, #220]	@ movhi
	b	.L20
.L17:
	ldr	r0, [r2, #0]
	ldrh	r4, [r2, #4]
	mvn	r0, r0, asl #17
	mvn	r0, r0, lsr #17
	mov	ip, #3	@ movhi
	strh	r0, [r1, #208]	@ movhi
	strh	r4, [r1, #210]	@ movhi
	strh	ip, [r1, #212]	@ movhi
	b	.L18
.L12:
	cmp	r2, #19
	ldrgt	r3, .L48+4
	bgt	.L13
	ldr	r1, .L48+40
	smull	r3, r1, r2, r1
	mov	r3, r2, asr #31
	rsb	r3, r3, r1, asr #2
	add	r0, r3, r3, asl #2
	sub	r2, r2, r0, asl #1
	ldr	r3, .L48+4
	mvn	r1, #32512
	sub	r1, r1, #115
	add	r2, r2, #107
	mov	r4, #190	@ movhi
	mov	ip, #180	@ movhi
	mov	r0, #108	@ movhi
	strh	r1, [r3, #240]	@ movhi
	strh	r2, [r3, #244]	@ movhi
	strh	r1, [r3, #248]	@ movhi
	strh	r4, [r3, #242]	@ movhi
	strh	ip, [r3, #250]	@ movhi
	strh	r0, [r3, #252]	@ movhi
	b	.L13
.L49:
	.align	2
.L48:
	.word	.LANCHOR1
	.word	shadowOAM
	.word	.LANCHOR0
	.word	pship
	.word	aBullet
	.word	pBullet+20
	.word	diffSprite
	.word	pAlien
	.word	DMANow
	.word	waitForVblank
	.word	1717986919
	.size	shadowset, .-shadowset
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #24320	@ movhi
	stmfd	sp!, {r4, lr}
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L51
	mov	r2, #0
	str	r2, [r1, #4]
	mov	r1, #256	@ movhi
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L51+4
	ldr	r3, .L51+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L51+12
	mov	r0, #3
	ldr	r1, .L51+16
	mov	r2, #100663296
	mov	r3, #1296
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L51+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L51+24
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	.LANCHOR1
	.word	winscreenPal
	.word	loadPalette
	.word	DMANow
	.word	winscreenTiles
	.word	winscreenMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #24320	@ movhi
	stmfd	sp!, {r4, lr}
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L54
	mov	r2, #0
	str	r2, [r1, #4]
	mov	r1, #256	@ movhi
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L54+4
	ldr	r3, .L54+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L54+12
	mov	r0, #3
	ldr	r1, .L54+16
	mov	r2, #100663296
	mov	r3, #1216
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L54+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+24
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LANCHOR1
	.word	losescreenPal
	.word	loadPalette
	.word	DMANow
	.word	losescreenTiles
	.word	losescreenMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #24320	@ movhi
	stmfd	sp!, {r4, lr}
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L57
	mov	r2, #0
	str	r2, [r1, #4]
	mov	r1, #256	@ movhi
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L57+4
	ldr	r3, .L57+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L57+12
	mov	r0, #3
	ldr	r1, .L57+16
	mov	r2, #100663296
	mov	r3, #1456
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L57+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+24
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LANCHOR1
	.word	pausescreenPal
	.word	loadPalette
	.word	DMANow
	.word	pausescreenTiles
	.word	pausescreenMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #24320	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #8]	@ movhi
	mov	r4, #0
	mov	r2, #256	@ movhi
	strh	r4, [r3, #18]	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L60
	strh	r4, [r3, #16]	@ movhi
	ldr	r3, .L60+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L60+8
	mov	r0, #3
	ldr	r1, .L60+12
	mov	r2, #100663296
	mov	r3, #6976
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L60+16
	add	r2, r2, #63488
	mov	lr, pc
	bx	r5
	ldr	r3, .L60+20
	str	r4, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	titlescreenPal
	.word	loadPalette
	.word	DMANow
	.word	titlescreenTiles
	.word	titlescreenMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #24320	@ movhi
	stmfd	sp!, {r4, lr}
	mov	r2, #4352	@ movhi
	strh	r1, [r3, #8]	@ movhi
	mov	r1, #0	@ movhi
	strh	r2, [r3, #0]	@ movhi
	strh	r1, [r3, #18]	@ movhi
	ldr	r0, .L65
	ldr	r3, .L65+4
	mov	lr, pc
	bx	r3
	mov	r3, #52224
	ldr	r4, .L65+8
	mov	r0, #3
	ldr	r1, .L65+12
	mov	r2, #100663296
	add	r3, r3, #160
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L65+16
	add	r2, r2, #63488
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L65+20
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L65+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L65+28
	mov	r3, #0
.L63:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L63
	ldr	r3, .L65+32
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	spacePal
	.word	loadPalette
	.word	DMANow
	.word	spaceTiles
	.word	spaceMap
	.word	spritesheetfixTiles
	.word	spritesheetfixPal
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bl	goToStart
	ldr	r8, .L79
	ldr	r4, .L79+4
	ldr	r7, .L79+8
	ldr	r6, .L79+12
	mov	r5, #67108864
.L78:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L69:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L69
.L75:
	.word	.L70
	.word	.L71
	.word	.L72
	.word	.L73
	.word	.L74
.L74:
	bl	updatePause
	b	.L78
.L73:
	mov	lr, pc
	bx	r8
	b	.L78
.L72:
	bl	updateLose
	b	.L78
.L71:
	bl	updateGame
	b	.L78
.L70:
	bl	updateStart
	b	.L78
.L80:
	.align	2
.L79:
	.word	updateWin
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L84
	mov	r3, #0
.L82:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L82
	bx	lr
.L85:
	.align	2
.L84:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	fireBullet
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r0, .L92
	mov	r3, #0
	mov	r2, r0
.L89:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L91
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #24
	bne	.L89
.L86:
	ldmfd	sp!, {r4}
	bx	lr
.L91:
	ldr	r2, .L92+4
	ldr	r1, [r2, #0]
	add	r3, r3, r3, asl #1
	ldr	ip, [r2, #4]
	sub	r1, r1, #10
	add	r2, r0, r3, asl #3
	mov	r4, #1
	str	r4, [r2, #20]
	str	ip, [r2, #4]
	str	r1, [r0, r3, asl #3]
	b	.L86
.L93:
	.align	2
.L92:
	.word	pBullet
	.word	pship
	.size	fireBullet, .-fireBullet
	.align	2
	.global	fireBullet2
	.type	fireBullet2, %function
fireBullet2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, .L100
	mov	r2, #0
	mov	r1, r3
.L97:
	ldr	ip, [r1, #20]
	cmp	ip, #0
	bne	.L95
	ldr	ip, [r0, #24]
	cmp	ip, #0
	beq	.L99
.L95:
	add	r2, r2, #1
	cmp	r2, #5
	add	r1, r1, #24
	bne	.L97
.L94:
	ldmfd	sp!, {r4}
	bx	lr
.L99:
	ldr	ip, [r0, #4]
	add	r2, r2, r2, asl #1
	ldr	r0, [r0, #0]
	add	r1, r3, r2, asl #3
	mov	r4, #1
	str	r4, [r1, #20]
	str	ip, [r1, #4]
	str	r0, [r3, r2, asl #3]
	b	.L94
.L101:
	.align	2
.L100:
	.word	aBullet
	.size	fireBullet2, .-fireBullet2
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r8, .L122
	sub	sp, sp, #12
	mov	lr, pc
	bx	r8
	ldr	r2, .L122+4
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	ldr	r4, .L122+8
	sub	r0, r0, r3, asl #2
	add	r0, r4, r0, asl #5
	bl	fireBullet2
	ldr	r0, .L122+12
	ldr	r3, .L122+16
	mov	lr, pc
	bx	r3
	ldr	r6, .L122+20
	ldr	r9, .L122+24
	ldr	r7, .L122+28
	mov	fp, #0
.L103:
	add	sl, fp, fp, asl #1
	mov	r5, #0
	add	sl, r6, sl, asl #3
.L104:
	add	r1, r4, r5, asl #5
	mov	r0, sl
	mov	lr, pc
	bx	r9
	ldr	r3, [r7, #0]
	add	r5, r5, #1
	add	r3, r0, r3
	cmp	r5, #20
	str	r3, [r7, #0]
	bne	.L104
	add	fp, fp, #1
	cmp	fp, #5
	bne	.L103
	ldr	fp, .L122+32
	ldr	sl, .L122+36
	ldr	r9, .L122+4
	mov	r5, #0
.L106:
	mov	lr, pc
	bx	r8
	smull	r3, r2, r9, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #2
	add	r0, r4, r0, asl #5
	ldr	r1, [r0, #4]
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r8
	smull	r3, r2, r9, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r7, r5, r5, asl #1
	add	r3, r3, r3, asl #2
	add	r7, fp, r7, asl #3
	sub	r3, r0, r3, asl #2
	ldr	r2, [r4, r3, asl #5]
	mov	r0, r7
	ldr	r1, [sp, #4]
	ldr	r3, .L122+40
	mov	lr, pc
	bx	r3
	mov	r0, r7
	ldr	r1, .L122+12
	ldr	r3, .L122+44
	ldr	r7, [sl, #0]
	mov	lr, pc
	bx	r3
	add	r5, r5, #1
	rsb	r0, r0, r7
	cmp	r5, #2
	str	r0, [sl, #0]
	bne	.L106
	ldr	r7, .L122+48
	mov	r5, #0
.L107:
	add	r0, r5, r5, asl #1
	add	r0, r6, r0, asl #3
	ldr	r1, .L122+12
	add	r5, r5, #1
	mov	lr, pc
	bx	r7
	cmp	r5, #5
	bne	.L107
	ldr	r3, .L122+52
	ldr	r3, [r3, #0]
	tst	r3, #1
	beq	.L108
	ldr	r3, .L122+56
	ldr	r3, [r3, #0]
	tst	r3, #1
	beq	.L120
.L108:
	ldr	r6, .L122+60
	mov	r5, #0
.L109:
	add	r0, r4, r5, asl #5
	add	r5, r5, #1
	mov	lr, pc
	bx	r6
	cmp	r5, #20
	bne	.L109
	ldr	r4, .L122+64
	sub	r5, r4, #24
	add	r6, r5, #664
	b	.L111
.L110:
	add	r4, r4, #32
	cmp	r4, r6
	beq	.L121
.L111:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	bne	.L110
	ldr	r3, [r4, #-24]
	cmp	r3, #149
	ble	.L110
	add	r4, r4, #32
	bl	goToLose
	cmp	r4, r6
	bne	.L111
.L121:
	ldr	r3, .L122+68
	ldr	r2, [r3, #0]
	add	r2, r2, #1
	tst	r2, #1
	str	r2, [r3, #0]
	bne	.L102
	ldr	r2, .L122+72
.L113:
	ldr	r3, [r5, #28]
	rsbs	r3, r3, #1
	movcc	r3, #0
	str	r3, [r5, #28]
	add	r5, r5, #32
	cmp	r5, r2
	bne	.L113
.L102:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L120:
	bl	fireBullet
	b	.L108
.L123:
	.align	2
.L122:
	.word	rand
	.word	1717986919
	.word	pAlien
	.word	pship
	.word	updatePlayer
	.word	pBullet
	.word	collisionCheckObstacleTarget
	.word	.LANCHOR1
	.word	aBullet
	.word	.LANCHOR0
	.word	updateBulletEnemy
	.word	playerCollision
	.word	updateBullet
	.word	oldButtons
	.word	buttons
	.word	updateAlien
	.word	pAlien+24
	.word	anicounter
	.word	pAlien+640
	.size	update, .-update
	.align	2
	.global	enemyCol
	.type	enemyCol, %function
enemyCol:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L126
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+4
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, asl #2
	ldr	r2, .L126+8
	sub	r0, r0, r3, asl #2
	add	r0, r2, r0, asl #5
	ldr	r3, [r0, #4]
	add	r2, r2, r3, asl #5
	ldr	r0, [r2, #24]
	cmp	r0, #0
	moveq	r0, r3
	movne	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L127:
	.align	2
.L126:
	.word	rand
	.word	1717986919
	.word	pAlien
	.size	enemyCol, .-enemyCol
	.align	2
	.global	enemyRow
	.type	enemyRow, %function
enemyRow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L130
	mov	lr, pc
	bx	r3
	ldr	r3, .L130+4
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, asl #2
	ldr	r2, .L130+8
	sub	r0, r0, r3, asl #2
	ldr	r3, [r2, r0, asl #5]
	add	r2, r2, r3, asl #5
	ldr	r0, [r2, #24]
	cmp	r0, #0
	moveq	r0, r3
	movne	r0, #0
	ldmfd	sp!, {r3, lr}
	bx	lr
.L131:
	.align	2
.L130:
	.word	rand
	.word	1717986919
	.word	pAlien
	.size	enemyRow, .-enemyRow
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r2, .L139
	ldr	r7, .L139+4
	ldr	ip, .L139+8
	mov	r0, #16
	mov	r6, #0
	ldr	r3, .L139+12
	mov	lr, #3
	mov	r1, #120
	str	r0, [r2, #12]
	str	r0, [r2, #8]
	str	lr, [ip, #0]
	mov	r0, #144
	str	r6, [r7, #0]
	stmia	r2, {r0, r1}	@ phole stm
	add	r0, r3, r1
	mov	r4, #8
	mov	r2, #134
.L133:
	str	r4, [r3, #-8]
	str	r4, [r3, #-12]
	str	r1, [r3, #-16]
	str	r2, [r3, #-20]
	str	r6, [r3], #24
	cmp	r3, r0
	bne	.L133
	ldr	r5, .L139+16
	str	r4, [r5, #12]
	str	r4, [r5, #8]
	bl	enemyCol
	str	r0, [r5, #4]
	bl	enemyRow
	str	r6, [r5, #20]
	str	r4, [r5, #36]
	str	r4, [r5, #32]
	str	r0, [r5, #0]
	bl	enemyCol
	str	r0, [r5, #28]
	bl	enemyRow
	ldr	r2, [r7, #12]
	mov	r3, r6
	ldr	r8, .L139+20
	str	r6, [r5, #44]
	str	r0, [r5, #24]
	mov	r6, r2
	mov	ip, r3
	mov	r4, #16
	mov	r5, #1
.L134:
	add	r1, r8, r6, asl #5
	add	r1, r1, #16
	mov	r0, #0
.L135:
	str	r0, [r1, #-16]
	add	r0, r0, #15
	cmp	r0, #75
	str	r4, [r1, #-4]
	str	r4, [r1, #-8]
	str	r3, [r1, #-12]
	str	r5, [r1, #0]
	str	ip, [r1, #8]
	str	ip, [r1, #12]
	add	r1, r1, #32
	bne	.L135
	add	r3, r3, #30
	cmp	r3, #120
	add	r6, r6, #5
	bne	.L134
	add	r2, r2, #20
	str	r2, [r7, #12]
	str	ip, [r7, #8]
	str	ip, [r7, #4]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L140:
	.align	2
.L139:
	.word	pship
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	pBullet+20
	.word	aBullet
	.word	pAlien
	.size	initialize, .-initialize
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L145
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L141
	ldr	r3, .L145+4
	ldr	r3, [r3, #0]
	ands	r3, r3, #4
	bne	.L141
	ldr	r2, .L145+8
.L143:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L143
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L141:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L146:
	.align	2
.L145:
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.size	updateWin, .-updateWin
	.align	2
	.global	updateLose
	.type	updateLose, %function
updateLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L151
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L147
	ldr	r3, .L151+4
	ldr	r3, [r3, #0]
	ands	r3, r3, #4
	bne	.L147
	ldr	r2, .L151+8
.L149:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L149
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L147:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L152:
	.align	2
.L151:
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.size	updateLose, .-updateLose
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L159
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L154
	ldr	r2, .L159+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L158
.L154:
	tst	r3, #4
	beq	.L153
	ldr	r3, .L159+4
	ldr	r3, [r3, #0]
	ands	r3, r3, #4
	bne	.L153
	ldr	r2, .L159+8
.L156:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L156
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L153:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L158:
	bl	goToGame
	ldr	r3, [r4, #0]
	b	.L154
.L160:
	.align	2
.L159:
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.size	updatePause, .-updatePause
	.align	2
	.global	updateStart
	.type	updateStart, %function
updateStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L164
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L161
	ldr	r3, .L164+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L163
.L161:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L163:
	bl	initialize
	bl	goToGame
	b	.L161
.L165:
	.align	2
.L164:
	.word	oldButtons
	.word	buttons
	.size	updateStart, .-updateStart
	.global	hOff
	.global	vOff
	.global	num
	.global	score
	.global	lives
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.comm	bulletCount,4,4
	.comm	state,4,4
	.comm	pship,20,4
	.comm	pBullet,120,4
	.comm	pAlien,640,4
	.comm	aBullet,48,4
	.comm	l,8,4
	.comm	anicounter,4,4
	.comm	diffSprite,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	lives, %object
	.size	lives, 4
lives:
	.word	3
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	num, %object
	.size	num, 4
num:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
