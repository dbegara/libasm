section .text
global _ft_write
extern ___error

_ft_write:
	mov		rax, 0x2000004 ; write
	syscall
	jc error
	ret

error:
	sub	rsp, 8
	mov r15, rax
	call ___error
	add	rsp, 8
	mov [rax], r15
	mov rax, -1
	ret