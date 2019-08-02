	.area	_CODE
	.globl	__sri4

	.8080

__sri4:

; Shift 32 bits signed right
;	de,hl = value and return
;	bc = shifts (c only)

	ld	b,#0
	ld	a,d
	rla
	jp	nc,1$		;jump if positive signed integer
	ld	b,#0xff		;also b[0] = 1 if negative

1$:	ld	a,c
	cp	#32
	jp	nc,3$

2$:	dec	c
	jp	m,4$
	ld	a,b
	rra			;set carry bit to b[0]
	ld	a,d
	rra
	ld	d,a
	ld	a,e
	rra
	ld	e,a
	ld	a,h
	rra
	ld	h,a
	ld	a,l
	rra
	ld	l,a
	jp	2$

3$:	ld	d,b
	ld	e,b
	ld	h,b
	ld	l,b
	ret

4$:
	ret
