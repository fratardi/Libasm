section .text
global ft_strcmp

ft_strcmp:
    xor rax, rax            ; RAX sert d'index pour les caractères des chaînes init rax a 0

something_more:
    nop;                    ; Placeholder, n'a pas d'effet pour l'instant

loop:
    mov dl, [rdi + rax]     ; Charge le caractère courant de la première chaîne rdi dans dl
    mov dh, [rsi + rax]     ; Charge le caractère courant de la seconde chaîne rsi dans dh
    cmp dl, dh              ; Compare les deux caractères chargés dans  dl(s1*) et dh(s2*) 
    jne realreturn          ;regarde le cmp et jump not equal  Si les caractères sont différents, aller à realreturn
    test dl, dl             ; test fais un and  et set le flag a ZF (zero flag)     Vérifie si le caractère est le caractère nul (fin de chaîne)
    je ret_zero             ; Si flag = ZF (0)  jump a ret zero label   
    inc rax                 ; Incrémente l'index pour passer au caractère suivant
    jmp loop                ; Continue la boucle

realreturn: 
    sub dl, dh              ; Soustrait le caractère de la seconde chaîne du caractère de la première chaîne
    movsx rax, dl           ; Étend le résultat à la taille de RAX avec signe
    ret                     ; Retourne rax

ret_zero:
    xor rax, rax            ; Met RAX à zéro
    ret                     ; Retourne rax
