; ************************************************************************** ;
;                                                                            ;
;                                                        :::      ::::::::   ;
;   ft_list_push_front_bonus.s                         :+:      :+:    :+:   ;
;                                                    +:+ +:+         +:+     ;
;   By: hbooke <marvin@42.fr>                      +#+  +:+       +#+        ;
;                                                +#+#+#+#+#+   +#+           ;
;   Created: 2021/05/03 11:55:06 by hbooke            #+#    #+#             ;
;   Updated: 2021/05/03 11:55:08 by hbooke           ###   ########.fr       ;
;                                                                            ;
; ************************************************************************** ;

global ft_list_push_front

section .text
extern malloc

ft_list_push_front:
	test	rdi, rdi
	jz		out
	push	rdi
	push	rsi
	mov		rdi, 10h
	call	malloc WRT ..plt
	test	rax, rax
	jz		out
	pop		rsi
	pop		rdi
	mov		[rax], rsi
	mov		rsi, [rdi]
	mov		[rax + 8], rsi
	mov		[rdi], rax
out:
	ret