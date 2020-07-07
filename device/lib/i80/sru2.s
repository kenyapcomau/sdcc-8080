	.area	_CODE
	.globl	sru2

	.8080

sru2:

; Shift 16 bits unsigned right
;	hl = value and return
;	de = shifts (e only)

	ld	d,#0
	ld	a,e		;check shifts
	cp	#16
	jp	nc,3$		;return 0

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
