section	.text
extern	_ft_list_size
global	_ft_list_sort

_ft_list_sort:
	mov		rdi, [rdi]
	push	rdi
	call	_ft_list_size
	mov		r8, rax
	sub		r8, 1
	pop		rdi
	mov		r9, -1
loop_1:
	inc		r9
	cmp		r9, r8
	je		end_loop
	xor		r10, r10
	loop_2:
		mov		r11, r8
		sub		r11, r9
		cmp		r10, r11
		je		loop_1
		.compare:
			push	rdi
			push	rsi
			mov		rax, r10
			.get_list_member:
				cmp		rax, -1
				je		.end_get_list_member
				mov		rsi, rdi
				mov		rdi, [rsi + 8]
				dec		rax
				jmp		.get_list_member
			.end_get_list_member:
				pop		rdx
				push	rsi
				push	rdi
				mov		rsi, [rsi]
				mov		rdi, [rdi]
				push	rsi
				push	rdi
				push	r8
				call	rdx
				xor		r8, r8
				cmp		r8, rax
				jg		swap
		pop		r8
		add		rsp, 32
		pop		rdi
		mov		rsi, rdx
		inc		r10
		jmp		loop_2

swap:
	pop		r8
	pop		rdi
	pop		rsi
	pop		r11
	mov		[r11], rsi
	pop		r11
	mov		[r11], rdi
	pop		rdi
	mov		rsi, rdx
	inc		r10
	jmp		loop_2

end_loop:
	mov		rax, 0
	ret