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
	.file	"update.c"
	.text
	.align	2
	.global	collisionCheckObstacleTarget
	.type	collisionCheckObstacleTarget, %function
collisionCheckObstacleTarget:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #24]
	cmp	r3, #1
	mov	r3, r0
	beq	.L6
	ldmib	r1, {r2, ip}	@ phole ldm
	ldr	r0, [r0, #4]
	add	ip, r2, ip
	cmp	r0, ip
	bgt	.L6
	ldr	ip, [r3, #8]
	add	r0, r0, ip
	cmp	r2, r0
	bgt	.L6
	ldr	r2, [r3, #0]
	ldr	ip, [r3, #12]
	ldr	r0, [r1, #0]
	add	ip, r2, ip
	cmp	ip, r0
	blt	.L6
	ldr	ip, [r1, #12]
	add	r0, r0, ip
	cmp	r2, r0
	bgt	.L7
	ldr	r2, [r3, #20]
	mov	r0, #1
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r0, [r1, #24]
	str	r2, [r3, #20]
	bx	lr
.L6:
	mov	r0, #0
	bx	lr
.L7:
	mov	r0, #0
	bx	lr
	.size	collisionCheckObstacleTarget, .-collisionCheckObstacleTarget
	.align	2
	.global	playerCollision
	.type	playerCollision, %function
playerCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldmib	r1, {r3, ip}	@ phole ldm
	ldr	r2, [r0, #4]
	add	ip, r3, ip
	cmp	r2, ip
	bgt	.L13
	ldr	ip, [r0, #8]
	add	r2, r2, ip
	cmp	r3, r2
	bgt	.L13
	ldr	r3, [r0, #0]
	ldr	ip, [r0, #12]
	ldr	r2, [r1, #0]
	add	ip, r3, ip
	cmp	ip, r2
	blt	.L13
	ldr	r1, [r1, #12]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L14
	ldr	r3, [r0, #20]
	rsbs	r3, r3, #1
	movcc	r3, #0
	str	r3, [r0, #20]
	mov	r0, #1
	bx	lr
.L13:
	mov	r0, #0
	bx	lr
.L14:
	mov	r0, #0
	bx	lr
	.size	playerCollision, .-playerCollision
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L16
	ldr	r2, [r0, #8]
	ldr	r3, [r0, #4]
	rsb	r2, r2, #240
	cmp	r3, r2
	addlt	r3, r3, #1
	strlt	r3, [r0, #4]
.L16:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bxne	lr
	ldr	r3, [r0, #4]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r0, #4]
	bx	lr
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L19
	ldr	r3, [r0, #0]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #0]
	bxge	lr
	mov	r3, #0
	str	r3, [r0, #20]
.L19:
	ldmia	r1, {r2, r3}	@ phole ldm
	sub	r2, r2, #10
	stmia	r0, {r2, r3}	@ phole stm
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	updateBulletEnemy
	.type	updateBulletEnemy, %function
updateBulletEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #0]
	add	r3, r3, #1
	cmp	r3, #240
	str	r3, [r0, #0]
	movgt	r3, #0
	strgt	r3, [r0, #20]
	strgt	r2, [r0, #0]
	strgt	r1, [r0, #4]
	bx	lr
	.size	updateBulletEnemy, .-updateBulletEnemy
	.align	2
	.global	updateAlien
	.type	updateAlien, %function
updateAlien:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #16]
	cmp	r3, #1
	beq	.L29
	cmp	r3, #0
	bxne	lr
	ldr	r3, [r0, #4]
.L27:
	cmp	r3, #0
	ble	.L28
	ldr	r2, [r0, #28]
	sub	r3, r3, #1
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r0, #28]
	str	r3, [r0, #4]
.L28:
	cmp	r3, #0
	bxne	lr
	ldr	r2, [r0, #0]
	ldr	r3, [r0, #12]
	add	r3, r2, r3
	str	r3, [r0, #0]
	mov	r3, #1
	str	r3, [r0, #16]
	bx	lr
.L29:
	ldmib	r0, {r2, r3}	@ phole ldm
	rsb	r3, r3, #240
	cmp	r2, r3
	bge	.L25
	ldr	r1, [r0, #28]
	add	r2, r2, #1
	rsbs	r1, r1, #1
	movcc	r1, #0
	str	r1, [r0, #28]
	str	r2, [r0, #4]
.L25:
	cmp	r3, r2
	bxne	lr
	ldr	r1, [r0, #0]
	ldr	r2, [r0, #12]
	add	r2, r1, r2
	str	r2, [r0, #0]
	mov	r2, #0
	str	r2, [r0, #16]
	b	.L27
	.size	updateAlien, .-updateAlien
	.ident	"GCC: (devkitARM release 31) 4.5.0"
