; String Compare.asm

.386
.model flat, stdcall

.code
StringCompare PROC
; The stack parameters will be from OFFSET string1/2
string1	EQU [ebp + 8]
string2 EQU [ebp + 12]
; null byte is end of string
	push ebp
	mov ebp, esp
	push esi
	push edi
	push eax
; Set first address of strings to compare to esi and edi
	mov esi, string1
	mov edi, string2
; Comparison loop
L1: mov al, [esi]		; If compile gets error here, add PTR BYTE
	mov ah, [edi]
	cmp al, 0			; Check if end of string1 reached
	jne L2				; Continue if end of string1 not reaced
	cmp ah, 0			; Check if end of string2 reached
	jne L2				; Continue if end of string2 not reached
; ZF set if reached from cmp ah(0), 0
	jmp L3				; Reached end of both strings and they the same
L2:
	inc esi				; String are BYTE arrays so just inc
	inc edi
	cmp al, ah			; Compare
	je L1
; ZF cleared if reached
; CF set if al < ah
; CF cleared if al > ah
L3:
	pop eax
	pop edi
	pop esi
	pop ebp
	ret
StringCompare ENDP
END