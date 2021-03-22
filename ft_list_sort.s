section	.text
extern	_ft_list_size
global	_ft_list_sort

_ft_list_sort:
	mov		rdi, [rdi]
	push	rdi
	call	_ft_list_size
	pop		rdi
	mov		rdi, [rdi]
	mov		r8, rax
	mov		r9, -1
loop_1:
	inc		r9
	dec		r8
	cmp		r9, r8
	je		end_loop
	xor		r10, r10
	loop_2:
		mov		r11, r8
		sub		r11, r9
		cmp		r10, r11
		je		loop_1
		.compare:
			;push	rdi
			;push	rsi
			mov		rax, 16  ; Tiene que ir de next en next, hay que hacer una función que avance n posiciones en la lista
			mul		r10
			mov		r11, rdi
			add		r11, rax
			mov		rax, r11
			add		rax, 16
			ret
			mov		rdi, [r11]
			mov		rsi, [r11 + 8]
			pop		rdx
			call	rdx
			cmp		rax, 0
			jg		swap
		pop		rdi
		inc		r10
		jmp		loop_2

swap:
	mov		rdx, [r11]
	mov		rcx, r11
	mov		rcx, [rcx + 16]
	mov		[r11], rcx
	mov		[rcx], rdx
	pop		rdi
	inc		r10
	jmp		loop_2

end_loop:
	ret