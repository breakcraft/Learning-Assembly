; String Copy.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
phrase BYTE "This is a string", 0

.data?
copy BYTE LENGTHOF phrase DUP(?)

.code
main PROC
	mov ecx, LENGTHOF phrase
	mov eax, OFFSET phrase
	mov ebx, OFFSET copy

LCOPY:
	mov dl, [eax]
	mov [ebx], dl
	add eax, TYPE phrase
	add ebx, TYPE copy
	loop LCOPY

	INVOKE ExitProcess, 0
main ENDP
END main