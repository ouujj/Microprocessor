RX_DATA			EQU		40H
T2CON			EQU		0C8H
RCAP2H			EQU		0CBH
RCAP2L			EQU		0CAH

			ORG		8000H
			JMP		8100H
			
			ORG		9F4BH
			JMP		ES_ISR
			
			ORG		8100H
			CALL		DELAY
			
			MOV		SCON,#50H
			MOV		RCAP2H,#0FFH
			MOV		RCAP2L,#0DCH
			MOV		T2CON,#34H
			
			MOV		IE,#10010000B
			SETB		TR1
			
			MOV		A,#0CH
			MOV		SBUF,A
			JNB		TI,$
			MOV		RX_DATA,#"R"
			MOV		R0,#01H	
			
			MOV		DPTR,#0E002H
			MOV		A,#6
			MOVX		@DPTR,A
			
MAIN_LOOP:		
			MOV		A,R0
			MOV		DPTR,#0E001H
			MOVX		@DPTR,A
			MOV		A,RX_DATA
				
IS_R:			CJNE		A,#"R",IS_L
			PUSH		ACC
			MOV		A,R0
			RRC		A
			MOV		R0,A
			POP		ACC
			JMP		MAIN_LOOP
			
IS_L:			CJNE		A,#"L",IS_S
			PUSH		ACC
			MOV		A,R0
			RL		A
			MOV		R0,A
			MOV		RX_DATA,A
			POP		ACC						
			JMP		MAIN_LOOP
			
IS_S:			JMP		MAIN_LOOP


DELAY:			MOV		R5,#04
			
_DLY00:			MOV		R6,#255			
_DLY01:			MOV		R7,#255
_DLY02:			DJNZ		R7,_DLY02
			DJNZ		R6,_DLY01
			DJNZ		R5,_DLY00
			
			RET

ES_ISR:			CLR		ES
			JB		TI,XSRI
			PUSH		ACC
			MOV		A,SBUF
			MOV		SBUF,A
			MOV		RX_DATA,A
			POP		ACC
XSRI:			CLR		TI
			CLR		RI
			SETB		ES
			RETI
			
			
			
																				
			
			
			
			
			END