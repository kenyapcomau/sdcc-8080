	.area	_CODE
	.globl	__sru1

	.8080

__sru1:

; Shift 8 bits unsigned right
;	l = value and return
;	de = shifts (e only)

	ld	d,#0
	ld	a,e		;check shifts
	cp	#8
	jp	nc,3$		;return 0

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
