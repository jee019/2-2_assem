 AREA Pro1, CODE, READONLY
		ENTRY

start
	LDR r10, TEMPADDR1
	MOV r9, #0x00080000
	STR r9, [r10]	;save r9 at mem r10
	
	LDR r12, TEMPADDR2
	MOV r11, #0x00000000
	STR r11, [r12]	;save r11 at mem r12
	
	LDR r1, [r10]					;load num1
	MOV r2,  r1, LSR #31		;r2 = sign bit
	MOV r3, r1, LSL #1			;remove sign bit
	MOV r3, r3, LSR #23			;r3 = exponent bits
	MOV r4,  r1, LSL #9			;remove sign bit+exponent bits
	MOV r4, r4, LSR #9			;r4 = mantissa bits
	ADD r4, #0x00800000		;put 1 in front of matissa bits
	
	LDR r5, [r12]					;load num2
	MOV r6, r5, LSL #1			;remove sign bit
	MOV r6, r6, LSR #23			;r6 = exponent bits
	MOV r7,  r5, LSL #9			;remove sign bit+exponent bits
	MOV r7, r7, LSR #9			;r7 = mantissa bits
	ADD r7, #0x00800000		;put 1 in front of matissa bits
	
	CMP r3, r6						;compare exponent bits
	SUBGT r9, r3, r6				;shift num(r9) = r3-r6, if r3 > r6
	MOVGT r7, r7, LSR r9		;shift matissa bits by shift num(r9)
	SUBMI r9, r6, r3				;shift num(r9) = r6-r3, if r3 < r6
	MOVMI r4, r4, LSR r9		;shift matissa bits by shift num(r9)
	MOVMI r3, r6					;current exponent bits = r3 = r6
	
	ADD r9, r4, r7					;add matissa bits
	CMP r9, #0x01000000		;compare
	ADDPL r3, #0x00000001	;fix exponent bits(normalize)
	MOVPL r9, r9, LSR #1		;fix matissa bits(normalize)
	MOV r3, r3, LSL #23			;r3 = exponent bits
	MOV r12, r3						;set exponent bits
	
	MOV r9, r9, LSL #9
	MOV r9, r9, LSR #9
	ADD r12, r9						;set matissa bits
	ADD r12, r2, LSL #31		;set sign bit
	
	LDR r0, ADDRESS1
	STR r12, [r0]	;save result at mem r0(Address)
	
ADDRESS1	&	&00004000
TEMPADDR1	&	&00200000
TEMPADDR2	&	&00300000

	END	;mark end of file