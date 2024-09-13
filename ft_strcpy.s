section .text
global ft_strcpy
ft_strcpy:
	mov rdx, 0				; initialisation de l'index		
loop:
	cmp BYTE[rsi + rdx], 0  ; check si l'adresse pointee src + index contient un element 0 
	je exit                 ; si c'est 0 jump equal  a la sortie 
	mov cl, [rsi + rdx]		; charge le caractere pointe par *src + rdx dans cl;
	mov BYTE[rdi + rdx], cl	; charge le caractere charge dans cl dans  *dest + rdx
	inc rdx					; incremente rdx
	jmp loop				; retourne en debut de boucle
exit:
	mov BYTE[rdi + rdx], 0	; ajoute le \0 dans la fin de la string dest 
	mov rax, rdi			; charge le pointeur initial  dest dans rax 
	ret						; retourne le pointeur 