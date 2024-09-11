section .text
    global ft_strcpy ; (void `rax`) ft_strcpy(char *dest`rdi`, char *src`rsi`) 
ft_strcpy:
    mov rax, rdi        ; sauvegarder l'adresse de destination dans rax
copy_loop:
    mov al, [rsi]       ; charger le byte pointe par rsi dans al  (partie basse de rax )veux dire adresse pointeur
    mov [rdi], al       ; copier ce byte à l'adresse pointee par rdi
    test al, al         ; tester si al est nul (fin de chaîne)
    jz copy_end         ; si  c'est nul, sortir de la boucle avec le jum zro si flag = 0 
    inc rsi             ; avancer le pointeur source
    inc rdi             ; avancer le pointeur destination
    jmp copy_loop       ; continuer la boucle

copy_end:
    ret                 ; retourner l'adresse de destination initiale (rax)
