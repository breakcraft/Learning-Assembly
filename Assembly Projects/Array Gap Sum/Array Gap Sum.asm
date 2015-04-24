; Array Gap Sum.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
; Array must be non-decreasing
arrayD		DWORD 0h, 2h, 5h, 9h, 0Ah
.data?
diffSum	DWORD ?

.code
main PROC
	mov ecx, (LENGTHOF arrayD) - 1
	mov eax, 0
	mov ebx, 0
	mov edx, 0

DIFFL:
	; This sub will cause eax to be "negative" if the current
	; index is non-zero, but the non-decreasing constraint on
	; the array will guarantee that after eax will be corrected
	; after the add/
	sub eax, [arrayD + ebx * (TYPE arrayD)]
	inc ebx
	add eax, [arrayD + ebx * (TYPE arrayD)]
	add edx, eax
	mov eax, 0
	loop DIFFL

	mov diffSum, eax

	INVOKE ExitProcess, 0
main ENDP
END main