section .text
    global ft_write;   (size_t `rax`)write(int fd`rdi`, const void *buf`rsi`, size_t count`rdx`)
    extern ___errno_location;
ft_write:
    mov rax,  1;
    syscall;
    js syscall_error_handling;
    ret;
syscall_error_handling:
    call ___errno_location   ; Obtenir l'adresse de errno
    mov qword [rax], rax     ; Stocker la valeur de l'erreur (64 bits) dans errno
    mov rax, -1              ; Retourner -1 pour indiquer l'erreur
    ret