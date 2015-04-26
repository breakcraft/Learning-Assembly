; Array Copy.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

count = 10
.data
arrayB	BYTE count DUP(1h)
arrayW	WORD count DUP(20h)
arrayD	DWORD count DUP(300h)
.data?
arrayCB	BYTE count DUP(?)
arrayCW WORD count DUP(?)
arrayCD DWORD count DUP(?)

.code
main PROC
	cld						; Need to clear direction flag to increment esi/edi
; Copy BYTE array
	mov ecx, count			; Counter
	mov esi, OFFSET arrayB	; Source
	mov edi, OFFSET arrayCB	; Destination
	rep movsb				; mov 10 BYTES
; Copy WORD array
	mov ecx, count
	mov esi, OFFSET arrayW
	mov edi, OFFSET arrayCW
	rep movsw
; Copy DWORD array
	mov ecx, count
	mov esi, OFFSET arrayD
	mov edi, OFFSET arrayCD
	rep movsd

	INVOKE ExitProcess, 0
main ENDP
END main