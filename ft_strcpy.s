section .text
global _ft_strcpy

_ft_strcpy:
	xor		rax, rax	; rax = 0
	jmp		copy

copy:
	mov		dl, BYTE [rsi + rax]
	mov		BYTE [rdi + rax], dl
	cmp 	BYTE [rsi + rax], 0
	je		return
	inc		rax
	jmp		copy

return:
	mov rax, rdi
	ret