global ft_write							;   (size_t `rax`)write(int fd`rdi`, const void *buf`rsi`, size_t count`rdx`)
section .text							;
extern __errno_location					;

ft_write:
	mov rax,  1							; charge syscall 1 (write)
	syscall                     		; call le syscall charge dans rax
	cmp rax, 0							; verifie si le retour n'est pas negatif 
	jl syscall_error_handler	  		; si retour negatif go syscall_error_handler
	ret									;	
										;
syscall_error_handler:
	neg rax								; negatifie le rax;
	push rax							; push lla valeur de retour
	call __errno_location wrt ..plt		; Obtenir l'adresse de errno
	pop qword[rax]                   	; Stocker la valeur de l'erreur (64 bits) dans errno sur 32 c'est [eax], eax
	mov rax, -1							; Retourner -1 pour indiquer l'erreur
	ret