section .text
    global string_to_float
    extern remove_point
    extern string_to_int

string_to_float:
    push ebp
    mov ebp, esp
    push ebx

    push [ebp+8]
    call remove_point
    add esp, 4
    mov eax, ebx

    push [ebp+8]
    call string_to_int
    add esp, 4

    cvtsi2ss xmm0, eax
    mov eax, 1
    cvtsi2ss xmm1, eax
    mov eax, 10
    cvtsi2ss xmm2, eax

.pot:
    test ebx, ebx
    jz .listo
    mulss xmm1, xmm2
    dec ebx
    jmp .pot

.listo:
    divss xmm0, xmm1

    pop ebx
    pop ebp
    ret