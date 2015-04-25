; Conditional Array Sum.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array1 DWORD 1h, 20h, 300h, 4000h, 50000h
array2 DWORD 50h, 1h, 300h, 6000h, 0ABh
.data?
sum1 DWORD ?
sum2 DWORD ?

.code
main PROC
; Set min and max for both procedure calls
	mov ebx, 10h
	mov edx, 0F000h

; Procedure call for array1
	mov esi, OFFSET array1
	mov ecx, LENGTHOF array1
	call SumWithinRange
	mov sum1, eax

; Procedure call for array2
	mov esi, OFFSET array2
	mov ecx, LENGTHOF array2
	call SumWithinRange
	mov sum2, eax

	INVOKE ExitProcess, 0
main ENDP

; INPUT
;	esi - Address of a DWORD array
;	ecx - Number of elements in array
;	ebx - Minmum value of an element to include in sum
;	edx - Maximum value of an element to include in sum 
; OUTPUT
;	eax - The sum...
SumWithinRange PROC USES esi ecx ebx edx
	mov eax, 0
L1:
	cmp ebx, [esi]		; Check that current value >= min
	ja J1			
	cmp edx, [esi]		; Check that current value <= max
	jb J1
	add eax, [esi]		; Add current to sum
J1:	
	add esi, TYPE DWORD	; Increment to next element
	loop L1				; Looping on ecx value
	
	ret
SumWithinRange ENDP

END main