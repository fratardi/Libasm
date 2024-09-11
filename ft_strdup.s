section .text
    global ft_strdup
    extern malloc
    extern ft_strlen  ; S'assurer que ft_strlen est accessible

ft_strdup:
    push rdi          ; Sauvegarder RDI qui contient le pointeur de la chaîne source

    ; Appeler ft_strlen pour obtenir la longueur de la chaîne source
    call ft_strlen    ; La chaîne source est déjà dans RDI le retour de ft_strlen va dans rax
    mov rcx, rax      ; RCX = longueur de la chaîne retournée par ft_strlen pour reutiliser rax

    ; Allouer de la mémoire pour la nouvelle chaîne (+1 pour le caractère nul)
    inc rcx           ; RCX = RCX + 1
    mov rdi, rcx      ; RDI = nouvelle taille pour malloc
    call malloc       ; Allouer de la mémoire avec comme remier parametre rdi
    test rax, rax     ; Vérifier si malloc a réussi rax etant la valeur de retour du malloc
    jz malloc_fail    ; Aller à malloc_fail si RAX est NULL (Flag de retour de test)

    ; RAX contient maintenant le pointeur vers la nouvelle mémoire
    mov rdi, rax      ; RDI = pointeur de destination (nouvelle mémoire)
    pop rsi           ; RSI = restaurer le pointeur de la chaîne source
    xor rcx, rcx      ; RCX = 0, réinitialiser le compteur pour la boucle de copie

copy_loop:
    mov al, [rsi + rcx] ; Charger un caractère de la source a l'adresse pointeur [rsi + le compteur rcx]
    mov [rdi + rcx], al ; Écrire le caractère dans la destination
    inc rcx             ; Incrémenter l'index de caractère
    test al, al         ; Vérifier si le caractère est le caractère nul
    jnz copy_loop       ; Continuer tant que le caractère n'est pas nul jump not zero
						; Finir et retourner le nouveau pointeur
    mov rax, rdi      	; RAX = pointeur vers la nouvelle chaîne
    ret               	; Retourner avec le nouveau pointeur (rax)

malloc_fail:	
    xor rax, rax      	; Retourner NULL en cas d'échec de malloc
    pop rsi           	; Nettoyer la pile (restaurer RSI)
    ret               	; Retourner rax qui est egal a zero
