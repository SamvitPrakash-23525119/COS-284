; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Diya_Budhia_u22594044
; Group member 03: Alisha_Perumal_u22512285
; ==========================
section .bss
    trash resb 1

section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    msg db "The plaintext is: "
    temp dq 0x0
    one dq 0x0
    two dq 0x0
    three dq 0x0
    four dq 0x0
    ; ========================== 

section .text
global decrypt_and_print

extern printf

;When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

decrypt_and_print:
    ;1930506807 1930507047 1930506823 1930506807
    ;    rcx        rsi       rdx         rdi

    xor rcx, 0x73113777
    ror rcx, 4

    xor rsi, 0x73113777
    ror rsi, 4

    xor rdx, 0x73113777
    ror rdx, 4

    xor rdi, 0x73113777
    ror rdi, 4


    mov [one], rcx
    mov [two], rsi
    mov [three], rdx
    mov [four], rdi   


    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 18
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, one
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, two
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, three
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, four
    mov rdx, 1
    syscall

    ret


