; ArraySum.asm module

.386
.model flat, stdcall
.code
ArraySum PROC
ptrArray	EQU [ebp + 8]			; Array is expected to be DWORD array
arraySize	EQU [ebp + 12]
	push ebp
	mov ebp, esp
	push esi
	push ecx
	
	mov esi, ptrArray
	mov ecx, arraySize
	mov eax, 0					; eax is return for result
	cmp ecx, 0
	jle L1

L2: add eax, [esi]
	add esi, 4					; DWORD
	loop L2

L1:	pop ecx
	pop esi
	pop ebp
	ret
ArraySum ENDP
END