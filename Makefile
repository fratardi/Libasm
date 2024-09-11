# Nom de la librairie
NAME = libasm.a

# Fichiers assembleur
ASM_FILES = ft_strcpy.asm ft_strlen.asm  ft_strcmp.asm ft_write.asm ft_read.asm ft_strdup.asm

# Fichiers objets
OBJ_FILES = $(ASM_FILES:.asm=.o)

# Flags NASM
NASM_FLAGS = -f elf64

# Programme de test
TEST_PROGRAM = main

# Règle pour créer la librairie statique
$(NAME): $(OBJ_FILES)
	ar rcs $(NAME) $(OBJ_FILES)

# Règle pour compiler chaque fichier asm en fichier objet
%.o: %.asm
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
