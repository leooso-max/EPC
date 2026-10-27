section .data
    msg db "Ingresa un numero del 0 al 9: ", 0
    msg1 db "Error: el número no es valido", 0
    msg2 db "El resultado de la suma es: ", 0

section .bss
    buffer resb 32
    salida resb 1

section .text
    global _start
    extern string_to_int
    extern print_string
    extern print_int

_start:
    push msg
    call print_string
    add esp, 4

    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 32
    int 0x80

    push buffer
    call string_to_int
    add esp, 4
    mov esi, eax

    cmp esi, 0
    jl .error
    cmp esi, 9
    jg .error

    push msg2
    call print_string
    add esp, 4

    push esi
    call print_int
    add esp, 4

    mov eax, 1
    mov ebx, 0
    int 0x80

.error:
    push msg1
    call print_string
    add esp, 4

    mov eax, 1
    mov ebx, 1
    int 0x80