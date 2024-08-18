; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Diya_Budhia_u22594044
; Group member 03: Alisha_Perumal_u22512285
; ==========================

section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    message db "Enter plaintext to encrypt: "
    return db "The cipher text is: "
    space db ' ', 0
    format db "%d"
    ; ==========================

section .bss
    ; ==========================
    user_input resb 3
    ; ==========================

section .text
    global encrypt_and_print

extern printf, input

;When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

encrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, 28
    syscall
    
    mov rsi, user_input
    mov rdx, 4
    call input

    mov rax, 1
    mov rdi, 1
    mov rsi, return
    mov rdx, 20
    syscall

    movzx eax, byte [user_input]
    rol eax, 4
    xor eax, 0x73113777
    
    mov rdi, format
    mov rsi, rax
    xor rax, rax
    call printf

    mov rdi, space
    xor rsi, rsi
    xor rax, rax
    call printf

    movzx eax, byte [user_input+1]
    rol eax, 4
    xor eax, 0x73113777
    
    mov rdi, format
    mov rsi, rax
    xor rax, rax
    call printf

    mov rdi, space
    xor rsi, rsi
    xor rax, rax
    call printf

    movzx eax, byte [user_input+2]
    rol eax, 4
    xor eax, 0x73113777
    
    mov rdi, format
    mov rsi, rax
    xor rax, rax
    call printf

    mov rdi, space
    xor rsi, rsi
    xor rax, rax
    call printf

    movzx eax, byte [user_input+3]
    rol eax, 4
    xor eax, 0x73113777
    
    mov rdi, format
    mov rsi, rax
    xor rax, rax
    call printf
    call print_char_32  

    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing
    ret

