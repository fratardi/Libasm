L'assembleur, en particulier dans le contexte de l'architecture x86_64, utilise un ensemble d'instructions qui sont des commandes élémentaires directement exécutées par le processeur. Ces instructions permettent de manipuler les registres, d'effectuer des opérations arithmétiques et logiques, de gérer la mémoire, de contrôler le flux d'exécution, et plus encore. Je vais te donner un aperçu des principales catégories d'instructions en assembleur, ainsi que quelques exemples pour chacune.

### 1. **Instructions de transfert de données**

Ces instructions déplacent des données entre les registres, la mémoire et les constantes immédiates.

- **`mov`** : Déplace des données d'une source vers une destination.
  ```asm
  mov rax, rbx     ; rax = rbx
  mov [rax], rbx   ; déplace la valeur de rbx vers l'adresse pointée par rax
  mov rax, 10      ; rax = 10
  ```
- **`push`** : Empile une valeur sur la pile.
  ```asm
  push rax         ; empile rax sur la pile
  ```
- **`pop`** : Dépile une valeur de la pile.
  ```asm
  pop rbx          ; dépile la valeur au sommet de la pile dans rbx
  ```
- **`lea`** : Charge l'adresse effective d'une expression mémoire dans un registre.
  ```asm
  lea rax, [rbx+8] ; rax = adresse effective de rbx + 8
  ```

### 2. **Instructions arithmétiques**

Ces instructions effectuent des opérations mathématiques.

- **`add`** : Additionne deux opérandes.
  ```asm
  add rax, rbx     ; rax += rbx
  ```
- **`sub`** : Soustrait un opérande d'un autre.
  ```asm
  sub rax, 10      ; rax -= 10
  ```
- **`mul`** : Multiplie les registres (multiplication non signée).
  ```asm
  mul rbx          ; rdx:rax = rax * rbx
  ```
- **`imul`** : Multiplie les registres (multiplication signée).
  ```asm
  imul rbx         ; rdx:rax = rax * rbx (signé)
  ```
- **`div`** : Divise rax par l'opérande spécifié (division non signée).
  ```asm
  div rbx          ; rax = rax / rbx, rdx = rax % rbx
  ```
- **`idiv`** : Divise rax par l'opérande spécifié (division signée).
  ```asm
  idiv rbx         ; rax = rax / rbx (signé), rdx = rax % rbx
  ```

### 3. **Instructions logiques**

Ces instructions permettent de manipuler des bits.

- **`and`** : Effectue un ET logique bit à bit.
  ```asm
  and rax, rbx     ; rax &= rbx
  ```
- **`or`** : Effectue un OU logique bit à bit.
  ```asm
  or rax, rbx      ; rax |= rbx
  ```
- **`xor`** : Effectue un OU exclusif logique bit à bit.
  ```asm
  xor rax, rax     ; rax = 0 (efficace pour mettre à zéro un registre)
  ```
- **`not`** : Inverse tous les bits.
  ```asm
  not rax          ; rax = ~rax
  ```
- **`shl`** / **`sal`** : Décale les bits vers la gauche (équivalent à une multiplication par 2).
  ```asm
  shl rax, 1       ; rax <<= 1
  ```
- **`shr`** : Décale les bits vers la droite (division sans signe).
  ```asm
  shr rax, 1       ; rax >>= 1
  ```
- **`sar`** : Décale les bits vers la droite (division avec signe).
  ```asm
  sar rax, 1       ; rax >>= 1 (avec signe)
  ```

### 4. **Instructions de comparaison**

Ces instructions comparent deux valeurs.

- **`cmp`** : Compare deux valeurs.
  ```asm
  cmp rax, rbx     ; compare rax et rbx   si egal flag 1 sinon flag 0 
  ```
- **`test`** : Effectue un `AND` logique et met à jour les drapeaux sans stocker le résultat.
  ```asm
  test rax, rax    ; vérifie si rax est zéro
  ```

### 5. **Instructions de contrôle de flux**

Ces instructions contrôlent l'exécution du programme, comme les sauts conditionnels et inconditionnels.

- **`jmp`** : Saut inconditionnel vers une autre instruction.
  ```asm
  jmp label        ; saute à l'étiquette "label"
  ```
- **`je`** / **`jz`** : Saut si égalité / zéro.
  ```asm
  je label         ; saute à "label" si la dernière comparaison était égale
  ```
- **`jne`** / **`jnz`** : Saut si non égal / non zéro.
  ```asm
  jne label        ; saute à "label" si la dernière comparaison n'était pas égale
  ```
- **`jg`** / **`jnle`** : Saut si supérieur (signé).
  ```asm
  jg label         ; saute à "label" si la valeur est supérieure (signé)
  ```
