		ORG 0000H
		
		;STEP1 MAKE DIGIT
		
		MOV	A,40H
		SWAP	A
		ANL	A,#0FH
		MOV	50H,A
		MOV	A,40H
		ANL	A,#0FH
		MOV	51H,A
		
		MOV	A,41H
		SWAP	A
		ANL	A,#0FH
		MOV	52H,A
		MOV	A,41H
		ANL	A,#0FH
		MOV	53H,A
		
		MOV	A,42H
		SWAP	A
		ANL	A,#0FH
		MOV	54H,A
		MOV	A,42H
		ANL	A,#0FH
		MOV	55H,A
		
		;STEP2 SET ZERO && SET @DIGIT
		
		
		MOV	60H,#00
		MOV	61H,#00
		MOV	62H,#00
		MOV	5FH,#00
		
		MOV	R0,#50H
		
		;STEP3 MULTIPEL BY 10
		
LOOP:		CLR	C
		
		MOV	A,62H
		MOV	B,#10
		MUL	AB
		MOV	62H,A
		MOV	R6,B
		
		MOV	A,61H
		MOV	B,#10
		MUL	AB
		ADD	A,R6
		MOV	61H,A
		MOV	R6,B
		
		MOV	A,60H
		MOV	B,#10
		MUL	AB
		ADDC	A,R6
		MOV	60H,A
		
		MOV	A,B
		ADDC	A,#00
		MOV	5FH,A
		
		;STEP4 PULS BY MOST DIGIT
		
		CLR	C
		
		MOV	A,@R0
		ADD	A,62H
		MOV	62H,A
		
		MOV	A,61H
		ADDC	A,#00H
		MOV	61H,A
		
		MOV	A,60H
		ADDC	A,#00H
		MOV	60H,A
		
		MOV	A,5FH
		ADDC	A,#00H
		MOV	5FH,A
		
		INC	R0
		CJNE	R0,#56H,LOOP
		
		SJMP	$
		
		
		END