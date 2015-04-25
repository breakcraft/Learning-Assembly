; LEA Instruction.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
	call SomeArray

	INVOKE ExitProcess, 0
main ENDP

SomeArray PROC
	push ebp				; Save base pointer to stack frame
	mov ebp, esp			; Set base pointer to stack frame

	sub esp, 32				; reduce stack pointer to use 30 bytes for string
							; stack pointer is moved down by 32 bytes to align to double word
	lea esi, [esp - 30]		; Use LEA to get address of the string
							; OFFSET is only permitted for addresses known at compile time
	mov ecx, 30				; Set loop counter to account for 30 characters
L1: mov BYTE PTR [esi], '*'
	inc esi
	loop L1
	add esp, 32				; Remove string and restore stack pointer

	pop ebp					; Restore base pointer
	ret
SomeArray ENDP
END main