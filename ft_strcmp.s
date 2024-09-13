section .text
global ft_strcmp        	; (int rax)ft_strcmp(char *s1 `rdi`, char *s2 `rsi`)
ft_strcmp:
	 xor rax, rax           ; RAX sert d'index pour les caracteres des chaînes init rax a 0
loop:
	mov cl, BYTE[rdi]    	; Charge le caractere courant de la premiere chaine rdi dans dl (partie basse de rdx) rdx64  edx 32 dx 16  dh 8 dl 8
	mov dl, BYTE[rsi]     	; Charge le caractere courant de la seconde chaîne rsi dans dh
	cmp cl, dl              ; Compare les deux caracteres charges dans  cl(s1*) et dl(s2*)
	jne flagchecker         ; regarde le cmp et jump not equal  Si les caracteres sont differents, aller a realreturn
	cmp cl , 0				; check si le caractere de s1 est egal a 0 					
	je equal;				; check flag equal et jump equal si fin de string sans pb
	inc rdi;				; incremente pointeur s1
	inc rsi;               	; incremente pointeur s2   
	jmp loop                ; Continue la boucle
flagchecker:				; check les flags en fonction du cmp ligne 8
	jl less					; jump less  label less
	jg greater				; jump greater label greater				
	je equal				; jump equal laisse ici mais peut ne pas etre necessaie car jump est si not equal 				
greater:
	mov rax,1				; met rax a 1 (positif) 
	ret;					; retourne rax
less:
	mov rax, -1				; met rax a -1 (negatif)			
	ret						; retourne rax
equal:
	xor rax, rax            ; Met RAX a zero
	ret                     ; Retourne rax


