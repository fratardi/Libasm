# LibName
NAME = libasm.a
ASM_FILES = ft_strcpy.s \
			ft_strlen.s \
			ft_strcmp.s \
			ft_write.s 	\
			ft_read.s 	\
			ft_strdup.s \
# Obj filesrule
OBJ_FILES = $(ASM_FILES:.s=.o)
NASM_FLAGS = -f elf64   -g
TEST_PROGRAM = program

# Static lib rule
$(NAME): $(OBJ_FILES)
	ar rcs $(NAME) $(OBJ_FILES)

# nasm .s to .o
%.o: %.s
	nasm $(NASM_FLAGS) $< -o $@

# Test Rule
program: $(NAME) main.o
	gcc -o $(TEST_PROGRAM) main.o -L. -lasm

# Compilation de main.c
main.o: main.c
	gcc -c main.c -o main.o

# Tout compiler
all: $(NAME)

# Nettoyage des fichiers objets
clean:
	rm -f $(OBJ_FILES) main.o

# Nettoyage complet
fclean: clean
	rm -f $(NAME) $(TEST_PROGRAM)

# Recompiler à partir de zéro
re: fclean all

# .PHONY: all clean fclean re program