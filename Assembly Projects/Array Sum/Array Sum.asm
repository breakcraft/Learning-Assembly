; Array Sum.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
arrayW WORD 1h, 20h, 300h, 4000h
.data?
sum WORD ?

.code
main PROC
	mov edi, OFFSET arrayW		; Get offset for array
	mov ecx, LENGTHOF arrayW	; Set total iterations for loop
	mov ax, 0					; Start accumulator at 0

LSUM:
	add ax, [edi]				; Add current array index value to accumulator
	add edi, TYPE arrayW		; Add to offset to edi to set next index
	loop LSUM
	
	mov sum, ax

	INVOKE ExitProcess, 0
main ENDP
END main