### 1. **Instructions de transfert de donnees**

Ces instructions deplacent des donnees entre les registres, la memoire et les constantes immediates.

- **`mov`** : Deplace des donnees d'une source vers une destination.
  ```asm
  mov rax, rbx     ; rax = rbx
  mov [rax], rbx   ; deplace la valeur de rbx vers l'adresse pointee par rax
  mov rax, 10      ; rax = 10
  ```
- **`push`** : Empile une valeur sur la pile.
  ```asm
  push rax         ; empile rax sur la pile
  ```
- **`pop`** : Depile une valeur de la pile.
  ```asm
  pop rbx          ; depile la valeur au sommet de la pile dans rbx
  ```
- **`lea`** : Charge l'adresse effective d'une expression memoire dans un registre.
  ```asm
  lea rax, [rbx+8] ; rax = adresse effective de rbx + 8
  ```

### 2. **Instructions arithmetiques**

Ces instructions effectuent des operations mathematiques.

- **`add`** : Additionne deux operandes.
  ```asm
  add rax, rbx     ; rax += rbx
  ```
- **`sub`** : Soustrait un operande d'un autre.
  ```asm
  sub rax, 10      ; rax -= 10
  ```
- **`mul`** : Multiplie les registres (multiplication non signee).
  ```asm
  mul rbx          ; rdx:rax = rax * rbx
  ```
- **`imul`** : Multiplie les registres (multiplication signee).
  ```asm
  imul rbx         ; rdx:rax = rax * rbx (signe)
  ```
- **`div`** : Divise rax par l'operande specifie (division non signee).
  ```asm
  div rbx          ; rax = rax / rbx, rdx = rax % rbx
  ```
- **`idiv`** : Divise rax par l'operande specifie (division signee).
  ```asm
  idiv rbx         ; rax = rax / rbx (signe), rdx = rax % rbx
  ```

### 3. **Instructions logiques**

Ces instructions permettent de manipuler des bits.

- **`and`** : Effectue un ET logique bit a bit.
  ```asm
  and rax, rbx     ; rax &= rbx
  ```
- **`or`** : Effectue un OU logique bit a bit.
  ```asm
  or rax, rbx      ; rax |= rbx
  ```
- **`xor`** : Effectue un OU exclusif logique bit a bit.
  ```asm
  xor rax, rax     ; rax = 0 (efficace pour mettre a zero un registre)
  ```
- **`not`** : Inverse tous les bits.
  ```asm
  not rax          ; rax = ~rax
  ```
- **`shl`** / **`sal`** : Decale les bits vers la gauche (equivalent a une multiplication par 2).
  ```asm
  shl rax, 1       ; rax <<= 1
  ```
- **`shr`** : Decale les bits vers la droite (division sans signe).
  ```asm
  shr rax, 1       ; rax >>= 1
  ```
- **`sar`** : Decale les bits vers la droite (division avec signe).
  ```asm
  sar rax, 1       ; rax >>= 1 (avec signe)
  ```

### 4. **Instructions de comparaison**

Ces instructions comparent deux valeurs.

- **`cmp`** : Compare deux valeurs.
  ```asm
  cmp rax, rbx     ; compare rax et rbx   si egal flag 1 sinon flag 0 
  ```
- **`test`** : Effectue un `AND` logique et met a jour les drapeaux sans stocker le resultat.
  ```asm
  test rax, rax    ; verifie si rax est zero
  ```

### 5. **Instructions de contrôle de flux**

Ces instructions contrôlent l'execution du programme, comme les sauts conditionnels et inconditionnels.

- **`jmp`** : Saut inconditionnel vers une autre instruction.
  ```asm
  jmp label        ; saute a l'etiquette "label"
  ```
- **`je`** / **`jz`** : Saut si egalite / zero.
  ```asm
  je label         ; saute a "label" si la derniere comparaison etait egale
  ```
- **`jne`** / **`jnz`** : Saut si non egal / non zero.
  ```asm
  jne label        ; saute a "label" si la derniere comparaison n'etait pas egale
  ```
- **`jg`** / **`jnle`** : Saut si superieur (signe).
  ```asm
  jg label         ; saute a "label" si la valeur est superieure (signe)
  ```
- **`jl`** / **`jnge`** : Saut si inferieur (signe).
  ```asm
  jl label         ; saute a "label" si la valeur est inferieure (signe)
  ```

- **`js`** : jump sign si neg (SF) Flag
```asm
  js label
  (signe)
```

- **`call`** : Appel de fonction.
  ```asm
  call function    ; appel de la fonction "function"
  ```
- **`ret`** : Retourne d'une fonction.
  ```asm
  ret              ; retourne a l'appelant
  ```

### 6. **Instructions de gestion de la pile**

Ces instructions manipulent la pile pour sauvegarder et restaurer des contextes.

- **`push`** : Empile une valeur sur la pile.
  ```asm
  push rax         ; empile rax sur la pile
  ```
