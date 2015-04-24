; Array Sum Procedure.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array DWORD 1h, 20h, 300h, 4000h, 50000h
.data?
sum DWORD ?

.code
main PROC
	mov esi, OFFSET array	; Store array location
	mov ecx, LENGTHOF array	; Store number of elements in array
	call ArraySum			; Sum will be stored in eax
	mov sum, eax

	INVOKE ExitProcess, 0
main ENDP

ArraySum PROC USES esi ecx
; Array location in esi and array length in ecx
; Input array must be DWORD array
	; Replaced by PROC USES
	;push esi	; Save esi
	;push ecx	; Save ecx

	mov eax, 0	; Accumulator for sum

L1:
	add eax, [esi]
	add esi, TYPE DWORD	; Reason for DWORD constraint on array
	loop L1

	; Replaced by PROC USES
	;pop esi		; Restore esi
	;pop ecx		; Restore ecx

	ret
ArraySum ENDP

END main
 