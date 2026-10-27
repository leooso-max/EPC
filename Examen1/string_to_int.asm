section .text
    global string_to_int

section .text

string_to_int:
    push ebp
    mov ebp, esp
    sub esp, 8 ; Reservar memoria para el signo y el numero
    push esi ; esi = cadena

    mov esi, [ebp+8] ; esi = str
    mov dword [ebp-4], 1 ; signo = 1 
    mov dword [ebp-8], 0 ; numero = 0

    cmp byte [esi], '-' ; Compara si el número es negativo
    jge .for ; Salta si no son iguales
    mov dword [ebp-4], -1
    inc esi

.for:
    movzx eax, byte [esi]
    cmp al, 10 ; Compara si el ultimo caracter es el fin de la cadena (\n)
    je .fin

    sub eax, '0'
    mov ecx, [ebp-8]
    imul ecx, ecx, 10
    add ecx, eax
    mov [ebp-8], ecx
    inc esi
    jmp .for

.fin:
    mov eax, [ebp-8] ; Guardamos el número en el eax
    imul eax, [ebp-4] ; Aplica el signo si es negativo
    pop esi
    mov esp, ebp
    pop ebp
    ret