- **`pop`** : Depile une valeur de la pile.
  ```asm
  pop rbx          ; depile la valeur au sommet de la pile dans rbx
  ```
- **`pushf`** : Empile le registre des drapeaux sur la pile.
  ```asm
  pushf            ; empile les drapeaux EFLAGS sur la pile
  ```
- **`popf`** : Depile le registre des drapeaux depuis la pile.
  ```asm
  popf             ; restaure les drapeaux EFLAGS depuis la pile
  ```

### 7. **Instructions specifiques au systeme**

Ces instructions interagissent avec le systeme d'exploitation ou le materiel.

- **`syscall`** : Execute un appel systeme (Linux).
  ```asm
  mov rax, 1       ; numero du syscall pour write
  mov rdi, 1       ; file descriptor 1 (stdout) dans le premier parametre
  mov rsi, msg     ; pointeur vers le message
  mov rdx, len     ; longueur du message
  syscall          ; executer le syscall
  ```
- **`int 0x80`** : Execute une interruption systeme (methode plus ancienne que `syscall`).
  ```asm
  int 0x80         ; executer un appel systeme (Linux) interrupt 
  ```

### 8. **Instructions speciales**

Ces instructions incluent des operations de manipulation de bits ou des commandes de synchronisation pour les processeurs multicœurs.

- **`nop`** : Aucune operation, passe simplement a l'instruction suivante.
  ```asm
  nop              ; ne fait rien
  ```
- **`hlt`** : Arrête le processeur jusqu'a la prochaine interruption.
  ```asm
  hlt              ; arrête le processeur
  ```
##  Charger syscall et lancer  
  mov rax, 1; 1 etant la valeur du syscall write
  syscall; 

  size_t write(int fd`rdi`, const void *buf`rsi`, size_t count)`rdx`;


## Erreurs  

qword 64
```
    call ___errno_location   ; Obtenir l'adresse de errno
    mov qword [rax], rax     ; Stocker la valeur de l'erreur (64 bits) dans errno
    mov rax, -1              ; Retourner -1 pour indiquer l'erreur
```

word 16
```
    call ___errno_location   ; Obtenir l'adresse de errno
    mov word [rax], ax    ; Écrire 16 bits dans [rax]
    mov rax, -1              ; Retourner -1 pour indiquer l'erreur
```
byte 8
```
    call ___errno_location   ; Obtenir l'adresse de errno
    mov byte [rax], al    ; Écrire 8 bits dans [rax]
    mov rax, -1              ; Retourner -1 pour indiquer l'erreur
```

## Conventions d'Appel des Fonctions et arguments

En x86_64, les arguments des fonctions sont passes via des registres selon les conventions suivantes :

1. **Premier argument** : `rdi` 
2. **Deuxieme argument** : `rsi`
3. **Troisieme argument** : `rdx`
4. **Quatrieme argument** : `rcx`
5. **Cinquieme argument** : `r8`
6. **Sixieme argument** : `r9`
7. **Valeur de retour et syscall** : `rax` 


## Registres Generaux

Les registres generaux en x86_64 sont utilises pour stocker des donnees, des adresses, ou des resultats d'operations. Voici une description des principaux registres :

### Registres 64 bits

- **`rax`** : Accumulateur principal utilise pour les operations arithmetiques, de multiplication, et de division.
- **`rbx`** : Utilise souvent pour stocker des pointeurs ou des adresses.
- **`rcx`** : Utilise comme compteur pour les boucles et les operations repetitives.
- **`rdx`** : Utilise avec `rax` pour les operations arithmetiques necessitant deux registres, comme les multiplications et les divisions.
- **`rsi`** : Source Index pour les operations de copie de donnees ou d'autres manipulations de chaine.
- **`rdi`** : Destination Index pour les operations de copie de donnees ou d'autres manipulations de chaine.
- **`rbp`** : Base Pointer, generalement utilise pour pointer vers le debut du cadre de pile d'une fonction.
- **`rsp`** : Stack Pointer, pointe vers le sommet de la pile. Utilise pour gerer les appels de fonctions et la pile en general.
- **`r8` a `r15`** : Registres supplementaires pour stocker des donnees ou des adresses.




### Registres 32 bits

Chaque registre 64 bits a une version 32 bits :
- **`eax`** : Represente les 32 bits inferieurs de `rax`.
- **`ebx`** : Represente les 32 bits inferieurs de `rbx`.
- **`ecx`** : Represente les 32 bits inferieurs de `rcx`.
- **`edx`** : Represente les 32 bits inferieurs de `rdx`.
- **`esi`** : Represente les 32 bits inferieurs de `rsi`.
- **`edi`** : Represente les 32 bits inferieurs de `rdi`.
- **`ebp`** : Represente les 32 bits inferieurs de `rbp`.
- **`esp`** : Represente les 32 bits inferieurs de `rsp`.

