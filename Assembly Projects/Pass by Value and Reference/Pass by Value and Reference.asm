; Pass by Value and Reference.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
var1 DWORD 0ABCh
var2 DWORD 0DEFh
.data?
count = 100
array WORD count DUP(?)

.code
main PROC
; C/C++ calling convention to push parameters on stack in reverse order
	push var2
	push var1
	call AddVal
	add esp, 8			; Effectively clears stack of stack parameters

	push OFFSET array
	push count
	call ArrayFillRef
	add esp, 8

	INVOKE ExitProcess, 0
main ENDP

; Symbols for AddVal
var1_param EQU [ebp + 8]
var2_param EQU [ebp + 12]
local1 EQU DWORD PTR [ebp - 4]
local2 EQU DWORD PTR [ebp - 8]
; Return value stored in eax
AddVal PROC
	push ebp					; Save base pointer
	mov ebp, esp				; Set base pointer to base of stack frame
; Use explicit stack parameters [ebp + i]
; NOTE: i = 0 is now saved ebp value and i = 4 is return address
;	mov eax, [ebp + 8]			; Get var1 value pushed onto stack
;	add eax, [ebp + 12]			; Add var2 value to it
; The following is equivalent to the previous 2 lines
	mov eax, var1_param
	add eax, var2_param
; Local variable example to add to result
	sub esp, 8					; Reserves space for two DWORDS on stack
;	mov DWORD PTR [ebp - 4], 10	; Set value of first local variable
;	mov DWORD PTR [ebp - 8], 20	; Set value of second local variable
;	add eax, DWORD PTR [ebp - 4]
;	add eax, DWORD PTR [ebp - 8]
; The following is equivalent to the previous 4 lines
	mov local1, 10
	mov local2, 20
	add eax, local1
	add eax, local2
	mov esp, ebp				; Remove local variables from stack
	pop ebp						; Restore extended stack frame pointer
	ret ;8 <-- stdcall calling convention in place of "add esp, 8" after return
AddVal ENDP

ArrayFillRef PROC
	push ebp
	mov ebp, esp
	pushad						; Push general purpose register onto stack

	mov esi, [ebp + 12]			; Get address of array from parameters
	mov ecx, [ebp + 8]			; Set loop counters to length of array
	cmp ecx, 0
	je L2						; Finish procedure if length is 0
	mov ax, 0					; Will be using ax value to put into current array index
L1:
	mov [esi], ax
	inc ax
	add esi, TYPE WORD
	loop L1
L2:	
	popad						; Restore general purpose registers
	pop ebp
	ret
ArrayFillRef ENDP
END main