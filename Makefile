# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hbooke <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/09 12:48:03 by hbooke            #+#    #+#              #
#    Updated: 2021/05/27 13:48:22 by hbooke           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=asm
LIB_NAME=lib${NAME}.a

SRCS=ft_strlen.s	\
	ft_strcpy.s		\
	ft_strcmp.s		\
	ft_write.s		\
	ft_read.s		\
	ft_strdup.s
BONUS_SRCS=ft_list_push_front_bonus.s	\
			ft_list_size_bonus.s		\
			ft_list_sort_bonus.s		\
			ft_list_remove_if_bonus.s
OBJS=${SRCS:.s=.o}
BONUS_OBJS=${BONUS_SRCS:.s=.o}

CFLAGS=-ggdb -Wvla -Wall -Wextra #-static
LDFLAGS=-L . -l ${NAME}
NFLAGS=-f elf64
AR_OPTS=-rcs
RM_OPTS=-rf

CC=cc
ASM=nasm
RM=rm
AR=ar

###############################################################################

.PHONY: test re clean fclean bonus

${LIB_NAME}: ${NAME}


${NAME}: ${OBJS}
	${AR} ${AR_OPTS} ${LIB_NAME} ${OBJS}

bonus: ${BONUS_OBJS} ${NAME}
	${AR} ${AR_OPTS} ${LIB_NAME} ${BONUS_OBJS}

${OBJS}: ${SRCS}
	${ASM} ${NFLAGS} ${@:.o=.s}

${BONUS_OBJS}: ${BONUS_SRCS}
	${ASM} ${NFLAGS} ${@:.o=.s}

re: fclean lib

clean:
	${RM} ${RM_OPTS} ${OBJS} ${BONUS_OBJS} test

fclean: clean
	${RM} ${RM_OPTS} ${LIB_NAME}

test: fclean bonus test.c
	${CC} ${CFLAGS} test.c -o test ${LDFLAGS}