ExitProcess PROTO

.data

INPUT QWORD 1, 2, 3, 5, 6, 7, 8, 9
INPUT_LENGTH equ $-INPUT

.code

main PROC
    lea r8, INPUT                   ; pINPUT
    lea rcx, [INPUT + INPUT_LENGTH] ; pINPUT + INPUT_LENGTH

    mov r9, 0   ; max_seen
    mov r10, 1  ; current
    mov r11, 0  ; direction

    mov rbx, QWORD PTR [r8]
    add r8, sizeof QWORD

loop_array:
    mov rax, QWORD PTR [r8]
    add r8, sizeof QWORD

    mov rdx, rax
    sub rdx, rbx

    cmp r11, 0
    cmove r11, rdx

    cmp r11, rdx
    je monotonic

    cmp r10, r9
    cmovg r9, r10

    mov r11, 0
    mov r10, 1

loop_array_end:    
    mov rbx, rax
    cmp rcx, r8
    jg loop_array

    cmp r10, r9
    cmovg r9, r10

    mov rcx, r9
    call ExitProcess
    ret

monotonic:
    inc r10
    jmp loop_array_end

main ENDP

END