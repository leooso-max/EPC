section .text
    global remove_point

; La función recibe 1 parametro, el cual es:
; la dirección de memoria donde esta la cadena ingresa por el usuario

remove_point:
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov esi, [ebp+8] ; esi = lectura
    mov edi, esi ; edi = escritura sobre la misma cadena

.while:
    mov la, [esi]
    cmp la, '.'
    jne .copiar_numero
    mov edx, 1
    inc esi
    jmp .while

.copiar_numero:
    mov [edi], al
    inc edi
    cmp al, 10
    je .fin
    cmp al, 0
    je .fin
    add ecx, edx
    jmp .loop

.fin:
    mov eax, ecx
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret
