section .text
    global ft_write;   (size_t `rax`)write(int fd`rdi`, const void *buf`rsi`, size_t count`rdx`)
ft_write:
    mov rax,  1;
    syscall;
    ret;