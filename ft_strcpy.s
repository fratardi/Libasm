section .text
    global ft_strcpy ; (void `rax`) ft_strcpy(char *dest`rdi`, char *src`rsi`) 
ft_strcpy:
    mov rax, rdi        ; sauvegarder l'adresse de destination dans rax
    xor rdx , rdx ;
copy_loop:
    cmp BYTE [rsi + rdx], 0  ; 
    je copy_end         ;
;       ; charger le byte pointe par rsi dans al  (partie basse de rax )veux dire adresse pointeur
;     mov QWORD[rdi + rdx ], QWORD[rsi + rdx]       ; copier ce byte à l'adresse pointee par rdi
;            ; tester si al est nul (fin de chaîne)
;   si  c'est nul, sortir de la boucle avec le jum zro si flag = 0 
;     inc rdx             ; avancer le pointeur destination
;     jmp copy_loop       ; continuer la boucle

copy_end:
    ret                 ; retourner l'adresse de destination initiale (rax)
