; ArrayFill.asm

.386
.model flat, stdcall
.code
ArrayFill PROC
ptrArray	EQU [ebp + 8]
arraySize	EQU [ebp + 12]
	push ebp
	mov ebp, esp
	push ecx
	push esi
	push eax

	mov esi, ptrArray
	mov ecx, arraySize
	cmp ecx, 0
	jle L1
	
	mov eax, 1
L2: mov [esi], eax
	add esi, 4
	inc eax
	loop L2

L1:	pop eax
	pop esi
	pop ecx
	pop ebp
	ret
ArrayFill ENDP
END