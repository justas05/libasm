; ************************************************************************** ;
;                                                                            ;
;                                                        :::      ::::::::   ;
;   ft_strcpy.s                                        :+:      :+:    :+:   ;
;                                                    +:+ +:+         +:+     ;
;   By: hbooke <marvin@42.fr>                      +#+  +:+       +#+        ;
;                                                +#+#+#+#+#+   +#+           ;
;   Created: 2021/05/03 11:55:06 by hbooke            #+#    #+#             ;
;   Updated: 2021/05/03 11:55:08 by hbooke           ###   ########.fr       ;
;                                                                            ;
; ************************************************************************** ;

global ft_strcpy

section .text

ft_strcpy:
	xor		rax, rax
len_loop:
	mov		cl, byte [rsi]
	mov		byte [rdi], cl
	cmp		cl, 0h
	jz		quit
	inc		rdi
	inc		rsi
	inc		rax
	jmp		len_loop
quit:
	sub		rdi, rax
	mov		rax, rdi
	ret