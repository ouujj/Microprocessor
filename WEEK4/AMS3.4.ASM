		ORG	0000H
		;987
		
		
		
		MOV	A,DPH
		ANL	A,#0FH
		MOV	R5,A
		MOV	A,DPL
		SWAP	A
		ANL	A,#0FH
		MOV	R6,A
		MOV	A,DPL
		ANL	A,#0FH
		MOV	R7,A
		
		MOV	A,R5
		MOV	B,#100
		MUL	AB
		MOV	21H,B
		MOV	22H,A
		MOV	A,R6
		MOV	B,#10
		MUL	AB
		MOV	31H,B
		MOV	32H,A
		
		MOV	DPH,#0
		MOV	DPL,R7
		CLR	C
		
		MOV	A,22H
		ADD	A,DPL
		MOV	DPL,A
		MOV	A,21H
		ADDC	A,DPH
		MOV	DPH,A
		
		MOV	A,32H
		ADD	A,DPL
		MOV	DPL,A
		MOV	A,31H
		ADDC	A,DPH
		MOV	DPH,A
		
		
			
		
		
		SJMP	$
		END
		
		