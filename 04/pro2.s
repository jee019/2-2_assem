 AREA Pro2, CODE, READONLY
		ENTRY
	
start
	LDR r10, TempAd	;set up parameters
	MOV r0, #10
	MOV r1, #11
	MOV r2, #12
	MOV r3, #13
	MOV r4, #14
	MOV r5, #15
	MOV r6, #16
	MOV r7, #17
	MOV r9, #160
	B doRegister
	B doGCD
	
stop
	MOV pc, #0
	
doRegister
	STMIA r10!, {r0-r7}	;store initial register value
	ADD r1, #1	;1 == r1 index value
	ADD r2, #2
	ADD r3, #3
	ADD r4, #4
	ADD r5, #5
	ADD r6, #6
	ADD r7, #7
	ADD r8, r0, r1	;r8 = r0+r1+...+r7
	ADD r8, r8, r2
	ADD r8, r8, r3
	ADD r8, r8, r4
	ADD r8, r8, r5
	ADD r8, r8, r6
	ADD r8, r8, r7

doGCD	;calculate GCD
	CMP r8, r9
	SUBGT  r8, r8, r9
	SUBLT  r9, r9, r8
	BNE doGCD	;recursive
	BEQ doSave
	
doSave
	LDR r10, TempAd
	LDMIA r10!, {r9}	;r9 == initial r0 value
	ADD r0, r0, r9	;r0 = r0+r9(initial r0 value)
	LDMIA r10!, {r9}
	ADD r1, r1, r9
	LDMIA r10!, {r9}
	ADD r2, r2, r9
	LDMIA r10!, {r9}
	ADD r3, r3, r9
	LDMIA r10!, {r9}
	ADD r4, r4, r9
	LDMIA r10!, {r9}
	ADD r5, r5, r9
	LDMIA r10!, {r9}
	ADD r6, r6, r9
	LDMIA r10!, {r9}
	ADD r7, r7, r9
	LDR r10, Address
	STMIA r10!, {r8}	;save GCD
	STMIA r10!, {r0-r7}	;save r0-r7
	B stop

TempAd	&	&00000000
Address	&	&00040000
	
	END	;mark end of file