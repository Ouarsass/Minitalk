# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mouarsas <mouarsas@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/19 23:03:01 by aabdou            #+#    #+#              #
#    Updated: 2022/03/19 20:38:43 by mouarsas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HEADER	=	 minitalk.h

HEADER_B =	minitalk_bonus.h

M_SRC	=	util.c \
			client.c\

M_SRC2	= 	util.c \
			server.c \

B_SRC	=	util_bonus.c \
			server_bonus.c\
			
B_SRC2  =	util_bonus.c\
			client_bonus.c\
			
B_OBJ   =	$(B_SRC:.c=.o)

B_OBJ2  =	$(B_SRC2:.c=.o)

M_OBJ	= 	$(M_SRC:.c=.o)
M_OBJ2	= 	$(M_SRC2:.c=.o)

CC = gcc

FLAGS = -Wall -Wextra -Werror

all: server client

client: $(HEADER) $(M_OBJ)
	$(CC) $(FLAGS) $(M_OBJ) -o client

server: $(HEADER) $(M_OBJ2)
	$(CC) $(FLAGS) $(M_OBJ2) -o server

%.o:%.c $(HEADER) $(HEADER_B)
	$(CC) $(FLAGS) -c $< -o $@

bonus: client_bonus server_bonus

client_bonus : $(HEADER_B) $(B_OBJ2)
	$(CC) $(FLAGS) $(B_OBJ2) -o client_bonus
	
server_bonus : $(HEADER_B) $(B_OBJ)
	$(CC) $(FLAGS) $(B_OBJ) -o server_bonus
	
clean:
	rm -f *.o

fclean:clean
	rm -f client server client_bonus server_bonus

re : fclean all
