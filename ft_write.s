section .text
global _ft_write
extern ___error

_ft_write:
	mov		rax, 0x2000004 ; write
	syscall
	jc error
	ret

error:
	push r15
	mov r15, rax
	call ___error
	mov [rax], r15
	pop r15
	mov rax, -1
	ret