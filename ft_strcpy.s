section .text
global ft_strcpy
ft_strcpy:
	mov rdx, 0;
loop:
	cmp BYTE[rsi + rdx], 0  ;
	je exit                 ;
	mov cl, [rsi + rdx]		;
	mov BYTE[rdi + rdx], cl	;
	inc rdx					;
	jmp loop				;
exit:
	mov BYTE[rdi + rdx], 0	;
	mov rax, rdi			;
	ret						;