 AREA Pro2, CODE, READONLY
		ENTRY
	
start
	LDR r0, Address
	MOV r1, #1	;r1=1!
	MOV r11, #2	;set up parameters
	MUL r2, r1, r11	;r2=2!
	ADD r11, r11, #1
	MUL r3, r2, r11	;r3=3!
	ADD r11, r11, #1
	MUL r4, r3, r11	;r4=4!
	ADD r11, r11, #1
	MUL r5, r4, r11	;r5=5!
	ADD r11, r11, #1
	MUL r6, r5, r11	;r6=6!
	ADD r11, r11, #1
	MUL r7, r6, r11	;r7=7!
	ADD r11, r11, #1
	MUL r8, r7, r11	;r8=8!
	ADD r11, r11, #1
	MUL r9, r8, r11	;r9=9!
	ADD r11, r11, #1
	MUL r10, r9, r11	;r10=10!
	
	STR r1, [r0]	;save result
	STR r2, [r0]
	STR r3, [r0]
	STR r4, [r0]
	STR r5, [r0]
	STR r6, [r0]
	STR r7, [r0]
	STR r8, [r0]
	STR r9, [r0]
	STR r10, [r0]
	
	MOV pc, lr

Address	&	&00040000
	
	END	;mark end of file