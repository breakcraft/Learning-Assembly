; Mov Variations.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
val1 WORD 1000h
val2 WORD 2000h
arrayB BYTE 1h, 2h, 3h, 4h, 5h
arrayW WORD 10h, 20h, 30h, 40h
arrayD DWORD 101h, 202h, 303h

.code
main PROC

; MOVZX (unsigned padding, 0)
	mov		bx, 0ABCDh
	movzx	eax, bx
	movzx	edx, bl
	movzx	cx, bl

; MOVSX (signed padding, 0 or F)
	;mov		bx, 0ABCDh
	movsx	eax, bx
	movsx	edx, bl
	mov		bl, 11h
	movsx	cx, bl

; Memory Swap
	mov		ax, val1
	xchg	ax, val2
	mov		val1, ax

; Direct-Offset Addressing, byte array
	mov al, arrayB
	mov al, [arrayB + 1]
	mov al, [arrayB + 2]

; Direct-Offset Addressing, word array
	mov ax, arrayW
	mov ax, [arrayW + 2]
	mov ax, [arrayW + 4]

; Direct-Offset Addressing, double word array
	mov eax, arrayD
	mov eax, [arrayD + 4]
	mov eax, [arrayD + 8]
	
	INVOKE ExitProcess, 0
main ENDP
END main