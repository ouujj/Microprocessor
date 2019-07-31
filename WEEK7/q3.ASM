ORG	8000H

	CLR	EA
	MOV	TMOD,#00100001B
	MOV	SCON,#01010000B
	MOV	TH1,#0FDH
	MOV	DPTR,#0E060H
	SETB	TR1
	
Main_LOOP: CLR	RI
           JNB  RI,$
           MOV	A,SBUF

IS_0: CJNE A,#'0',IS_1
       MOV A,#3FH
       MOVX @DPTR,A
       JMP Main_LOOP	
IS_1: CJNE A,#'1',IS_2
       MOV A,#06H
       MOVX @DPTR,A
       JMP Main_LOOP
IS_2: CJNE A,#'2',IS_3
       MOV A,#5BH
       MOVX @DPTR,A
       JMP Main_LOOP
IS_3: CJNE A,#'3',IS_4
       MOV A,#4FH
       MOVX @DPTR,A
       JMP Main_LOOP
IS_4: CJNE A,#'4',IS_5
       MOV A,#66H
       MOVX @DPTR,A
       JMP Main_LOOP
IS_5: CJNE A,#'5',IS_6
       MOV A,#6DH
       MOVX @DPTR,A
       JMP Main_LOOP	
IS_6: CJNE A,#'6',IS_7
       MOV A,#7DH
       MOVX @DPTR,A
       JMP Main_LOOP
IS_7: CJNE A,#'7',IS_8
       MOV A,#07H
       MOVX @DPTR,A
       JMP Main_LOOP
IS_8: CJNE A,#'8',IS_9
       MOV A,#7FH
       MOVX @DPTR,A
       JMP Main_LOOP
IS_9: CJNE A,#'9',IS_A
       MOV A,#6FH
       MOVX @DPTR,A
       JMP Main_LOOP	       	       	       	                   	       	       		           
IS_A: CJNE A,#'A',IS_B
       MOV A,#77H
       MOVX @DPTR,A
       JMP Main_LOOP	           
IS_B: CJNE A,#'C',IS_C
       MOV A,#7CH
       MOVX @DPTR,A
       JMP Main_LOOP
IS_C: CJNE A,#'C',IS_D
       MOV A,#39H
       MOVX @DPTR,A
       JMP Main_LOOP
IS_D: CJNE A,#'D',IS_E
       MOV A,#5EH
       MOVX @DPTR,A
       JMP Main_LOOP
IS_E: CJNE A,#'E',IS_F
       MOV A,#79H
       MOVX @DPTR,A
       JMP Main_LOOP
IS_F: CJNE A,#'F',IS_ECT
       MOV A,#71H
       MOVX @DPTR,A
       JMP Main_LOOP	           
IS_ECT:
       MOV A,#60H
       MOVX @DPTR,A
       JMP Main_LOOP	           
       	           
       	           
       	           
       	           




END