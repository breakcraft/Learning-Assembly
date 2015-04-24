; Increment and Decrement.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
var BYTE 9h

.code
main PROC
	inc var
	mov al, var
	dec al
	mov var, al

	INVOKE ExitProcess, 0
main ENDP
END main