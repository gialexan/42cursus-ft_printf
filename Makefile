# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gialexan <gialexan@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/19 21:46:44 by gialexan          #+#    #+#              #
#    Updated: 2022/07/25 13:54:52 by gialexan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = ft_hex.c ft_itoa.c ft_printf_utils.c ft_printf.c ft_strlen.c ft_utoa.c ft_strchr.c

OBJ = $(SRC:.c=.o)

CC = gcc

CFLAGS = -Wall -Wextra -Werror

RM = rm -f

NAME =	libftprintf.a

all: $(NAME)

$(NAME):	$(OBJ)
			ar rcs $(NAME) $(OBJ)

clean:
			$(RM) $(OBJ)

fclean: clean
			$(RM) $(NAME)

re:	fclean	all
