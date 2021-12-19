 AREA Pro3, CODE, READONLY
		ENTRY
	
Main
	LDR r0, Address1	;set up parameters
	MOV r1, #1			;r1=1
	LSL r2, r1, #1		;r2=2
	LSL r3, r2, #2		;r3=8
	ADD r3, r2, r3		;r3=10
	ADD r2, r1, r3		;r2=11
	MOV r1, #0			;r1=0
	MOV r8, #0			;r8=0
	MOV r9, #10			;number of loop
	
Loop
	ADD r1, r1, r2		;r1=r1+r2
	ADD r2, r2, #2		;n+2
	ADD r8, r8, #1		;loop+1
	CMP r8, r9			;loop=10?
	BEQ Endline			;10 loop ->END
	B Loop
	
Endline
	STR r1, [r0]			;save result into [r0]
	MOV pc, lr
	
Address1	&	&00004000

	END	;mark end of file