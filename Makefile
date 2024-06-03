NAME=fdf
HEADER=fdf.h 
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)
FRAME_FLAGS = -lmlx -framework OpenGL -framework AppKit
G_FLAG = -Imlx
CC=gcc
LIBFT = libft/libft.a
CFLAGS= -Wall -Werror -Wextra
RM=rm -f

all : compile $(NAME)

compile :
	cd ./libft && make

%.o : %.c 
	$(CC) $(G_FLAG) -c $< -o $@

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(LIBFT) $(FRAME_FLAGS) $(OBJ)  -o $(NAME)

fclean : clean fcleanLib
	$(RM) $(NAME)

fcleanLib :
	cd ./libft && make fclean

clean : cleanLib
	$(RM) $(OBJ)

cleanLib :
	cd ./libft && make clean

re : fclean all


.PHONY : all, clean, fclean
