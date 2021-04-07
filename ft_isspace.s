section	.text
global	_ft_isspace

;BYTE [rdi] = char c

_ft_isspace:
	cmp		BYTE [rdi], 9
	je		equal
	cmp		BYTE [rdi], 10
	je		equal
	cmp		BYTE [rdi], 11
	je		equal
	cmp		BYTE [rdi], 12
	je		equal
	cmp		BYTE [rdi], 13
	je		equal
	cmp		BYTE [rdi], 32
	je		equal
	mov		rax, 0
	ret

equal:
	mov rax, 1
	ret