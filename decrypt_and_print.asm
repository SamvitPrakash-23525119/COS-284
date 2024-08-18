; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Diya_Budhia_u22594044
; Group member 03: Alisha_Perumal_u22512285
; ==========================

section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    user_input db "1930507175", 0
    ; ==========================
    prompt db 'Enter the encrypted value: ', 0
    input_fmt db '%d', 0                ; Format string for integer input
    output_fmt db '%c', 0  ; Format string for integer output
    xor_key dd 0x73113777  

section .text
global decrypt_and_print

extern printf, atoi

;When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

decrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ;1930507175 1930507143 1930506775 1930507047
      
      ; Convert string to integer
    mov rdi, user_input
    call atoi                         ; Convert ASCII to integer

    ; Decrypt the value
    mov rsi, user_input              ; Load the integer input into EAX
    xor rsi, 0x73113777               ; XOR with the key
    ror rsi, 4                         ; Rotate right by 4 bits

    ; Print decrypted value
    mov rdi, output_fmt
    xor rax, rax
    call printf
    call print_char_32
    
    ; Exit program
    mov eax, 60                        ; SYS_exit system call number
    xor edi, edi                       ; Exit code 0
    syscall 



    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret