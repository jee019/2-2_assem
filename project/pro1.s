 AREA Pro1, CODE, READONLY
		ENTRY
;==(1) Graph map update===================================
Start
	MOV r0, #5								;set the number of nodes
map	DCD	0, 10, 0, 4, 0
		DCD 6, 0, 15, 0, 1
		DCD 6, 11, 0, 8, 0
		DCD 9, 0, 8, 0, 5
		DCD 0, 8, 4, 0, 0					;graph map	
	
;==(2) Greedy search=======================================
Set
	MOV r4, #0								;seleted node
	MOV r5, #4
	MUL r6, r0, r5							;4 byte*(number of nodes)
	MOV r7, #0								;the number of paths
	LDR r10, w_data						;load data address
Cnt
	MUL r5, r4, r6							;move node
	LDR r9, =map							;load map
	LDR r3, [r9, r5]!						;load weight
	MOV r1, #0								;count compared nodes
	MOV r2, #16								;minimum weight
	MOV r4, #0								;seleted node
Search
	LDR r3, [r9], #4						;load next node weight
	CMP r1, r0								;compared nodes==number of nodes?
	ADDEQ r7, #1							;path+1
	BEQ Savew								;save minimum weight
	ADD r1, #1								;compared node+1	
	CMP r3, #0								;weight==0?
	BEQ Search								;YES->not connected
	CMP r2, r3								;compare(R1-R2)
	MOVGT r2, r3							;if R1 > R2, update minimum
	MOVGT r4, r1							;if R1 > R2, update selected node
	B Search									;continue search
		
;==(3) Save weight==========================================
Savew
	STMEA r10!, {r2}						;push weight
	CMP r0, r4								;target node?	
	BEQ Calculate							;YES->calculate sum&avarage
	SUB r4, r4, #1							;node number - 1
	B Cnt										;NO->continue search(move to next node)
	
;==(4) Calculation(sum&avarage)=============================
Calculate
	MOV r8, #0								;sum of weight
	MOV r9, #0								;count loop
Sum
	LDMEA r10!, {r2}						;pop weight to R2
	ADD r8, r8, r2							;add weight value
	ADD r9, r9, #1							;loop+1
	CMP r7, r9								;add all data?
	LDREQ r10, w_sum					;YES->load SUM address
	STREQ r8, [r10]						;YES->save sum result
	BEQ Avarage							;YES->caculate avarage
	B Sum										;NO->add next data

Avarage
	LDR r10, w_avar						;load AVARAGE address
	MOV r1, #0								;count N
	MOV r2, #2								;2
	MOV r3, #1								;2^N
	
;convert integer into floating point number
Loop1
	CMP r8, r3								;R8 < R3?
	BLT Float1								;YES->found N
	ADD r1, #1								;NO->N+1
	MOV r0, r3
	MUL r3, r0, r2							;NO->2^(N+1)
	B Loop1									;NO->continue
Float1
	MOV r4, r1								;N+1=>R4
	MOV r8, r8, LSL #24					;set mantissa bits
	MOV r8, r8, LSR r1					;R8=>mantissa bits
	
	MOV r1, #0								;count N
	MOV r2, #2								;2
	MOV r3, #1								;2^N
Loop2
	CMP r7, r3								;R7 < R3?
	BLT Float2								;YES->found N
	ADD r1, #1								;NO->N+1
	MOV r0, r3
	MUL r3, r0, r2							;NO->2^(N+1)
	B Loop2									;NO->continue
Float2
	MOV r7, r7, LSL #24					;set mantissa bits
	MOV r7, r7, LSR r1					;R7=>mantissa bits
	
;==DIV_step1.subtract exponents & add bias
	SUB r4, r4, r1							;subtraction of exponent bits
	ADD r4, r4, #127						;add 127
;==DIV_step2.divide mantissas
	MOV r9, #1								;count loop
	MOV r6, #0								;0
Division
	CMP r9, #24								;division end?
	BEQ Normalize							;YES->normalize
	CMP r8, r7								;R8 >= R7?
	ADDGE r6, r6, #1						;YES->R6+1
	SUBGE r8, r8, r7						;YES->R8-R7
	MOV r6, r6, LSL #1					;shift left R6
	MOV r8, r8, LSL #1					;shift left R8
	ADD r9, #1								;loop+1
	B Division									;NO->continue divisionDivision
;==DIV_step3.normalize
Normalize
	CMP r6, #0x00800000				;need to normalize mantissa?
	MOVLT r6, r6, LSL #1				;YES->shift left mantissa bits
	SUBLT r4, r4, #1						;YES->fix exponent bits
	MOV r4, r4, LSL #23         		;set result exponent bits
	SUB r6, r6, #0x00800000			;remove 1 in front of mantissa bits
	ADD r1, r4, r6              				;exponent bits+mantissa bits
	STR r1, [r10]							;save avarage
	
;==(5) Program end==========================================
Endpro
	MOV pc, #0								;end of program
	
;==Address==============================================
w_data	&	&00005000					;weight data
w_sum &	&00100000					;sum of weight
w_avar &	&01000000                    ;weight avarge
	END											;mark end of file