; Recursion Stack Overflow.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
	call StackOverflow

	INVOKE ExitProcess, 0		; Never gonna happen =P
main ENDP

StackOverflow PROC
	call StackOverflow
	ret							; Never gonna happen
StackOverflow ENDP
END main