	AREA	DisplayCode, CODE, READONLY
	IMPORT IO1DIR
	IMPORT IO1CLR
	IMPORT IO1SET
		
	; Display 4 LSbs the value of R1 to the display
	EXPORT Display
	
Display
	STMFD 	sp!, 	{R0, R2-R12, lr}				;Store all registers that don't return a value
	LDR R2, =(2_1111 << 16)
	LDR R0, =IO1DIR
	STR R2, [R0]
	LDR R2, =0
	TST R1, #2_1000
	ORRNE R2, #2_0001
	TST R1, #2_0100
	ORRNE R2, #2_0010
	TST R1, #2_0010
	ORRNE R2, #2_0100
	TST R1, #2_0001
	ORRNE R2, #2_1000
	LDR R0, =IO1SET
	LDR R4, =(2_1111 << 16)
	STR R4, [R0]
	LDR R0, =IO1CLR
	LSL R2, #16
	STR R2, [R0]
	LDMFD 	sp!, 	{R1-R12, pc}
	
	
	END