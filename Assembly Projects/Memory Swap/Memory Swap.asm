; Memory Swap.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
var1    DWORD 0Ah   ; Need to lead with a 0 for hex starting with letter
var2    DWORD 0Fh

.code
main PROC
    mov eax, var1   ; set eax <- var1, eax given value of var1
    xchg eax, var2  ; set eax <-> var2, eax given value of var2
    mov var1, eax   ; set var1 <- eax

    INVOKE ExitProcess, 0
main ENDP
END main