### Registres 16 bits et 8 bits

Les registres 32 bits peuvent être subdivises en registres de 16 bits et 8 bits :
- **`ax`** : Represente les 16 bits inferieurs de `eax`.
- **`al`** : Represente les 8 bits les plus bas de `ax`.
- **`ah`** : Represente les 8 bits les plus eleves de `ax`.


Le resultat d'une fonction est generalement retourne dans le registre `rax` (ou `eax` pour les entiers 32 bits).












Les registres `rax` et `eax` en x86_64 sont effectivement lies, mais ils ne sont pas physiquement separes dans la memoire ; ils representent simplement differentes parties du même registre physique.

### Relation entre `rax`, `eax`, `ax`, et `al`

- **`rax` (64 bits)** : C'est le registre de 64 bits utilise pour les operations arithmetiques, de multiplication, et de division. 
- **`eax` (32 bits)** : C'est la partie basse de `rax`, c'est-a-dire les 32 bits les plus bas. Lorsqu'on manipule `eax`, cela affecte les 32 bits les plus bas de `rax`, mais laisse les bits superieurs intacts.
- **`ax` (16 bits)** : C'est la partie basse de `eax`, c'est-a-dire les 16 bits les plus bas. Manipuler `ax` affecte les 16 bits les plus bas de `eax` et par consequent les bits les plus bas de `rax`.
- **`al` (8 bits)** : C'est la partie basse de `ax`, donc les 8 bits les plus bas. Manipuler `al` affecte les 8 bits les plus bas de `ax`, ce qui a egalement un effet sur `rax`.

### Illustration

<img src="https://flint.cs.yale.edu/cs421/papers/x86-asm/x86-registers.png" alt="drawing" width="500"/>

### ici l'image est en 32 bits, rajouter le r a la place du  e  pour le 64 bits

### Comment Cela Fonctionne

  - Le registre `rax` est un registre de 64 bits qui est compose de plusieurs parties : 
  - Les 8 bits les plus bas de `rax` sont `al`.
  - Les 16 bits les plus bas de `rax` sont `ax`.
  - Les 32 bits les plus bas de `rax` sont `eax`.
  - Les 64 bits de `rax` incluent toutes les parties precedentes.

Cela signifie que :
- **`rax`** est le registre complet.
- **`eax`** est le registre de 32 bits situe dans les 32 bits les plus bas de `rax`.
- **`ax`** est le registre de 16 bits situe dans les 16 bits les plus bas de `eax`.
- **`al`** est le registre de 8 bits situe dans les 8 bits les plus bas de `ax`.



Quand on manipule un registre plus petit (`eax`, `ax`, `al`), les parties superieures du registre plus grand (`rax`) restent inchangees.

### Exemple manipulaion 

Si vous faites l'operation suivante en assembleur :

```asm
mov eax, 0x12345678   ; met 0x12345678 dans eax
mov al, 0xAB          ; met 0xAB dans al
```

- `eax` va contenir `0x123456AB`, car `al` a ecrase les 8 bits les plus bas de `eax`.
- `rax` va contenir `0x000000000123456AB`, les parties superieures de `rax` restent inchangees, mais les 32 bits les plus bas ont ete modifies par `eax`.

```
mov al, 0xEE 
mov ah, 0xBB
```
-- `rax` va ressembler a `0x0000000001234BBEE`
--`rax` 

### Conclusion

Les registres `rax`, `eax`, `ax`, et `al` sont tous des vues differentes sur le même registre physique de 64 bits. Modifier l'un affecte les parties appropriees de ce registre en fonction de la taille du sous-registre. Ils ne sont pas physiquement separes ; c'est une question de comment le processeur interprete et utilise les bits dans le registre.

## Exemple de Fonction d'Addition

Voici un exemple de fonction en assembleur qui additionne deux entiers et retourne le resultat :

```asm
section .text
    global add_two_integers

add_two_integers:
    ; Arguments :
    ; edi - premier entier (int)
    ; esi - deuxieme entier (int)

    ; Effectuer l'addition
    mov eax, edi       ; Charger le premier entier (32 bits) dans eax
    add eax, esi       ; Ajouter le deuxieme entier (32 bits) a eax

    ; Le resultat est maintenant dans eax
    ret                ; Retourner le resultat (int)
```
https://imada.sdu.dk/u/kslarsen/dm546/Material/IntelnATT.htm

## References

- [Documentation NASM](https://www.nasm.us/xdoc/2.16.03/html/nasmdoc0.html)
- [Intel x86-64 Architecture Programmer’s Manual](https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html)

- [Diff AT&T Intel](https://imada.sdu.dk/u/kslarsen/dm546/Material/IntelnATT.htm)
- [x64 Cheatsheet](https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf)


---

Ce README fournit une vue d'ensemble des registres utilises en x86_64 et des conventions d'appel des fonctions, ainsi qu'un exemple simple de fonction en assembleur.