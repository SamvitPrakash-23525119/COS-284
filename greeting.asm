; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Diya_Budhia_u22594044
; Group member 03: Alisha_Perumal_u22512285
; ==========================

section .data
    ; ==========================
    message db "Welcome agent. What do you want to do, Encrypt[1] or Decrypt[2]?", 0x0a, 0
    ; ==========================

section .text
    global greeting

greeting:
    
    ; ==========================

    mov rax, 1                
    mov rdi, 1                
    mov rsi, message          
    mov rdx, 65               
    syscall                   

    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret                       ; return from function
