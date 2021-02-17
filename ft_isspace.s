section	.text
global	_ft_isspace

;dil = char c

_ft_isspace:
	cmp		dil, 9
	je		equal
	cmp		dil, 10
	je		equal
	cmp		dil, 11
	je		equal
	cmp		dil, 12
	je		equal
	cmp		dil, 13
	je		equal
	cmp		dil, 32
	je		equal
	mov		rax, 0
	ret

equal:
	mov rax, 1
	ret