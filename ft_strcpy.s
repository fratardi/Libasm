section .text
    global ft_strcpy

ft_strcpy:
    ; rdi: pointeur vers la destination (char *dest)
    ; rsi: pointeur vers la source (const char *src)
    mov rax, rdi        ; sauvegarder l'adresse de destination dans rax

copy_loop:
    mov al, [rsi]       ; charger le byte pointé par rsi dans al
    mov [rdi], al       ; copier ce byte à l'adresse pointée par rdi
    test al, al         ; tester si al est nul (fin de chaîne)
    jz copy_end         ; si c'est nul, sortir de la boucle
    inc rsi             ; avancer le pointeur source
    inc rdi             ; avancer le pointeur destination
    jmp copy_loop       ; continuer la boucle

copy_end:
    ret                 ; retourner l'adresse de destination initiale (rax)
