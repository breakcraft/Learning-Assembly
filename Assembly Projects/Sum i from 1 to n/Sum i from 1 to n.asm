; Sum i from 1 to n.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data?
sum DWORD ?
n = 10

.code
main PROC
	mov eax, 0
	mov ecx, n
	call RecSum
	mov sum, eax

	INVOKE ExitProcess, 0
main ENDP

RecSum PROC
	cmp ecx, 0
	je L1				; Return if counter is at 0
	add eax, ecx
	dec ecx
L1:	ret
RecSum ENDP
END main