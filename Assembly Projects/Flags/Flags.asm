; Flags.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
; Zero Flag
	mov al, 1
	sub al, 1		; AL = 0, ZF = 1
	mov ah, 0FFh	
	inc ah			; AH = 0, ZF = 1
	inc ah			; AH = 1, ZF = 0
	dec ah			; AH = 0, ZF = 1

; Carry Flag for Add
; NOTE: Inc does not affect CF
	mov bl, 0FFh
	add bl, 1		; BL = 0, CF = 1
	mov bx, 0FFh
	add bx, 1		; BX = 100h, CF = 0
	mov bx, 0FFFFh
	add bx, 1		; BX = 0, CF = 1

; Carry Flag for Sub
; NOTE: Dec does not affect CF
	mov cl, 1
	sub cl, 2		; CL = FFh, CF = 1

	INVOKE ExitProcess, 0
main ENDP
END main