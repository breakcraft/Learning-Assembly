; Add Variables.asm

    .386
    .model flat, stdcall
    .stack 4096
    ExitProcess PROTO, dwExitCode:DWORD

    .data
        one     DWORD 1h
        two     DWORD 2h
        three   DWORD 3h
        sum     DWORD 0

    .code 
    main PROC
        mov eax, one
        add eax, two
        add eax, three
        mov sum, eax
        
        INVOKE ExitProcess, 0
    main ENDP
    END main