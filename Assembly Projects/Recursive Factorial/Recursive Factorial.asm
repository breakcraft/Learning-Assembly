; Recursive Factorial.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data?
result DWORD ?
n = 5

.code
main PROC
	push n
	call Factorial
	mov result, n

	INVOKE ExitProcess, 0
main ENDP

Factorial PROC
	push ebp				; Preserve base pointer to stack frame
	mov ebp, esp			; Set base pointer to stack frame to current stack pointer
	mov eax, [ebp + 8]		; Get parameter for current value of n
	cmp eax, 1				; Check if n > 1
	jna L1					; If n <= 1, we are at base (0! = 1! = 1) so return
	dec eax					; o/w n > 1, prepare to make recursive call
	push eax
	call Factorial			
	add esp, 4				; Need to remove that push of eax from stack
	mov ebx, [ebp + 8]		; Retrieve this call's n from stack
	mul ebx					; Multiply eax by it
L1: pop ebp					; Restore base pointer to stack frame
	ret
Factorial ENDP
END main