##
## EPITECH PROJECT, 2019
## my_printf
## File description:
## Makefile
##

CC 			= 	gcc

SRC			= 	$(addprefix $(SRC_D), $(SRC_F))
OBJ 		= 	$(SRC:.c=.o)
SRC_D 		= 	src/
SRC_F 		= 	

SRC_UT   	=	$(addprefix $(SRC_UT_D), $(SRC_UT_F))
OBJ_UT 	 	=	$(SRC_UT:.c=.o)
SRC_UT_D 	= 	tests/
SRC_UT_F 	= 	

INC			= 	-I./include/

CFLAGS		= 	-W -Wall -Wextra -Werror $(INC)

LDFLAGS_UT	= 	-lcriterion --coverage

NAME 		= 	libmy.a

NAME_UT 	= 	unit_tests

all: $(NAME)

$(NAME): $(OBJ)
	@echo -ne "\e[1;32mCompiling library $(NAME)... \e[0m"
	@ar rc $(NAME) $(OBJ)
	@echo -e "\e[1;32mdone\e[0m"

tests_run: $(OBJ) $(OBJ_UT)
	@echo -ne "\e[1;32mCompiling $(NAME_UT) binary... \e[0m"
	@$(CC) -o $(NAME_UT) $(OBJ) $(OBJ_UT) $(LDFLAGS_UT)
	@echo -e "\e[1;32mdone\e[0m"
	@./$(NAME_UT)

clean:
	@echo -ne "\e[1;32mRemoving source object files... \e[0m"
	@rm -f $(OBJ)
	@echo -e "\e[1;32mdone\e[0m"
	@echo -ne "\e[1;32mRemoving unit_tests object files... \e[0m"
	@rm -f $(OBJ_UT)
	@echo -e "\e[1;32mdone\e[0m"

fclean: clean
	@echo -ne "\e[1;32mRemoving $(NAME) binary... \e[0m"
	@rm -f $(NAME)
	@echo -e "\e[1;32mdone\e[0m"
	@echo -ne "\e[1;32mRemoving $(NAME_UT) binary... \e[0m"
	@rm -f $(NAME_UT)
	@echo -e "\e[1;32mdone\e[0m"

re: fclean all
