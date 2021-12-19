 AREA Pro2, CODE, READONLY
		ENTRY
	
Main
	LDR r0, =Array1	;set up parameters
	LDR r1, Address1
	LDR r2, TEMPADDR1
	
	LDRB r3, [r0]	;r3=10
	STRB r3, [r2, #9]
	LDRB r3, [r0, #9]	;r3=1
	STRB r3, [r1]	;save 1 into address1
	
	LDRB r3, [r0, #1]	;r3=9
	STRB r3, [r2, #8]
	LDRB r3, [r0, #8]	;r3=2
	STRB r3, [r1, #1]	;save 2 into address1
	
	LDRB r3, [r0, #2]	;r3=8
	STRB r3, [r2, #7]
	LDRB r3, [r0, #7]	;r3=3
	STRB r3, [r1, #2]	;save 3 into address1
	
	LDRB r3, [r0, #3]	;r3=7
	STRB r3, [r2, #6]
	LDRB r3, [r0, #6]	;r3=4
	STRB r3, [r1, #3]	;save 4 into address1
	
	LDRB r3, [r0, #4]	;r3=6
	STRB r3, [r2, #5]!
	LDRB r3, [r0, #5]	;r3=5
	STRB r3, [r1, #4]	;save 5 into address1
	
	LDRB r3, [r2]
	STRB r3, [r1, #5]	;save 6 into address1
	
	LDRB r3, [r2, #1]
	STRB r3, [r1, #6]	;save 7 into address1
	
	LDRB r3, [r2, #2]
	STRB r3, [r1, #7]	;save 8 into address1
	
	LDRB r3, [r2, #3]
	STRB r3, [r1, #8]	;save 9 into address1
	
	LDRB r3, [r2, #4]
	STRB r3, [r1, #9]	;save 10 into address1
	
	MOV pc, lr
	
Array1 DCB 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
Address1	&	&00004000
TEMPADDR1	&	&00001000

	END	;mark end of file