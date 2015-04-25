; Table Driven Selection.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
; Consider using align directive maybe
CaseTable	BYTE 0h				; lookup value
			DWORD Process_Add	; procedure address
EntrySize = ($ - CaseTable)
			BYTE 1h
			DWORD Process_Sub
			BYTE 2h
			DWORD Process_And
			BYTE 3h
			DWORD Process_Or
TotalEntries = ($ - CaseTable) / EntrySize
doEachCase BYTE 0h, 1h, 2h, 3h

.code
main PROC
; Note that these same values will be input for each
; procedure in the lookup table
	mov eax, 87654321h
	mov ebx, 12345678h

	mov edx, OFFSET doEachCase
	mov ecx, LENGTHOF doEachCase
LoopCase:
	push ecx					; Preserve stuff for outer loop
	push edx
	mov ecx, TotalEntries
	mov esi, OFFSET CaseTable
	mov dl, [edx]
Lookup:
	cmp dl, [esi]
	jne NextLookup				; This isnt the entry we are looking for
	push eax					; Proceadure output will be in eax... will intentionally revert the Output register
	call NEAR PTR [esi + 1]		; Call procedure from lookup table (NEAR PTR required)
	pop eax						; Revert output register
	jmp NextCase				; Found and processed entry, move onto next case
NextLookup:
	add esi, EntrySize			; Set edx to address of next table entry
	loop Lookup
NextCase:
	pop edx						; Restore NextCase loop stuff
	pop ecx						
	add edx, TYPE BYTE			; Set esi to address of next case array entry
	loop LoopCase

	INVOKE ExitProcess,0
main ENDP

; Input
;	eax - First Value
;	ebx - Second Value
; Output
;	eax - Sum of first and second input
Process_Add PROC ;USES ebx
	add eax, ebx
	ret
Process_Add ENDP

; Input
;	eax - First Value
;	ebx - Second Value
; Output
;	eax - Difference of first and second input
Process_Sub PROC ;USES ebx
	sub eax, ebx
	ret
Process_Sub ENDP

; Input
;	eax - First Value
;	ebx - Second Value
; Output
;	eax - Boolean and of first and second input
Process_And PROC ;USES ebx
	and eax, ebx
	ret
Process_And ENDP

; Input
;	eax - First Value
;	ebx - Second Value
; Output
;	eax - Boolean or of first and second input
Process_Or PROC ;USES ebx
	or eax, ebx
	ret
Process_Or ENDP

END main