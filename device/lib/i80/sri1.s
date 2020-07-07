	.area	_CODE
	.globl	sri1

	.8080

sri1:

; Shift 8 bits signed right
;	l = value and return
;	de = shifts (e only)

	ld	d,#0
	ld	a,l
	rla			;check sign
	jp	nc,1$		;jump if positive
	ld	d,#0xff		;also d[0] = 1 if negative
1$:	ld	a,e		;check shifts
	cp	#8
	jp	nc,3$		;return -1 or 0

2$:	dec	e
	jp	m,4$
	ld	a,d
	rra			;set carry bit to d[0]
	ld	a,l		;shift byte
	rra
	ld	l,a
	jp	2$

3$:	ld	l,d
	ret

4$:	ret
