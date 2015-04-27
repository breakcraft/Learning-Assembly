; String Procedures.asm

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

; External procedures
EXTERN StringLength@0:PROC
EXTERN StringCopy@0:PROC
EXTERN StringCompare@0:PROC
EXTERN StringTrimEnd@0:PROC
EXTERN StringTrimFront@0:PROC
EXTERN StringTrim@0:PROC

StringLength	EQU StringLength@0
StringCopy		EQU StringCopy@0
StringCompare	EQU StringCompare@0
StringTrimEnd	EQU StringTrimEnd@0
StringTrimFront	EQU StringTrimFront@0
StringTrim		EQU StringTrim@0

.data
string1 BYTE "This is a string",0
string2 BYTE "This is another string",0
trim	BYTE "###TRIM ME###", 0
delim	BYTE "#"
.data?
trimC BYTE 14 DUP(?)

.code
main PROC
; Test String Length
	push OFFSET trim
	call StringLength
	add esp, 4				
; Test String Copy
	push OFFSET trimC
	push OFFSET trim
	call StringCopy
	add esp, 8
; Test String Trim
	movzx eax, delim
	push eax
	push OFFSET trimC
	call StringTrimEnd
	push OFFSET trim
	call StringCopy
	add esp, 4
	call StringTrimFront
	push OFFSET trim
	call StringCopy
	add esp, 4
	call StringTrim
	add esp, 8
; Test String Compare
	push OFFSET string2
	push OFFSET string1
	call StringCompare
	add esp, 8
	push OFFSET string1
	push OFFSET string2
	call StringCompare
	add esp, 8
	push OFFSET string1
	push OFFSET string1
	call StringCompare
	add esp, 8

	INVOKE ExitProcess, 0
main ENDP
END main