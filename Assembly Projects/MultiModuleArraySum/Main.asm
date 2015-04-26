; Multi Module Array Sum Main

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

; External referencing
EXTERN ArraySum@0:PROC
EXTERN ArrayFill@0:PROC

; Redefine externs
ArraySum	EQU ArraySum@0
ArrayFill	EQU ArrayFill@0

; Other symbols
Count = 5
.data?
Array	DWORD Count DUP(?)
Sum		DWORD ?

.code
main PROC
	push count
	push OFFSET Array
	call ArrayFill
; Can omit the following 3 lines for obvious reasons...
	;add esp, 8
	;push count
	;push OFFSET Array
	call ArraySum
	add esp, 8
	mov Sum, eax

	INVOKE ExitProcess, 0
main ENDP
END main