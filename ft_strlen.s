section .text
    global ft_strlen

ft_strlen:
    xor rax, rax            ;Initialise   rax a zero  rax etant le compteur et la valeur de retour

loop:
    cmp byte [rdi + rax], 0 ; Compare le caractère actuel à '\0' cmp 
    je done                 ; Check flag de cmp et jump a done si flag egal a true 
    inc rax                 ; incrémente le compteur qui est la valeur de retour
    jmp loop                ; retourne en debut de boucle

done:
    ret                     ; Retourne la valeur de rax