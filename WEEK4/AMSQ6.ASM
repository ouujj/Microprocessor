		ORG	0000H
		MOV	R0,#40H
		MOV	R5,#0
		MOV	R6,#0

	
	LOOP:	MOV	R7,#8
		CLR	C
		
	MSB:	MOV	A,@R0
		RLC	A
		MOV	@R0,A
		MOV	A,R6
		CPL	C	
		ADDC	A,#0
		DA	A
		MOV	R6,A
		MOV	A,R5
		ADDC	A,#0
		DA	A
		MOV	R5,A
		
		DJNZ	R7,MSB
		
		INC	R0
		CJNE	R0,#80H,LOOP
		
		MOV	DPL,R6
		MOV	DPH,R5
		
		
		
		
	
		SJMP	$
		
		
		
		END