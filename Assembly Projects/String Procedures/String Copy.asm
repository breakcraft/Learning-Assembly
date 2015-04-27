; String Copy.asm

.386
.model flat, stdcall

.code
EXTERN StringLength@0:PROC
StringLength EQU StringLength@0

StringCopy PROC
string1 EQU [ebp + 8]
string2 EQU [ebp + 12]
; State preservation
	push ebp
	mov ebp, esp
	push eax
	push ecx
	push edi
	push esi
; Set source and destination for movsb
	mov esi, string1
	mov edi, string2
; Get string length for copy then include null byte
	push esi
	call StringLength
	add esp, 4
	mov ecx, eax
	inc ecx
; Do the copy
	cld
	rep movsb
; Restore state of registers
	pop esi
	pop edi
	pop ecx
	pop eax
	pop ebp
	ret
StringCopy ENDP
END