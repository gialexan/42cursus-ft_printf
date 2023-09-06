# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gialexan <gialexan@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/19 21:46:44 by gialexan          #+#    #+#              #
#    Updated: 2023/09/06 09:27:24 by gialexan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
##                                PRINTF                                      ##
################################################################################

RESET := \033[0m
CYAN  := \033[1;36m
CHECK := \342\234\224
LOG   := printf "[$(CYAN)$(CHECK)$(RESET)] %s\n"

NAME  := libftprintf.a

################################################################################
##                                DIRECTORIES                                 ##
################################################################################

OBJ_DIR := obj
HEADERS := ft_printf.h

SRC_FILES := ft_hex.c ft_itoa.c ft_printf_utils.c ft_printf.c ft_strlen.c ft_utoa.c ft_strchr.c

OBJS := $(addprefix $(OBJ_DIR)/, $(SRC_FILES:.c=.o))

################################################################################
##                                 COMPILATION                                ##
################################################################################

CFLAGS  := -Wall -Werror -Wextra

all: $(NAME)

# $@ -> variável automática para NAME da regra.
# $^ -> variável automática para o todos elementos da lista de requisitos.
# $< -> variável automática para somente o primeiro elemento da lista de requisitos.
# | -> significa para colocar prioridade na compilação, no caso abaixo primeiro a libft e mlx depois o restante

$(NAME): $(OBJS)
	@$(LOG) "Building $@"
	@$(AR) rcs $(NAME) $^

bonus: $(OBJS) $(OBJS_BONUS)
	@$(LOG) "Building $(NAME) $@"
	@$(AR) rcs $(NAME) $^

$(OBJ_DIR)/%.o: %.c $(HEADERS) | $(OBJ_DIR)
	@$(LOG) "Compiling $(notdir $<)"
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	@$(LOG) "Creating objects directory"
	@mkdir $@

clean:
	@$(RM) -r $(OBJS)
	@$(LOG) "Removing objects"
	@$(RM) -r $(OBJ_DIR)
	@$(LOG) "Removing objects directory"

fclean: clean
	@$(RM) -r $(NAME)
	@$(LOG) "Removing $(NAME)"

re: clean all

.PHONY: all clean fclean re
