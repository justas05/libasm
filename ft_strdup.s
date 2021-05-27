; ************************************************************************** ;
;                                                                            ;
;                                                        :::      ::::::::   ;
;   ft_strdup.s                                        :+:      :+:    :+:   ;
;                                                    +:+ +:+         +:+     ;
;   By: hbooke <marvin@42.fr>                      +#+  +:+       +#+        ;
;                                                +#+#+#+#+#+   +#+           ;
;   Created: 2021/05/03 11:55:06 by hbooke            #+#    #+#             ;
;   Updated: 2021/05/03 11:55:08 by hbooke           ###   ########.fr       ;
;                                                                            ;
; ************************************************************************** ;

global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

section .text

ft_strdup:
	push	rdi
	call	ft_strlen
	mov		rdi, rax
	inc		rdi
	call	malloc WRT ..plt
	test	rax, rax
	pop		rsi
	jz		err
	mov		rdi, rax
	call	ft_strcpy
err:
	ret