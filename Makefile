# Nom de la librairie
NAME = libasm.a

# Fichiers assembleur
ASM_FILES = ft_swap.s ft_strcpy.s ft_strlen.s  ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

# Fichiers objets
OBJ_FILES = $(ASM_FILES:.s=.o)

# Flags NASM • You must write 64 bits ASM. Beware of the "calling convention".
NASM_FLAGS = -f elf64   

# Programme de test
TEST_PROGRAM = main

# Règle pour créer la librairie statique
$(NAME): $(OBJ_FILES)
	ar rcs $(NAME) $(OBJ_FILES)

# Règle pour compiler chaque fichier asm en fichier objet
# You must compile your assembly code with nasm.
%.o: %.s
	nasm $(NASM_FLAGS) $< -o $@

# Règle pour compiler le programme de test
program: $(NAME) main.o
	gcc -no-pie -o $(TEST_PROGRAM) main.o -L. -lasm

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
