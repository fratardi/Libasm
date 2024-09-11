section .text
    global ft_read ; (size_t `rax`)ft_read(int fd`rdi`, void*buf `rsi` , size_t count `rdx`)
ft_read:
    mov rax, 0; Charge la valeur du syscall read  dans rax size_t read(int fd `rdi`, const void *buf`rsi`, size_t count)`rdx`;
    syscall;    Appele le syscall charge dans rax 
    ret;