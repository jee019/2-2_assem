 AREA Pro1, CODE, READONLY
		ENTRY
	
start
	LDR r10, Address
	MOV r0, #9
	MOV r1, #1
	MOV r2, #2
	MOV r3, #3
	MOV r4, #4
	MOV r5, #5
	MOV r6, #6
	MOV r7, #7
	
	STMFD r10!, {r0}	;push r0
	LDMFD r10!, {r8}	;pop r0 to r8
	
	STMFD r10!, {r2}	;push r2
	LDMFD r10!, {r0}	;pop r2 to r0
	
	STMFD r10!, {r3}	;push r3
	LDMFD r10!, {r2}	;pop r3 to r2
	
	STMFD r10!, {r4}	;push r4
	LDMFD r10!, {r9}	;pop r4 to r9
	
	STMFD r10!, {r5-r7}	;push r5~r7
	LDMFD r10!, {r3-r5}	;pop to r3~r5
	
	STMFD r10!, {r1}	;push r1
	LDMFD r10!, {r6}	;pop r1 to r6
	
	STMFD r10!, {r8}	;push r8(=r0)
	LDMFD r10!, {r1}	;pop r8 to r1
	
	STMFD r10!, {r9}	;push r9(=r4)
	LDMFD r10!, {r7}	;pop r9 to r7
	
	MOV pc, lr

Address	&	&00040000
	
	END	;mark end of file