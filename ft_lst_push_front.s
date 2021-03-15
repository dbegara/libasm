section	.text
extern	_ft_create_elem
global	_ft_lst_push_front

_ft_lst_push_front:
	push	rdi
	mov		rdi, rsi
	call	_ft_create_elem
	pop		rdi
	mov		r8, [rdi]
	mov		QWORD [rax + 8], r8
	mov		[rdi], rax
	ret