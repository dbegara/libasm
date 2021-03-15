section	.text
extern	_malloc
extern	___error
global	_ft_create_elem

_ft_create_elem:
	push	rdi
	mov		rdi, 16
	call	_malloc
	pop		rdi
	cmp		rax, 0
	je		error

cpy_data:
	mov		QWORD[rax], rdi

null_next:
	mov		QWORD[rax + 8], 0
	ret

error:
	mov		rdi, rax		; rdi = NULL
	call	___error
	mov		[rax], rdi		; *errno = NULL
	ret