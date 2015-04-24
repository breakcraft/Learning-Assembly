; Pointers.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dxExitCode:DWORD

PBYTE	TYPEDEF PTR BYTE
PWORD	TYPEDEF PTR WORD
PDWORD	TYPEDEF PTR DWORD

.data
arrayB	BYTE	1h, 2h, 3h
arrayW	WORD	10h, 20h, 30h
arrayD	DWORD	101h, 202h, 303h

ptrArrayB	PBYTE	arrayB
ptrArrayW	PWORD	arrayW
ptrArrayD	PDWORD	arrayD

.code
main PROC
	mov esi, ptrArrayB
	mov al, [esi]
	mov al, [esi + 1]
	mov al, [esi + 2]

	mov	esi, ptrArrayW
	mov ax, [esi]
	mov ax, [esi + 2]
	mov ax, [esi + 4]

	mov esi, ptrArrayD
	mov eax, [esi]
	mov eax, [esi + 4]
	mov eax, [esi + 8]

	INVOKE ExitProcess, 0
main ENDP
END main