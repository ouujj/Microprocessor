		ORG	0000H
		MOV	R0,#40H
		MOV	R7,#8
		MOV	R5,#0
		MOV	R6,#0

LOOP:		CLR	C
		MOV	A,@R0
		ADD	A,R5
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