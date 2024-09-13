global ft_write							;   (size_t `rax`)write(int fd`rdi`, const void *buf`rsi`, size_t count`rdx`)
section .text							;
extern __errno_location					;

ft_write:
	mov rax,  1							;
	syscall                     		;
	cmp rax, 0							; 
	jl syscall_error_handling    		;
	ret									;	
										;
syscall_error_handling:
	neg rax								;
	push rax							;
	call __errno_location wrt ..plt		; Obtenir l'adresse de errno
	pop qword[rax]                   	; Stocker la valeur de l'erreur (64 bits) dans errno sur 32 c'est [eax], eax
	mov rax, -1							; Retourner -1 pour indiquer l'erreur
	ret