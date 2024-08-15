; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Diya_Budhia_u22594044
; Group member 03: Alisha_Perumal_u22512285
; ==========================

section .data 
    message db "Choice: "

section .bss
    ; ==========================
    ; Your data goes here
    ; ==========================

section .text
    global get_user_choice

extern greeting             

get_user_choice:
    ; Call the greeting function to print the welcome message
    call greeting
    
    
    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor 1 is stdout
    mov rsi, message          ; address of the string
    mov rdx, 8                ; length of the string ("Choice: " + newline)
    syscall

    ; ==========================
    ; Your data goes here
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing 
    ret
