; Array Pair Swap.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
; Array must have an even number of elements
arrayB BYTE 10h, 20h, 30h, 40h, 50h, 60h, 70h, 80h

.code
main PROC
	mov edx, OFFSET arrayB	; Only to get address for memory watch
	mov ecx, (LENGTHOF arrayB) / 2
	mov eax, 0
SWAP:
	mov bl, [arrayB + eax]
	xchg bl, [arrayB + eax + TYPE arrayB]
	mov [arrayB + eax], bl
	add eax, (TYPE arrayB) * 2
	loop SWAP

	INVOKE ExitProcess, 0
main ENDP
END main