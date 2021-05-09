# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hbooke <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/09 12:48:03 by hbooke            #+#    #+#              #
#    Updated: 2021/05/09 12:58:15 by hbooke           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=asm
LIB_NAME=lib${NAME}.a

SRCS=ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS=${SRCS:.s=.o}

CFLAGS=-Wall -Wextra -Werror -static
LDFLAGS=-L . -l {LIB_NAME}
NFLAGS=-f elf64
AR_OPTS=-rcs
RM_OPTS=-rf

CC=cc
ASM=nasm
RM=rm
AR=ar

###############################################################################

.PHONY: re clean fclean

${NAME}: ${OBJS}
	${AR} ${AR_OPTS} ${LIB_NAME} ${OBJS}

${OBJS}: ${SRCS}
	${ASM} ${NFLAGS} $<

re: fclean lib

clean:
	${RM} ${RM_OPTS} ${OBJS}

fclean: clean
	${RM} ${RM_OPTS} ${LIB_NAME}
