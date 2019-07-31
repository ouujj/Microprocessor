	P_TestIn EQU P3.4
Counter EQU 40H

 ORG 8000H
 CLR EA
 SETB P_TestIn ; Input Port
 MOV Counter,#0
Main_Loop: CALL Display
 JB P_TestIn,$
 JNB P_TestIn,$
 INC Counter
 CALL Delay_XXX
 JMP Main_Loop

Display: MOV A,Counter
 ANL A,#0FH
 MOV DPTR,#CODE_TABLE
 MOVC A,@A+DPTR
 MOV DPTR,#0E060H
 MOVX @DPTR,A
 RET

CODE_TABLE: DB 3FH,06H,5BH,4FH
 DB 66H,6DH,7DH,07H
 DB 7FH,6FH,77H,7CH
 DB 79H,5EH,79H,71H

Delay_XXX: CLR A
 MOV B,#200
_Dly00: DJNZ Acc,_Dly00
 DJNZ B,_Dly00
 RET

 END 