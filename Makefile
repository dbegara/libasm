# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dbegara- <dbegara-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/29 11:22:13 by dbegara-          #+#    #+#              #
#    Updated: 2021/03/29 18:58:56 by dbegara-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC		= gcc
NAME	= libasm.a
SRCS	= ft_isspace.s \
		  ft_strlen.s \
		  ft_strcpy.s \
		  ft_read.s \
		  ft_write.s \
		  ft_strcmp.s \
		  ft_strdup.s

SRCS_BONUS = ft_create_elem.s \
			 ft_atoi_base.s \
		  	 ft_list_push_front.s \
		  	 ft_list_size.s \
		  	 ft_list_sort.s \
			 ft_list_remove.s \
			 ft_list_remove_if.s

OBJS = $(SRCS:.s=.o)
OBJS_BONUS = $(SRCS_BONUS:.s=.o)

%.o	: %.s
	nasm -f macho64 $< -o $@
all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

bonus: $(OBJS) $(OBJS_BONUS)
	ar rcs $(NAME) $(OBJS) $(OBJS_BONUS)

clean:
	rm -f $(OBJS) $(OBJS_BONUS)	

fclean: clean
	rm -f $(NAME)

re: fclean all

