section .text
    global ft_swap; (void `rax` )ft_swap (int *a `rdi`, int *b`rsi`)
ft_swap:
    mov ecx, [rdi]   ; charge le contenu du pointeur rdi dans ecx
    mov edx, [rsi]   ; charge le contenu du pointeur rsi dans edx
    mov [rsi], ecx   ; charge ecx a l'adresse du pointeur rsi
    mov [rdi], edx   ; charge edx a l'adresse du pointeur rdi
    ret