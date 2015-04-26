; Array Scan (and Store).asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array BYTE 1h,3h,5h,7h,9h,0Ah,0Ch,0Eh

.code
main PROC
	cld							; Scan in forward direction (dont forget std reverse)
	mov ecx, LENGTHOF array
	mov edi, OFFSET array		; edi used for scan
	mov al, 9h					; eax, ax, al are used for scan
	repnz scasb					; Repeat while zero flag clear and ecx > 0
	jnz	L1						; If al value not found when scan is complete
								; the zero flag will not be set - value not found
	dec edi						; Decrement to get index of value
; Decided to use the STOS_ example here to store if found
;	mov al, [edi]				; Already have this value in al due to scan
	neg ecx
	add ecx, LENGTHOF array		; Only going to store up to the found index 
	mov edi, OFFSET array
	rep stosb
L1:
	INVOKE ExitProcess, 0
main ENDP
END main