- **`jl`** / **`jnge`** : Saut si inférieur (signé).
  ```asm
  jl label         ; saute à "label" si la valeur est inférieure (signé)
  ```
- **`call`** : Appel de fonction.
  ```asm
  call function    ; appel de la fonction "function"
  ```
- **`ret`** : Retourne d'une fonction.
  ```asm
  ret              ; retourne à l'appelant
  ```

### 6. **Instructions de gestion de la pile**

Ces instructions manipulent la pile pour sauvegarder et restaurer des contextes.

- **`push`** : Empile une valeur sur la pile.
  ```asm
  push rax         ; empile rax sur la pile
  ```
- **`pop`** : Dépile une valeur de la pile.
  ```asm
  pop rbx          ; dépile la valeur au sommet de la pile dans rbx
  ```
- **`pushf`** : Empile le registre des drapeaux sur la pile.
  ```asm
  pushf            ; empile les drapeaux EFLAGS sur la pile
  ```
- **`popf`** : Dépile le registre des drapeaux depuis la pile.
  ```asm
  popf             ; restaure les drapeaux EFLAGS depuis la pile
  ```

### 7. **Instructions spécifiques au système**

Ces instructions interagissent avec le système d'exploitation ou le matériel.

- **`syscall`** : Exécute un appel système (Linux).
  ```asm
  mov rax, 1       ; numéro du syscall pour write
  mov rdi, 1       ; file descriptor 1 (stdout) dans le premier parametre
  mov rsi, msg     ; pointeur vers le message
  mov rdx, len     ; longueur du message
  syscall          ; exécuter le syscall
  ```
- **`int 0x80`** : Exécute une interruption système (méthode plus ancienne que `syscall`).
  ```asm
  int 0x80         ; exécuter un appel système (Linux) interrupt 
  ```

### 8. **Instructions spéciales**

Ces instructions incluent des opérations de manipulation de bits ou des commandes de synchronisation pour les processeurs multicœurs.

- **`nop`** : Aucune opération, passe simplement à l'instruction suivante.
  ```asm
  nop              ; ne fait rien
  ```
- **`hlt`** : Arrête le processeur jusqu'à la prochaine interruption.
  ```asm
  hlt              ; arrête le processeur
  ```
### 9. **Charger syscall et lancer  
  mov rax, 1; 1 etant la valeur du syscall write
  syscall; 

  size_t write(int fd`rdi`, const void *buf`rsi`, size_t count)`rdx`;

## Registres Généraux

Les registres généraux en x86_64 sont utilisés pour stocker des données, des adresses, ou des résultats d'opérations. Voici une description des principaux registres :

### Registres 64 bits

- **`rax`** : Accumulateur principal utilisé pour les opérations arithmétiques, de multiplication, et de division.
- **`rbx`** : Utilisé souvent pour stocker des pointeurs ou des adresses.
- **`rcx`** : Utilisé comme compteur pour les boucles et les opérations répétitives.
- **`rdx`** : Utilisé avec `rax` pour les opérations arithmétiques nécessitant deux registres, comme les multiplications et les divisions.
- **`rsi`** : Source Index pour les opérations de copie de données ou d'autres manipulations de chaîne.
- **`rdi`** : Destination Index pour les opérations de copie de données ou d'autres manipulations de chaîne.
- **`rbp`** : Base Pointer, généralement utilisé pour pointer vers le début du cadre de pile d'une fonction.
- **`rsp`** : Stack Pointer, pointe vers le sommet de la pile. Utilisé pour gérer les appels de fonctions et la pile en général.
- **`r8` à `r15`** : Registres supplémentaires pour stocker des données ou des adresses.

### Registres 32 bits

Chaque registre 64 bits a une version 32 bits :
- **`eax`** : Représente les 32 bits inférieurs de `rax`.
- **`ebx`** : Représente les 32 bits inférieurs de `rbx`.
- **`ecx`** : Représente les 32 bits inférieurs de `rcx`.
- **`edx`** : Représente les 32 bits inférieurs de `rdx`.
- **`esi`** : Représente les 32 bits inférieurs de `rsi`.
- **`edi`** : Représente les 32 bits inférieurs de `rdi`.
- **`ebp`** : Représente les 32 bits inférieurs de `rbp`.
- **`esp`** : Représente les 32 bits inférieurs de `rsp`.

### Registres 16 bits et 8 bits

Les registres 32 bits peuvent être subdivisés en registres de 16 bits et 8 bits :
- **`ax`** : Représente les 16 bits inférieurs de `eax`.
- **`al`** : Représente les 8 bits les plus bas de `ax`.
- **`ah`** : Représente les 8 bits les plus élevés de `ax`.

## Conventions d'Appel des Fonctions

En x86_64, les arguments des fonctions sont passés via des registres selon les conventions suivantes :

