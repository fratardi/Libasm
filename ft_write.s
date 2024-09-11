section .text
    global ft_write

ft_write:
    mov rax,  1;  size_t write(int fd`rdi`, const void *buf`rsi`, size_t count)`rdx`
    syscall;
    ret;