# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dcherend <dcherend@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/05/06 16:28:49 by dcherend          #+#    #+#              #
#    Updated: 2018/05/15 13:38:36 by dcherend         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf

SRC_DIR = ./src/
OBJ_DIR = ./obj/
INC_DIR = ./inc/
LIB_DIR = ./lib/
LIBMLX_DIR = ./lib/minilibx_macos/

SRC = fdf.c utils.c parser.c control.c \

OBJ = $(addprefix $(OBJ_DIR), $(SRC:.c=.o))

LIBFT = $(LIBFT_DIR)libft.a
LIBFT_DIR = $(LIB_DIR)libft/
LIBFT_INC = $(LIBFT_DIR)$(INC_DIR)
LIBFT_FLAGS = -lft -L $(LIBFT_DIR)

LIBMLX = $(LIBMLX_DIR)libmlx.a

HEADER_FLAGS = -I $(INC_DIR) -I $(LIBFT_INC)

MLX_FLAGS = -lmlx -framework OpenGL -framework AppKit
CC_FLAGS = -Wall -Werror -Wextra
CC = gcc -g 

all: $(NAME)

$(NAME): $(LIBFT) $(OBJ)
	$(CC) $(OBJ) $(LIBFT_FLAGS) $(LIBMLX) $(MLX_FLAGS) -o $(NAME)

$(OBJ): | $(OBJ_DIR)

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	$(CC) -c $< -o $@ $(HEADERS_FLAGS) # $(CC_FLAGS)

$(LIBFT):
	make -C $(LIBFT_DIR)

clean:
	rm -f $(OBJ)
	make clean -C $(LIBFT_DIR)

fclean: clean
	rm -f $(NAME)
	rm -rf $(OBJ_DIR)
	make fclean -C $(LIBFT_DIR)

re: fclean all

.PHONY: all clean fclean re
