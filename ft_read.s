; ************************************************************************** ;
;                                                                            ;
;                                                        :::      ::::::::   ;
;   ft_read.s                                          :+:      :+:    :+:   ;
;                                                    +:+ +:+         +:+     ;
;   By: hbooke <marvin@42.fr>                      +#+  +:+       +#+        ;
;                                                +#+#+#+#+#+   +#+           ;
;   Created: 2021/05/03 11:55:06 by hbooke            #+#    #+#             ;
;   Updated: 2021/05/03 11:55:08 by hbooke           ###   ########.fr       ;
;                                                                            ;
; ************************************************************************** ;

global ft_read
extern __errno_location

section .text

ft_read:
	mov		rax, 0x0
	syscall
	cmp		rax, 0
	jl		err
	ret
err:
	neg		rax
	mov		rdi, rax
	call	__errno_location WRT ..plt
	mov		[rax], rdi
	mov		rax, -1
	ret