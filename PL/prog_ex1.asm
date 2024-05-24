section .data
    prompt db "Enter number:", 0
    result_prime db "Number is prime", 0
    result_not_prime db "Number is not prime", 0
    num db 0
    swrite db 4
    sread db 3
    stdout db 1
    stdin db 0
    len db 14

_start:
    LD swrite
    ST eax
    LD stdout
    ST ebx
    LD stdout
    ST ecx
    LD len
    ST edx
    syscall

    LD sread
    ST eax
    LD stdin
    ST ebx
    LD num
    ST ecx
    LD 1
    ST edx
    syscall

    LD eax
    SUB '0'
    ST ebx

    LD 2
    ST ecx

check_prime:
    MOD ecx
    JGE done

    LD num
    DIV ecx
    MOD edx
    JE not_prime

    LD ecx
    ADD 1
    ST ecx
    JMP check_prime

done:
    LD swrite
    ST eax
    LD stdout
    ST ebx
    LD result_prime
    ST ecx
    LD 16
    ST edx
    syscall

    JMP exit

not_prime:
    LD swrite
    ST eax
    LD stdout
    ST ebx
    LD result_not_prime
    ST ecx
    LD 20
    ST edx
    syscall

    JMP exit

exit:
    HLT