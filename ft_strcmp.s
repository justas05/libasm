; ************************************************************************** ;
;                                                                            ;
;                                                        :::      ::::::::   ;
;   ft_strcmp.s                                        :+:      :+:    :+:   ;
;                                                    +:+ +:+         +:+     ;
;   By: hbooke <marvin@42.fr>                      +#+  +:+       +#+        ;
;                                                +#+#+#+#+#+   +#+           ;
;   Created: 2021/05/03 11:55:06 by hbooke            #+#    #+#             ;
;   Updated: 2021/05/03 11:55:08 by hbooke           ###   ########.fr       ;
;                                                                            ;
; ************************************************************************** ;

global ft_strcmp

section .text

ft_strcmp:
	xor		rax, rax
	xor		rcx, rcx
	mov		al, byte [rdi]
	test	al, al
	jz		quit
	mov		cl, byte [rsi]
	sub		rax, rcx
	jnz		quit
	inc		rdi
	inc		rsi
	jmp		ft_strcmp
quit:
	ret