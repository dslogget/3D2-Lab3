	AREA	AsmTemplate, CODE, READONLY
	IMPORT	main

; (c) Mike Brady, 2011 -- 2019.

	EXPORT	start		
	IMPORT ReadKeyPress ;Import subroutine to read keys
	IMPORT IO1DIR
	IMPORT IO1CLR
	IMPORT IO1SET
	IMPORT Display

;Main loop
start
	;val in R5 = value to display

	LDR R5, =0
	LDR R1, =IO1DIR
	LDR R2, [R1]
	ORR	R2, #(2_1111<<16)
	STR R2, [R1]
	LDR R1, =IO1SET
	LDR R4, =(2_1111 << 16)
	STR R4, [R1]
	
	
	
LPST	
	LDR R2, =0
	
	
	BL ReadKeyPress	
	
;Switch statement for button presses
	CMP R0, #20
		BEQ CASE1
	CMP R0, #-20
		BEQ CASE1L
	CMP R0, #21
		BEQ CASE2
	CMP R0, #-21
		BEQ CASE2L
	CMP R0, #22
		BEQ DEFAULT
	CMP R0, #-22
		BEQ DEFAULT
	CMP R0, #23
		BEQ DEFAULT
	CMP R0, #-23
		BEQ DEFAULT
	
CASE1
	ADD	R5, R5, #(2_1 << 28)
	LSR R3, R5, #28
	B SwitchEnd
CASE2
	SUB	R5, R5, #(2_1 << 28)
	LSR R3, R5, #28
	B SwitchEnd
CASE1L
	LDR R3, =2_1111
	B SwitchEnd
CASE2L
	LDR R3, =2_1111
	B SwitchEnd
CASE3
CASE4
DEFAULT
SwitchEnd








;Display to LEDs

	MOV R1, R3
	
	BL Display
	
	
	B LPST
	

	END