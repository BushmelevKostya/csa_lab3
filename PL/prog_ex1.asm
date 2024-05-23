SECTION .data
    prompt db "Введите число: ", 0
    res_prime db "Число простое", 0
    res_no_prime db "Число не простое", 0
    input db 0

SECTION .bss
    num resb 1

SECTION .text
    global _start

_start:
    ;input
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 15
    int 0x80
    ;read input
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 1
    int 0x80
    ;input to num
    mov al, [num]
    sub al, '0'
    mov bl, al
    ;init
    mov ecx, 2
check_prime:
    ;check del on i
    cmp ecx, bl
    jge done
    ;del num on ecx
    mov eax, bl
    cdq
    div ecx
    cmp edx, 0
    je not_prime

    inc ecx
    jmp check_prime

done:
    ;print res
    mov eax, 4
    mov ebx, 1
    mov ecx, result_prime
    mov edx, 13
    int 0x80
    jmp exit

not_prime:
    ;print res
    mov eax, 4
    mov ebx, 1
    mov ecx, result_not_prime
    mov edx, 17
    int 0x80

exit:
    ;end
    mov eax, 1
    xor ebx, ebx
    int 0x80
