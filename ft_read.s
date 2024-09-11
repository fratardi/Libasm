section .text
    global ft_read ; definition de la fonction

ft_read:
    mov rax, 0; Charge la valeur du syscall read  dans rax size_t read(int fd `rdi`, const void *buf`rsi`, size_t count)`rdx`;
    syscall;    Appele le syscall charge dans rax 
    ret;