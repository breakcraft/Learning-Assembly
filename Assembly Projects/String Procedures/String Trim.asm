; String Trim.asm

.386
.model flat, stdcall

; External procedures
EXTERN StringLength@0:PROC
EXTERN StringCopy@0:PROC
StringLength EQU StringLength@0
StringCopy EQU StringCopy@0

; Symbols for all procedures
string	EQU [ebp + 8]
delim	EQU [ebp + 12]

.code
StringTrim PROC
	push ebp
	mov ebp, esp
	push eax
; Trim back before front - more efficient than other way around
	mov eax, delim
	push eax
	push string
	call StringTrimEnd
	call StringTrimFront
	add esp, 8

	pop eax
	pop ebp
	ret
StringTrim ENDP

StringTrimFront PROC
	push ebp
	mov ebp, esp
	push eax
	push ebx
	push ecx
	push edi
; Get string length and return if 0
	mov edi, string
	push edi
	call StringLength
	add esp, 4
	cmp eax, 0
	je L1
; Set deliminator and counter to registers
	mov ecx, eax
	mov eax, delim				; Deliminator is in al
	xor ebx, ebx				; Use ebx to count leading deliminators
; Check front of string for deliminator
L2:
	cmp [edi], al
	jne L3
	inc ebx
	inc edi
	loop L2
; String copy step
L3:
	cmp ebx, 0
	je L1						; If ebp is 0, skip the string copy. No trim needed
	push string					; Push string to copy to
	add ebx, string				; This will set ebx to address of first non-delim char
	push ebx					; Push substring to copy from
	call StringCopy
	add esp, 8
L1:
	pop edi
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret
StringTrimFront ENDP

StringTrimEnd PROC
	push ebp
	mov ebp, esp
	push eax
	push ecx
	push edi
; Get string length and return if 0
	mov edi, string
	push edi
	call StringLength
	add esp, 4
	cmp eax, 0
	je L1
; Set deliminator and counter to registers
	mov ecx, eax
	mov eax, delim				; Deliminator is in al
; Check back of string for deliminator
	add edi, ecx				; edi will be address of null byte
L2:
	dec edi						; Decrement to current index to check
	cmp al, [edi]				; Check if current is deliminator
	loope L2					; If its a match, continue
	mov BYTE PTR [edi + 1], 0	; Set null to establish new end
L1:
	pop edi
	pop ecx
	pop eax
	pop ebp
	ret
StringTrimEnd ENDP
END