section .text
    global ft_strdup; (char* `rax`)ft_strdup(char *str `rdi`) 
    extern malloc       ;
    extern ft_strlen    ; S'assurer que ft_strlen est accessible

ft_strdup:
    push rdi          ; Sauvegarder RDI qui contient le pointeur de la chaine source
    ; Appeler ft_strlen pour obtenir la longueur de la chaine source
    call ft_strlen    ; La chaine source est dejà dans RDI le retour de ft_strlen va dans rax
    mov rcx, rax      ; RCX = longueur de la chaine retournee par ft_strlen pour reutiliser rax

    ; Allouer de la memoire pour la nouvelle chaine (+1 pour le caractere nul)
    inc rcx           ; RCX = RCX + 1
    mov rdi, rcx      ; RDI = nouvelle taille pour malloc
    call malloc  wrt ..plt     ; Allouer de la memoire avec comme remier parametre rdi
    test rax, rax     ; Verifier si malloc a reussi rax etant la valeur de retour du malloc
    jz malloc_fail    ; Aller à malloc_fail si RAX est NULL (Flag de retour de test)
    ; RAX contient maintenant le pointeur vers la nouvelle memoire
    mov rdi, rax      ; RDI = pointeur de destination (nouvelle memoire)
    pop rsi           ; RSI = restaurer le pointeur de la chaine source
    xor rcx, rcx      ; RCX = 0, reinitialiser le compteur pour la boucle de copie

copy_loop:
    mov al, [rsi + rcx] ; Charger un caractere de la source a l'adresse pointeur [rsi + le compteur rcx]
    mov [rdi + rcx], al ; ecrire le caractere dans la destination
    inc rcx             ; Incrementer l'index de caractere
    test al, al         ; Verifier si le caractere est le caractere nul
    jnz copy_loop       ; Continuer tant que le caractere n'est pas nul jump not zero
						; Finir et retourner le nouveau pointeur
    mov rax, rdi      	; RAX = pointeur vers la nouvelle chaine
    ret               	; Retourner avec le nouveau pointeur (rax)

malloc_fail:	
    xor rax, rax      	; Retourner NULL en cas d'echec de malloc
    pop rsi           	; Nettoyer la pile (restaurer RSI)
    ret               	; Retourner rax qui est egal a zero
