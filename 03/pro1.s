 AREA Pro1, CODE, READONLY
		ENTRY
	
start
	LDR r0, Address
	MOV r1, #1	;r1=1!
	MOV r11, #3
	ADD r2, r1, LSL #1	;r2=2!
	ADD r3, r11, LSL #1	;r3=3!
	ADD r4, r11, LSL #3	;r4=4!
	ADD r11, r11, r3
	ADD r11, r11, r3
	ADD r5, r11, LSL #3	;r5=5!
	ADD r11, r11, r11, LSL #1
	ADD r6, r11, LSL #4	;r6=6!
	ADD r11, r6, r6, LSL #2
	ADD r7, r11, r6, LSL #1	;r7=7!
	ADD r8, r7, LSL #3	;r8=8!
	ADD r9, r8, r8, LSL #3	;r9=9!
	ADD r10, r9, r9, LSL #3
	ADD r10, r10, r9	;r10=10!
	
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