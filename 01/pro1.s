 AREA Pro1, CODE, READONLY
		ENTRY
	
start
	LDR r4, TEMPADDR1
	MOV r5, #17
	STR r5, [r4]	;save r5 at mem r4
	
	LDR r7, TEMPADDR2
	MOV r8, #10
	STR r8, [r7]	;save r8 at mem r7
	
	LDR r9, TEMPADDR3
	MOV r10, #5
	STR r10, [r9]	;save r10 at mem r9
	
	MOV r0, #10		;set up parameters
	MOV r1, #1
	MOV r2, #2
	MOV r3, #3
	
	LDR r5, [r4]	;load mem r4
	CMP r0, r5	;compare(r0 - r5)
	MOVMI r6, r3	;if r0 < r5, MOV r3 into r6. r6 = 3
	MOVGT r6, r1	;if r0 > r5, MOV r1 into r6. r6 = 1
	MOVEQ r6, r2	;if r0 ==r5, MOV r2 into r6. r6 = 2
	
	LDR r5, [r7]	;load mem r7
	CMP r0, r5	;compare(r0 - r5)
	MOVMI r6, r3	;if r0 < r5, MOV r3 into r6. r6 = 3
	MOVGT r6, r1	;if r0 > r5, MOV r1 into r6. r6 = 1
	MOVEQ r6, r2	;if r0 ==r5, MOV r2 into r6. r6 = 2
	
	LDR r5, [r9]	;load mem r9
	CMP r0, r5	;compare(r0 - r5)
	MOVMI r6, r3	;if r0 < r5, MOV r3 into r6. r6 = 3
	MOVGT r6, r1	;if r0 > r5, MOV r1 into r6. r6 = 1
	MOVEQ r6, r2	;if r0 ==r5, MOV r2 into r6. r6 = 2	
	
TEMPADDR1	&	&00001000
TEMPADDR2	&	&00002000
TEMPADDR3	&	&00003000

	MOV pc, lr
	
	END	;mark end of file