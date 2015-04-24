; Array.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
byteArray	BYTE	10h, 20h, 30h, 40h, 50h
arraySize = ($ - byteArray)	; $ gets current memory location

.code
main PROC
	mov al, arraySize
	mov al, byteArray		; byteArray's location is the first array item 
	mov al, [byteArray + 1] ; each sequential item is the address where byteArray
	mov al, [byteArray + 2] ; is located plus an integer offset representing
	mov al, [byteArray + 3] ; a number of bytes
	mov al, [byteArray + 4] ; the brackets are like value at address
							; byteArray + i is an "effective address"

	INVOKE ExitProcess, 0
main ENDP
END main