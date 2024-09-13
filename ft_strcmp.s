section .text
	global ft_strcmp        ; (int rax)ft_strcmp(char *s1 `rdi`, char *s2 `rsi`)
ft_strcmp:
	 xor rax, rax           ; RAX sert d'index pour les caracteres des chaînes init rax a 0
loop:
	mov cl, BYTE[rdi]    	; Charge le caractere courant de la premiere chaine rdi dans dl (partie basse de rdx) rdx64  edx 32 dx 16  dh 8 dl 8
	mov dl, BYTE[rsi]     	; Charge le caractere courant de la seconde chaîne rsi dans dh
	cmp cl, dl              ; Compare les deux caracteres charges dans  dl(s1*) et dh(s2*)
	jne condreturn          	;regarde le cmp et jump not equal  Si les caracteres sont differents, aller a realreturn
	cmp cl , 0;
	je equal;
	inc rdi;
	inc rsi;               	; Incremente l'index pour passer au caractere suivant
	jmp loop                ; Continue la boucle
condreturn:
	jl less; 
	jg greater;
	je equal;
greater:
	mov rax,1; 
	ret;
less:
	mov rax, -1;
	ret;
equal:
	xor rax, rax            ; Met RAX a zero
	ret                     ; Retourne rax


