ORG	8000H

	CLR	EA
	MOV	TMOD,#00100001B
	MOV	SCON,#01010000B
	MOV	TH1,#0FDH
	MOV	DPTR,#0E060H
	SETB	TR1
	
Main_LOOP:  
          
           CLR	RI
           JNB  RI,$
           MOV	A,SBUF


       		
	
IS_1: CJNE A,#'1',IS_2
       MOV A,#06H
       MOVX @DPTR,A
       MOV   R0,#1
       CALL BLINK
       JMP Main_LOOP
IS_2: CJNE A,#'2',IS_3
       MOV A,#5BH
       MOVX @DPTR,A
       MOV   R0,#2
       CALL BLINK
       JMP Main_LOOP
IS_3: CJNE A,#'3',IS_4
       MOV A,#4FH
       MOVX @DPTR,A
       MOV   R0,#3
       CALL BLINK
       JMP Main_LOOP
IS_4: CJNE A,#'4',IS_5
       MOV A,#66H
       MOVX @DPTR,A
       MOV   R0,#4
       CALL BLINK
       JMP Main_LOOP
IS_5: CJNE A,#'5',IS_6
       MOV A,#6DH
       MOVX @DPTR,A
       MOV   R0,#5
       CALL BLINK
       JMP Main_LOOP	
IS_6: CJNE A,#'6',IS_7
       MOV A,#7DH
       MOVX @DPTR,A
       MOV   R0,#6
       CALL BLINK
       JMP Main_LOOP
IS_7: CJNE A,#'7',IS_8
       MOV A,#07H
       MOVX @DPTR,A
       MOV   R0,#7
       CALL BLINK
       JMP Main_LOOP
IS_8: CJNE A,#'8',IS_9
       MOV A,#7FH
       MOVX @DPTR,A
       MOV   R0,#8
       CALL BLINK
       JMP Main_LOOP
IS_9: CJNE A,#'9',IS_ECT
       MOV A,#6FH
       MOVX @DPTR,A
       MOV   R0,#9
       CALL BLINK
       JMP Main_LOOP	       	       	       	                   	       	       		           
           
IS_ECT: 
	
       SETB P3.2
       MOV A,#40H
       MOVX @DPTR,A
       JMP Main_LOOP	           
       	           
   BLINK: CLR P3.2
       CALL DELAY
      SETB P3.2
       CALL DELAY
       DJNZ R0,BLINK

	RET
	
DELAY: MOV R1,#255
DEL0:  MOV R2,#255
DEL1:  DJNZ R2,DEL1
       DJNZ R1,DEL0
       RET     	           
       	           
       	           




END