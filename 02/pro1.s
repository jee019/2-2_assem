 AREA Pro1, CODE, READONLY
		ENTRY
	
start
	MOV r7, #0	;set up parameters
	MOV r8, #1
	MOV r9, #1
	LDR r0, =string1	;load string
	LDR r1, =string2
	
Loop
	LDRB r2, [r0], #1		;load char
	LDRB r3, [r1], #1
	CMP r2, r3				;compare(r2 - r3)
	MULEQ r10, r9, r8		;r10=r9*1
	MULNE r10, r9, r7		;r10=r9*0
	MOV r9, r10				;r9=r10
	
	CMP r2, #0	;string1 끝
	BEQ Endline
	CMP r3, #0	;string2 끝
	BEQ Endline
	B Loop
	
Endline
	CMP r9, #1
	LDR r5, Address
	MOVEQ r6, #10		;r9=1 문자열 같음
	MOVNE r6, #11		;r9=0 문자열 다름
	STR r6, [r5]	;save r6 at mem r5
	MOV pc, lr

string1 DCB "abc", 0
string2 DCB "abc", 0
Address	&	&00004000
	
	END	;mark end of file