section .text
    global ft_read ; (size_t `rax`)ft_read(int fd`rdi`, void*buf `rsi` , size_t count `rdx`)
    extern ___errno_location;
ft_read:
    mov rax, 0; Charge la valeur du syscall read  dans rax size_t read(int fd `rdi`, const void *buf`rsi`, size_t count)`rdx`;
    syscall;    Appele le syscall charge dans rax
    js syscall_error_handling
    ret;
syscall_error_handling:
    call ___errno_location   ; Obtenir l'adresse de errno
    mov qword [rax], rax     ; Stocker la valeur de l'erreur (64 bits) dans errno
    mov rax, -1              ; Retourner -1 pour indiquer l'erreur
    ret