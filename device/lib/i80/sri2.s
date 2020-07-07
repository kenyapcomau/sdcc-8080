	.area	_CODE
	.globl	sri2

	.8080

sri2:

; Shift 16 bits signed right
;	hl = value and return
;	de = shifts (e only)

	ld	d,#0
	ld	a,h
	rla			;check sign
	jp	nc,1$		;jump if positive
	ld	d,#0xff		;also d[0] = 1 if negative
1$:	ld	a,e		;check shifts
	cp	#16
	jp	nc,3$		;return -1 or 0

2$:	dec	e
	jp	m,4$
	ld	a,d
	rra			;set carry bit to d[0]
	ld	a,h		;shift MSB
	rra
	ld	h,a
	ld	a,l		;shift LSB
	rra
	ld	l,a
	jp	2$

3$:	ld	e,d
	ex	de,hl
	ret

4$:	ret
