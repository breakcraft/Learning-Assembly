; Add Two.asm

; To make a new assembly project in VS...
; Win32 Console Application > Empty Project
; Build Customizations > masm

    .386
    .model flat, stdcall
    .stack 4096
    ExitProcess PROTO, dwExitCode:DWORD

    .data
    sum DWORD 0

    .code
    main PROC
        mov eax, 5
        add eax, 6
        mov sum, eax

        INVOKE ExitProcess, 0
    main ENDP
    END main