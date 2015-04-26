; Array Compare.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

count = 4
.data
array1 DWORD 10h, 500h, 100h, 20h
array2 DWORD 10h, 50h, 1000h, 20h
.data?
lesser DWORD ?

.code
main PROC
	mov ecx, count
	mov esi, OFFSET array1
	mov edi, OFFSET array2
	cld							; Compare in forward direction
; PROBLEM - repe is repeat while equal and ecx > 0 but it continues to repeat
;			past the 500h,50h comparison...
;			repne, repeat while not equal, stops at the 500h,50h comparison
;			instead of 10h,10h though.
;			No idea why repe continues all the way through to the end.
; UPDATE  - Increased array lengths to add 20h, 20h to the end of both to 
;			text. I believe that esi and edi are still incremented prior to
;			performing the comparison.
	repe cmpsd					; Repeat compare DWORDs while equal
	jb L1						; Jump if source is greater than destination
	mov eax, [edi - 4]			; Destination is smaller or both equal
	jmp L2
L1:	
	mov eax, [esi - 4]			; Source is smaller
L2:
	mov lesser, eax

	INVOKE ExitProcess, 0
main ENDP
END main