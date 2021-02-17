section	.text
global	_ft_atoi_base
extern	_ft_strlen
extern	_ft_isspace

; rdi = num, rsi = base, rax = new_num, [rsp] = base_len, r15 = counter1, r14 = counter2

_ft_atoi_base:
	sub		rsp, 4			; make space for local variable (base len)
	push	rdi				; push num
	mov		rdi, rsi		; rdi = base

check_base:
	call	_ft_strlen		; rax = len(base)
	pop		rdi				; rdi = num
	cmp		rax, 2			
	jb		error			; if (rax < 2) jump to error
	mov		[rsp], eax		; saves len(rdi) on local variable at the stack
	push	r15				; push r15
	push	r14				; push r14
	push	rdi
	xor		r15, r15		; r15 = 0

check_base_loop:
	cmp		r15d, [rsp + 16]			
	je		done					; if (r15 == len(base)) jump to done
	mov		dil, BYTE [rsi + r15]	; stores base[r15] on al (lower byte of rax)
	call	_ft_isspace
	cmp		rax, 1
	je		check_error
	mov		r14d, r15d				; r14 = 15
	inc		r14d						; r14++ to check from next character
	compare_rep:
		cmp		r14d, [rsp + 16]
		je		loop_control			; if (r14 == len(base)) jump to loop_control
		cmp		dil, BYTE [rsi + r14]
		je		check_error				; if (base[r15] == base[r14]) jump to error
		inc		r14d						; r14++
	loop_control:
		cmp		r14d, [rsp + 16]
		jb		compare_rep
		inc		r15d
		jmp		check_base_loop

done:
	pop		rdi
	pop		r14
	pop		r15
	mov		rax, [rsp]
	add		rsp, 4
	ret

check_error:
	pop		rdi
	pop		r14
	pop		r15
	add		rsp, 4
	mov		rax, -1
	ret

error:
	add		rsp, 4
	mov		rax, -1
	ret