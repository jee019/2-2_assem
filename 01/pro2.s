 AREA Pro2, CODE, READONLY
		ENTRY
	
start
	MOV r0, #4	;set up parameters
	MOV r1, #7
	MOV r3, #8
	MOV r4, #9
	
	LDR r8, TEMPADDR1
	SUB r7, r4, r0	;r7=5
	SUB r3, r1, r0	;r3=3
	SUB r1, r4, r1	;r1=2
	STRB r1, [r8]	;save r1 at mem r8
	STRB r3, [r8, #1]
	STRB r0, [r8, #2]
	STRB r7, [r8, #3]
	LDR r5, [r8]	;load mem r8
	
	LDR r9, TEMPADDR2
	ADD r4, r0, r1	;r4=6
	STRB r3, [r9]	;save r3 at mem r9
	STRB r0, [r9, #1]
	STRB r7, [r9, #2]
	STRB r4, [r9, #3]
	LDR r6, [r9]	;load mem r9

TEMPADDR1	& 	&00005000
TEMPADDR2	& 	&0000F000

	MOV pc, lr

	END	;mark end of file