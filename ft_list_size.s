section	.text
global	_ft_list_size

_ft_list_size:
	xor		rax, rax
	cmp		rdi, 0
	jz		return
	loop:
		cmp		rdi, 0
		jz		return
		mov		rdi, [rdi + 8]
		inc		rax
		jmp		loop
return:
	ret
