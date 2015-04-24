; Add Sub Neg.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
val1 SBYTE 1h
val2 SBYTE 2h
val3 SBYTE 4h
.data?
result SBYTE ?

.code
main PROC
	; compute result = -val1 + (val2 - val3) = -1 + (2 - 4)
	; Note: neg is achieved by using two's complement
	mov al, val1
	neg al
	mov bl, val2
	sub bl, val3
	add al, bl
	mov result, al

	INVOKE ExitProcess, 0
main ENDP
END main