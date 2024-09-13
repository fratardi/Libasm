global ft_read;
section .text
extern __errno_location;				; (size_t `rax`)ft_read(int fd`rdi`, void*buf `rsi` , size_t count `rdx`)

ft_read:
    mov rax, 0							; Charge la valeur du syscall read  dans rax size_t read(int fd `rdi`, const void *buf`rsi`, size_t count)`rdx`;
    syscall								; Appele le syscall charge dans rax
	cmp rax, 0							; si le flag est different de zero
	jl syscall_error_handler    		; si flag negatif jump less 
	ret									;

syscall_error_handler:
	neg rax								; negatifie rax 		
	push rax							; push le rax
	call __errno_location wrt ..plt		; Obtenir l'adresse de errno wrt ..plt pour regler les pb de linkage sans pie  
	pop qword [rax]                   	; Stocker la valeur de l'erreur (64 bits) dans errno sur 32 c'est [eax], eax
	mov rax, -1							; Retourner -1 pour indiquer l'erreur
	ret									;