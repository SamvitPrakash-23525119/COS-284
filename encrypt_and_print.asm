; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Diya_Budhia_u22594044
; Group member 03: Alisha_Perumal_u22512285
; ==========================

section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    xor_const dd 0x73113777     
    ; ==========================

section .bss
    ; ==========================
    input_buffer resb 256       ;buffer to store user input
    ; ==========================

section .text
    global encrypt_and_print

extern printf

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
    mov rsi, input_buffer
    mov rcx, 0

encrypt_loop:
    mov al, [rsi + rcx]
    cmp al, 0
    je done

    rol al, 4

    ;movzx eax, [xor_const] 
    ;xor eax, dword [xor_const]

    movzx eax, al
    mov ebx, dword [xor_const]
    xor eax, ebx

    call print_char_32

    inc rcx
    jmp encrypt_loop
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing
done:
    ret
