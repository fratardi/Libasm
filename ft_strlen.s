section .text
    global ft_strlen

ft_strlen:
    xor rax, rax;             Initialise   rax a zero  

loop:
    cmp byte [rdi + rax], 0 ; Compare le caractère actuel à '\0' cmp edite
    je done                 ; Check flag de cmp et jump a done si egal
    inc rax                 ; incrémente le compteur
    jmp loop                ;

done:
    ret                     ; Retourne la valeur de rax