section	.text
global	_ft_list_remove

; rdi = **element | rcx = (free)

_ft_list_remove:
	push	rdi
	mov		rdi, [rdi]
	mov		r8, [rdi + 8]
	push	r8
	call	rsi
	pop		r8
	pop		rdi
	mov		[rdi], r8
	ret
	