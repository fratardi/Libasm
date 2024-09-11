section .text
    global ft_read

ft_read:
    mov rax, 0; Zero etant la valeur du syscall read
    syscall;    Appele le syscall charge dans rax 
    ret;