; Integer Expression Calculation.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO dwExitCode : DWORD

.data
varA    DWORD 1
varB    DWORD 2
varC    DWORD 3
varD    DWORD 4

.code
main PROC
    mov eax, varA
    mov ebx, varB
    add eax, ebx    ; A = A + B
    mov ecx, varC
    mov edx, varD
    add ecx, edx    ; C = C + D
    add eax, ecx    ; A = A + C
    mov varA, eax

    INVOKE ExitProcess, 0
main ENDP
END main