SECTION .data
    prompt db "Введите число: ", 0
    res db "Факториал: ", 0
    input db 0

SECTION .bss
    num resb 1
    factorial resd 1

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
    mov eax, 1
    mov [factorial], eax
    mov ecx, 1

factorial_loop:
    jg done_factorial
    ;mul factorial on i
    mov eax, [factorial]
    mul ecx
    mov [factorial], eax

    inc ecx
    jmp factorial_loop
done:
    ;print res
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 11
    int 0x80

    mov eax, [factorial]
    add eax, '0'
    mov [input], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, 1
    int 0x80

exit:
    ;end
    mov eax, 1
    xor ebx, ebx
    int 0x80
