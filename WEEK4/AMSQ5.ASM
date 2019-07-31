		ORG	0000H
		MOV	R0,DPH
		MOV	R1,DPL
		MOV	B,#0
		
		CLR	C
		MOV	R6,#8
		
	MSB:	MOV	A,R0
		RLC	A
		MOV	R0,A
		MOV	A,B
		CPL	C	
		ADDC	A,#0
		MOV	B,A
		DJNZ	R6,MSB
		
		MOV	R6,#8
	LSB:	MOV	A,R1
		RLC	A
		MOV	R1,A
		MOV	A,B
		CPL	C	
		ADDC	A,#0
		MOV	B,A
		DJNZ	R6,LSB
		
		DA	A
		XCH	A,B
		SJMP	$
		
		
		
		
		
		END