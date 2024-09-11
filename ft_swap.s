section .text
    global ft_swap;
ft_swap:
    ; Save the original values pointed to by a and b
    mov ecx, [rdi +4    ]        ; Load value pointed to by a
    mov edx, [rsi    ]   ; Load value pointed to by b

    ; Store the swapped values back to their original locations
    mov [rdi], edx           ; Store rbx (swapped value from b) at a
    mov [rsi], ecx           ; Store rax (swapped value from a) at b

    ret