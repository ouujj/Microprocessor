		ORG	0000H
		MOV	20H,R0
		MOV	21H,R1
		MOV	22H,R2
		MOV	23H,R3
		MOV	24H,R4
		MOV	25H,R5
		MOV	26H,R6
		MOV	27H,R7
		
		MOV	R0,#20H
		MOV	R7,#8
		MOV	R5,#0	;MSB
		MOV	R6,#0	;LSB
		
	LOOP:	CLR	C
		MOV	A,@R0
		ADDC	A,R5
		MOV	R5,A
		MOV	A,#0
		ADDC	A,R6
		MOV	R6,A
		MOV	A,#0
		INC	R0
		DJNZ	R7,LOOP
		
		MOV	A,R6
		MOV	DPTR,#9500H
		MOVX	@DPTR,A
		INC	DPTR
		MOV	A,R5
		MOVX	@DPTR,A
		SJMP	$
		
		
		
				
		END