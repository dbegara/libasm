section .text
global _ft_strlen

; rdi = *str , rsi, rdx, rcx

_ft_strlen:
	xor		rax, rax			; rax = 0
	cmp		rdi, 0				; if (str == 0)
	je		return
	jmp		compare

compare:
	cmp		BYTE [rdi + rax], 0	; compare *str with 0 
	je		return				; if equal return
	inc		rax					; rax++
	jmp		compare

return:
	ret