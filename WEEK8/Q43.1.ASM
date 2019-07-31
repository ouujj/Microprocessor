
ORG	8000H
	CLR	EA
	MOV	SCON,#50H
	MOV	TMOD,#00100001B
	MOV	TH1,#0FDH
	SETB	TR1
RX_DATA			EQU		40H
			MOV		R0,#0FEH
					
MAIN_LOOP:		CALL		DELAY
			MOV		DPTR,#0E002H
			MOV		A,#6
			MOVX		@DPTR,A
			MOV		A,R0
			MOV		DPTR,#0E001H
			MOVX		@DPTR,A
			MOV		A,R0
				
IS_R:			CJNE		A,#"R",IS_L
			RR		A
			MOV		R0,A
			JMP		MAIN_LOOP
			
IS_L:			CJNE		A,#"L",IS_S
			RL		A
			MOV		R0,A						
			JMP		MAIN_LOOP
			
IS_S:			JMP		MAIN_LOOP
	
	
DELAY:			MOV		R5,#04
			
_DLY00:			MOV		R6,#255			
_DLY01:			MOV		R7,#255
_DLY02:			DJNZ		R7,_DLY02
			DJNZ		R6,_DLY01
			DJNZ		R5,_DLY00
			
			RET	

END