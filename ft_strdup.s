section	.text
global	_ft_strdup
extern	_malloc
extern	___error
extern	_ft_strlen
extern	_ft_strcpy

; rdi = counter, rax = new_str, rdx = aux, rcx = str

_ft_strdup:
	call	_ft_strlen		; rax = strlen(str)
	push	rdi				; saves rdi (str) at the top of the stack
	mov		rdi, rax		; rdi = strlen(str)
	inc		rdi				; rdi = strlen(str) + 1
	call	_malloc			; malloc(rdi) -> rax = new_str
	cmp		rax, 0			; check if malloc returned a NULL ptr
	je		error			; if so, jumps to error
	mov		rdi, rax
	pop		rsi
	call	_ft_strcpy
	ret

error:
	mov		rdi, rax		; rdi = NULL
	call	___error
	mov		[rax], rdi		; *errno = NULL
	ret