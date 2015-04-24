; Big to Little Endian.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
bigEndian BYTE 12h, 34h, 56h, 78h
.data
littleEndian DWORD ?

.code
main PROC
	mov ecx, LENGTHOF bigEndian
	mov eax, OFFSET bigEndian
	add eax, ecx
	dec eax
	mov ebx, OFFSET littleEndian
REV:
	mov dl, [eax]
	mov [ebx], dl
	inc ebx
	dec eax
	loop REV

	INVOKE ExitProcess, 0
main ENDP
END main