section .text
global ft_strcmp

ft_strcmp:
    xor rax, rax            ; RAX sert d'index pour les caracteres des chaînes init rax a 0

something_more:
    nop;                    ; Ne fais rien est n'est pas appele

loop:
    mov dl, [rdi + rax]     ; Charge le caractere courant de la premiere chaine rdi dans dl (partie basse de rdx) rdx64  edx 32 dx 16  dh 8 dl 8 
    mov dh, [rsi + rax]     ; Charge le caractere courant de la seconde chaîne rsi dans dh
    cmp dl, dh              ; Compare les deux caracteres charges dans  dl(s1*) et dh(s2*) 
    jne realreturn          ;regarde le cmp et jump not equal  Si les caracteres sont differents, aller a realreturn
    test dl, dl             ; test fais un and  et set le flag a ZF (zero flag)     Verifie si le caractere est le caractere nul (fin de chaîne)
    je ret_zero             ; Si flag = ZF (0)  jump a ret zero label   
    inc rax                 ; Incremente l'index pour passer au caractere suivant
    jmp loop                ; Continue la boucle

realreturn: 
    sub dl, dh              ; Soustrait le caractere de la seconde chaîne du caractere de la premiere chaîne
    movsx rax, dl           ; etend le resultat a la taille de RAX avec signe
    ret                     ; Retourne rax

ret_zero:
    xor rax, rax            ; Met RAX a zero
    ret                     ; Retourne rax
