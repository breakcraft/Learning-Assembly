; String Length.asm

.386
.model flat, stdcall

.code
StringLength PROC
string EQU [ebp + 8]
	push ebp
	mov ebp, esp
	push edi
	mov edi, string
	xor eax, eax			; Less bytes than mov eax, 0
L1:
	cmp BYTE PTR [edi], 0	; Check if end of string reached
	je L2					; If end reaced, return
	inc eax					
	inc edi
	jmp L1					; Otherwise increment and continue
; eax contains the string length at this point
L2:
	pop edi
	pop ebp
	ret
StringLength ENDP
END