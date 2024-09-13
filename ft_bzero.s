section .text 
    global ft_bzero; (void `rax`)bzero(void *s`rdi`, size_t n`rsi`);
ft_bzero:
    xor al , al;
    jmp loop;
loop:
   cmp  rsi, 0x8000;
   je   return;
   inc  rdi;
   mov  [rdi], al; 
   dec  rsi
   jmp loop;
return:
        ret;