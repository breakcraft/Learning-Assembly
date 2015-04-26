; Array Load Store.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array DWORD 1h, 3h, 5h, 7h, 9h, 0Ah, 0Ch, 0Eh
multBy DWORD 10h

.code
main PROC
	cld							; Load/Store in forward direction
	mov esi, OFFSET array		; Set esi for load
	mov edi, esi				; Set edi for store
	mov ecx, LENGTHOF array
L1:
	lodsd						; Load to eax
	mul multBy					; Multiply eax by multBy
	stosd						; Store eax
	loop L1

	INVOKE ExitProcess, 0
main ENDP
END main