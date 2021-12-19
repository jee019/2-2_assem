 AREA test, CODE, READONLY
		ENTRY

start
	MOV r8, #39
	MOV r9, #65
	B GCD

GCD
	CMP r8, r9
	SUBGT  r8, r8, r9
	SUBLT  r9, r9, r8
	BNE GCD	;recursive
	
	END	;mark end of file