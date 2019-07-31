		ORG	0000
		
		MOV	A,DPH
		SWAP	A
		ANL	A,#0FH
		MOV	R4,A
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

		
		MOV	A,R4
		RL	A
		PUSH	ACC
		MOV	DPTR,#xTable
		MOVC	A,@A+DPTR
		MOV	B,A
		POP	ACC
		INC	A
		MOVC	A,@A+DPTR
		MOV	DPL,A
		MOV	DPH,B
		
		CLR	C
		
		MOV	A,R7
		ADD	A,DPL
		MOV	DPL,A
		
		MOV	A,DPH
		ADDC	A,#0H
		MOV	DPH,A
		
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
		
		JMP	$
		
		
xTable:	DW	0000,1000,3000,4000
	DW	5000,6000,7000,8000,9000
	
	END		