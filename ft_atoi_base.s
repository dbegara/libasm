section	.text
global	_ft_atoi_base
extern	_ft_strlen
extern	_ft_isspace

; rdi = num, rsi = base, rax = new_num, [rsp] = base_len, r9 = counter & neg flag, r8 = counter, r10 = byte aux, r11 = num_len

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
	push	rdi				; push rdi
	mov		rdi, rsi
	xor		r9, r9			; r9 = 0

check_base_loop:
	cmp		r9d, [rsp + 8]			
	je		check_done				; if (r9 == len(base)) jump to done
	add		rdi, r9
	call	_ft_isspace
	cmp		rax, 1
	je		check_error
	cmp		dil, 43
	je		check_error
	cmp		dil, 45
	je		check_error
	mov		r8d, r9d				; r8 = 15
	inc		r8d						; r8++ to check from next character
	compare_rep:
		cmp		r8d, [rsp + 8]
		je		loop_control			; if (r8 == len(base)) jump to loop_control
		cmp		dil, BYTE [rsi + r8]
		je		check_error				; if (base[r9] == base[r8]) jump to error
		inc		r8d						; r8++
	loop_control:
		cmp		r8d, [rsp + 8]
		jb		compare_rep
		inc		r9d
		jmp		check_base_loop


neg_num:
	cmp		r9, -1
	je		.pos
	.neg:
		mov		r9, -1		; 	neg		= -1
		inc		rdi			;	str++
		dec		r11
		jmp		check_done.sign_check
	.pos:
		mov		r9, 1		; 	neg		= -1
		inc		rdi			;	str++
		dec		r11
		jmp		check_done.sign_check

plus_sign:
	inc		rdi
	dec		r11
	jmp		check_done.sign_check

check_done:
	pop		rdi
	call	_ft_strlen
	mov		r11, rax				; len(str)
	xor		rax, rax				; rax = 0
	xor		r8, r8					; i = 0
	.skip_spaces:
		call	_ft_isspace
		cmp		rax, 1
		jne		.end_skip_spaces
		inc		rdi
		dec		r11
		jmp		.skip_spaces
	.end_skip_spaces:
		mov		r9, 1
		.sign_check:
			cmp		BYTE [rdi], 45
			je		neg_num
			cmp		BYTE [rdi], 43
			je		plus_sign
	xor rax, rax
	
num_loop:
	cmp		r8, r11					; if i == len(str)
	je		return
	mul		DWORD [rsp]				; rax = rax * len(base)
	mov		r10b, BYTE [rdi + r8]	; r10 = str[i]
	xor		rcx, rcx				; rcx = 0
	inc		r8						; i++

find_num:
	cmp		ecx, [rsp]  			; if rcx == len(base)
	je		return
	cmp		r10b, BYTE [rsi + rcx]
	je		add_num
	inc		rcx
	jmp		find_num

add_num:
	add		rax, rcx
	jmp		num_loop

return:
	mul		r9
	add		rsp, 4
	ret

check_error:
	add		rsp, 12
	mov		rax, 0
	ret

error:
	add		rsp, 4
	mov		rax, 0
	ret