ORG	0000H
JMP	START

ORG	0100H
START:	CLR	C
ORL	P1,#0FH
ANL	P1,#0FH	
MOV	DPTR,#XTABLE
MOV	R6,#-1

LOOP:	MOV	A,R7
ADD	A,R6
ANL	A,#0FH
MOV	R7,A
MOVC	A,@A+DPTR
MOV	P3,A
CALL	DLY00
JMP	LOOP

XTABLE:	DB	3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH
		
		
	

DLY00 :	MOV	R0,#6
_DLY00:	JNB	P1.0,_SetUP
	JNB	P1.3,_SetDW

	DJNZ	Acc,_DLY00
	DJNZ	B,_DLY00

	DJNZ	R0,_DLY00
	RET

_SetUP:	MOV	R6,#1
	SETB	P1.4
	CLR	P1.7	
	RET

_SetDW:	MOV	R6,#-1
	SETB	P1.7	
	CLR	P1.4
	RET

END

;	DB	3FH,06H,5BH,4FH
;	DB	66H,6DH,7DH,07H
;	DB	7FH,6FH,77H,7CH
;	DB	39H,5EH,79H,71H
	