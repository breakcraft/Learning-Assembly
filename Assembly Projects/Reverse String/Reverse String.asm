; Reverse String.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
aString BYTE "This is a string", 0
stringLen = ($ - aString) - 1 ; 0 will remain at end even after reverse

.code
main PROC
; Push string on stack
	mov ecx, stringLen	; stringLen is same as (LENGTHOF aString) - 1
	mov esi, 0

L1:	; Push string on stack loop
	movzx eax, aString[esi]
	push eax
	inc esi
	loop L1

; Pop string off stack to store in reverse
	mov ecx, stringLen
	mov esi, 0

L2: ; Pop string off stack loop
	pop eax
	mov aString[esi], al
	inc esi
	loop L2

	INVOKE ExitProcess, 0
main ENDP
END main