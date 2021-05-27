; ************************************************************************** ;
;                                                                            ;
;                                                        :::      ::::::::   ;
;   ft_list_remove_if_bonus.s                          :+:      :+:    :+:   ;
;                                                    +:+ +:+         +:+     ;
;   By: hbooke <marvin@42.fr>                      +#+  +:+       +#+        ;
;                                                +#+#+#+#+#+   +#+           ;
;   Created: 2021/05/03 11:55:06 by hbooke            #+#    #+#             ;
;   Updated: 2021/05/03 11:55:08 by hbooke           ###   ########.fr       ;
;                                                                            ;
; ************************************************************************** ;

global ft_list_remove_if_bonus

section .text
extern free

; void
; ft_list_remove_if(
;	t_list **begin_list,		rdi
;	void *data_ref,				rsi
;	int (*cmp)(),				rdx
;	void (*free_fct)(void *))	rcx

; rbx - head
; r8 - begin_list
; r9 - prev
; r10 - next

ft_list_remove_if_bonus:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 18h
	mov		[rbp - 8h], rcx
	mov		[rbp - 10h], rdi
	mov		[rbp - 18h], rdx

	test	rdi, rdi			; if (!begin_list)
	jz		end_loop
	test	rdx, rdx			; if (!cmp)
	jz		end_loop

	mov		rbx, [rdi]			; rbx = *begin_list
	xor		r9, r9
loop:
	test	rbx, rbx			; while (head)
	jz		end_loop
	mov		r10, [rbx + 8h]		; next = head->next

	mov		rdx, [rbp - 18h]
	test	rdx, rdx			; if (cmp)
	jz		prev_change
	mov		rdi, [rbx]
	call	rdx
	test	eax, eax
	jnz		prev_change

	mov		rcx, [rbp - 8h]
	test	rcx, rcx
	jz		no_free_function
	mov		rax, [rbx]
	mov		rdi, rax
	call	rcx

no_free_function:
	mov		rdi, rbx
	call	free WRT ..plt

	test	r9, r9
	jz		begin_change
	mov		[r9 + 8h], r10
	jmp		next_iteration
begin_change:
	mov		r8, [rbp - 10h]
	mov		[r8], r10
	jmp		next_iteration
prev_change:
	mov		r9, rbx
next_iteration:
	mov		rbx, r10			; head = next
	jmp		loop
end_loop:
	add		rsp, 18h
	pop		rbp
	ret