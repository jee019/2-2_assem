cr equ 0x0d	;#define cr 0x0d

	AREA Pro1, CODE, READONLY
		ENTRY
	
main
	LDR r0, =Table			;load Table address
	LDR r1, Address1		;load Address1
	
Loop
	LDRB r2, [r0], #1		;load the first byte into r2
	CMP r2, #cr				;end of the string?
	BEQ Done				;yes->stop loop
	STRB r2, [r1], #1		;no->copy string
	BAL Loop					;read next char
	
Done
	MOV pc, #0				;finsh

Address1 & &00004000	;result storage

Table
	ALIGN
	DCB "Hello, World", cr
	
	END	;mark end of file