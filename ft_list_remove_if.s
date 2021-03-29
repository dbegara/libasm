section	.text
extern	_ft_list_size
extern	_ft_list_remove
global	_ft_list_remove_if

; rdi = **lst | rsi = *data_ref | rdx = int (*cmp) | rcx = void (free_ftc)
_ft_list_remove_if:
	push	rdi
	mov		rdi, [rdi]
	call	_ft_list_size
	mov		r8, rax
	dec		r8
	pop		rdi
	.loop:
		cmp		r8, 0
		je		.end_loop
		push	r8
		push	rsi
		push	rdx
		push	rcx
		push	rdi
		mov		rdi, [rdi]
		mov		rdi, [rdi]
		call	rdx
		pop		rdi
		cmp		rax, 0		
		jne		.end_delete
		.start_delete:
			pop		rsi
			push	rsi
			call	_ft_list_remove
			pop		rcx
			pop		rdx
			pop		rsi
			pop		r8
			dec		r8
			mov		rdi, [rdi]
			add		rdi, 8
			jmp		.loop
		.end_delete:
		pop		rcx
		pop		rdx
		pop		rsi
		pop		r8
		dec		r8
		mov		rdi, [rdi + 8]
		jmp		.loop
	.end_loop:
		ret