; ************************************************************************** ;
;                                                                            ;
;                                                        :::      ::::::::   ;
;   ft_list_sort_bonus.s                               :+:      :+:    :+:   ;
;                                                    +:+ +:+         +:+     ;
;   By: hbooke <marvin@42.fr>                      +#+  +:+       +#+        ;
;                                                +#+#+#+#+#+   +#+           ;
;   Created: 2021/05/03 11:55:06 by hbooke            #+#    #+#             ;
;   Updated: 2021/05/03 11:55:08 by hbooke           ###   ########.fr       ;
;                                                                            ;
; ************************************************************************** ;

global ft_list_sort_bonus

section .text

ft_list_swap_data:
	mov		rax, [rdi]
	mov		rdx, [rsi]
	mov		[rdi], rdx
	mov		[rsi], rax
	ret

; void	ft_list_sort(t_list **begin_list, int (*cmp)());
ft_list_sort_bonus:
	test	rdi, rdi			; if (begin_list)
	jz		end_loop
	mov		rdi, [rdi]			; rdi = *begin_list
	mov		rbx, rdi			; rbx = *begin_list
	mov		rcx, rsi			; rcx = cmp
loop:
	test	rdi, rdi			; while (rdi)
	jz		end_loop
	mov		rsi, rbx
in_loop:
	test	rsi, rsi			; while (rsi)
	jz		end_in_loop
	push	rdi
	push	rsi
	mov		rdi, [rdi]
	mov		rsi, [rsi]
	call	rcx
	pop		rsi
	pop		rdi
	cmp		eax, 0
	jge		pass
	call	ft_list_swap_data
pass:
	mov		rsi, [rsi + 8]		; rsi = rsi->next
	jmp in_loop
end_in_loop:
	mov		rdi, [rdi + 8]		; rdi = rdi->next
	jmp		loop
end_loop:
	ret