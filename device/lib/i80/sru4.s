	.area	_CODE
	.globl	sru4

	.8080

sru4:

; Shift 32 bits unsigned right
;	de,hl = value and return
;	bc = shifts (c only)

	ld	b,#0
	ld	a,c
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
