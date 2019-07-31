		ORG	0000H
		MOV	DPTR,#9000H
		MOV	R7,#8
		MOV	R5,#0
		MOV	R6,#0
		

LOOP:		CLR	C
		MOVX	A,@DPTR
		ADD	A,R5
		MOV	R5,A
		MOV	A,#0
		ADDC	A,R6
		MOV	R6,A
		MOV	A,#0
		INC	DPTR
		DJNZ	R7,LOOP
		
		MOV	A,R6
		MOV	DPTR,#9500H
		MOVX	@DPTR,A
		
		INC	DPTR
		MOV	A,R5
		MOVX	@DPTR,A
		SJMP	$
		
		
		
				
		END