1. **Premier argument** : `rdi` 
2. **Deuxième argument** : `rsi`
3. **Troisième argument** : `rdx`
4. **Quatrième argument** : `rcx`
5. **Cinquième argument** : `r8`
6. **Sixième argument** : `r9`
7. **Valeur de retour et syscall** : `rax` 

Le résultat d'une fonction est généralement retourné dans le registre `rax` (ou `eax` pour les entiers 32 bits).












Les registres `rax` et `eax` en x86_64 sont effectivement liés, mais ils ne sont pas physiquement séparés dans la mémoire ; ils représentent simplement différentes parties du même registre physique.

### Relation entre `rax`, `eax`, `ax`, et `al`

- **`rax` (64 bits)** : C'est le registre de 64 bits utilisé pour les opérations arithmétiques, de multiplication, et de division. 
- **`eax` (32 bits)** : C'est la partie basse de `rax`, c'est-à-dire les 32 bits les plus bas. Lorsqu'on manipule `eax`, cela affecte les 32 bits les plus bas de `rax`, mais laisse les bits supérieurs intacts.
- **`ax` (16 bits)** : C'est la partie basse de `eax`, c'est-à-dire les 16 bits les plus bas. Manipuler `ax` affecte les 16 bits les plus bas de `eax` et par conséquent les bits les plus bas de `rax`.
- **`al` (8 bits)** : C'est la partie basse de `ax`, donc les 8 bits les plus bas. Manipuler `al` affecte les 8 bits les plus bas de `ax`, ce qui a également un effet sur `rax`.

### Comment Cela Fonctionne

En termes de registre physique :
- Le registre `rax` est un registre de 64 bits qui est composé de plusieurs parties : 
  - Les 8 bits les plus bas de `rax` sont `al`.
  - Les 16 bits les plus bas de `rax` sont `ax`.
  - Les 32 bits les plus bas de `rax` sont `eax`.
  - Les 64 bits de `rax` incluent toutes les parties précédentes.

Cela signifie que :
- **`rax`** est le registre complet.
- **`eax`** est le registre de 32 bits situé dans les 32 bits les plus bas de `rax`.
- **`ax`** est le registre de 16 bits situé dans les 16 bits les plus bas de `eax`.
- **`al`** est le registre de 8 bits situé dans les 8 bits les plus bas de `ax`.

### Illustration

Voici une vue simplifiée des registres :

```
64 bits (rax) = |   32 bits (eax) = |   16 bits (ax) = |   8 bits (al)  |
  [   31 bits   ][  15 bits  ][  7 bits   ][  7 bits ]
```

Quand on manipule un registre plus petit (`eax`, `ax`, `al`), les parties supérieures du registre plus grand (`rax`) restent inchangées.

### Exemple Pratique

Si vous faites l'opération suivante en assembleur :

```asm
mov eax, 0x12345678   ; met 0x12345678 dans eax
mov al, 0xAB          ; met 0xAB dans al
```

- `eax` va contenir `0x123456AB`, car `al` a écrasé les 8 bits les plus bas de `eax`.
- `rax` va contenir `0x000000000123456AB`, les parties supérieures de `rax` restent inchangées, mais les 32 bits les plus bas ont été modifiés par `eax`.

### Conclusion

Les registres `rax`, `eax`, `ax`, et `al` sont tous des vues différentes sur le même registre physique de 64 bits. Modifier l'un affecte les parties appropriées de ce registre en fonction de la taille du sous-registre. Ils ne sont pas physiquement séparés ; c'est une question de comment le processeur interprète et utilise les bits dans le registre.

## Exemple de Fonction d'Addition

Voici un exemple de fonction en assembleur qui additionne deux entiers et retourne le résultat :

```asm
section .text
    global add_two_integers

add_two_integers:
    ; Arguments :
    ; edi - premier entier (int)
    ; esi - deuxième entier (int)

    ; Effectuer l'addition
    mov eax, edi       ; Charger le premier entier (32 bits) dans eax
    add eax, esi       ; Ajouter le deuxième entier (32 bits) à eax

    ; Le résultat est maintenant dans eax
    ret                ; Retourner le résultat (int)
```
https://imada.sdu.dk/u/kslarsen/dm546/Material/IntelnATT.htm

## Références

- [Documentation NASM](https://www.nasm.us/xdoc/2.16.03/html/nasmdoc0.html)
- [Intel x86-64 Architecture Programmer’s Manual](https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html)

- [Diff AT&T Intel](https://imada.sdu.dk/u/kslarsen/dm546/Material/IntelnATT.htm)
- [x64 Cheatsheet](https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf)


---

Ce README fournit une vue d'ensemble des registres utilisés en x86_64 et des conventions d'appel des fonctions, ainsi qu'un exemple simple de fonction en assembleur.