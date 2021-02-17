section .text
global _ft_strcmp

_ft_strcmp:
	push	rdx
	push	rcx
	xor		rdx, rdx	; i = 0
	xor		rcx, rcx	; diff = 0
	jmp		check_null

check_null:
	cmp		BYTE [rdi + rdx], 0
	je		end_rdi
	cmp		BYTE [rsi + rdx], 0
	je		end_rsi
	jmp		compare

compare:
	mov		cl, BYTE [rdi + rdx]
	cmp		cl, BYTE [rsi + rdx]
	jne		differ
	inc		rdx
	jmp		check_null

end_rdi:
	cmp		BYTE [rsi + rdx], 0
	je		equal
	jmp		differ

end_rsi:
	cmp		BYTE [rdi + rdx], 0
	je		equal
	jmp		differ

differ:
	mov		cl, BYTE [rdi + rdx]	; rcx = s1[rdx]
	mov		dl, BYTE [rsi + rdx]	; rcx = s2[rdx]
	xor		dh, dh 					; clean higher byte
	sub		rcx, rdx
	mov		rax, rcx
	pop		rcx
	pop		rdx
	ret

equal:
	pop		rcx
	pop		rdx
	mov		rax, 0
	ret
