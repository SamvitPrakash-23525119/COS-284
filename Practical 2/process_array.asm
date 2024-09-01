; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Diya_Budhia_u22594044
; Group member 03: Alisha_Perumal_u22512285
; ==========================

section .text
    extern malloc
    extern free
    global processArray

processArray:
    ; Parameters:
    ; rdi -> pointer to the float array
    ; rsi -> number of floats in the array

    ; Check if size < 2
    cmp rsi, 2
    jl .return_zero         ; If size < 2, return 0.0

    ; Allocate memory for double-precision array (size * sizeof(double))
    mov rax, rsi
    shl rax, 3              ; size * sizeof(double) (8 bytes per double)
    call malloc
    test rax, rax
    jz .return_zero         ; If malloc fails, return 0.0
    mov rbx, rax            ; Store pointer to allocated memory

    ; Convert float array to double-precision array
    xor rcx, rcx            ; i = 0
.convert_loop:
    cmp rcx, rsi
    jge .compute_sum        ; if i >= size, exit loop
    movss xmm1, [rdi + rcx*4] ; Load float from arr[i]
    cvtss2sd xmm2, xmm1     ; Convert float to double
    movsd [rbx + rcx*8], xmm2 ; Store in doubleArray[i]
    inc rcx
    jmp .convert_loop

.compute_sum:
    xor rcx, rcx            ; i = 0
    xorpd xmm0, xmm0        ; Initialize sum to 0.0
    sub rsi, 1              ; size - 1 for valid range of i
.sum_loop:
    cmp rcx, rsi
    jge .free_memory        ; if i >= size - 1, exit loop
    movsd xmm1, [rbx + rcx*8]     ; Load doubleArray[i]
    movsd xmm2, [rbx + rcx*8 + 8] ; Load doubleArray[i + 1]
    mulsd xmm1, xmm2        ; Multiply doubleArray[i] * doubleArray[i + 1]
    addsd xmm0, xmm1        ; Add product to sum
    inc rcx
    jmp .sum_loop

.free_memory:
    mov rdi, rbx            ; Free allocated memory
    call free

.return_zero:
    ; Return sum in xmm0
    ret
