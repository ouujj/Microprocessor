				Data_count EQU 40H
Load_TH   EQU 41H
Load_TL   EQU 42H

	ORG 8000H
	JMP Start
	ORG 9F42H
	JMP Timer0_Intr
	ORG 8100H
Start: MOV TMOD,#000100001B
	SETB EA
	SETB ET0
	SETB TR0

Main_Loop:
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	
	MOV DPTR,#-1915+28	; c
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	MOV DPTR,#-1915+28	;c
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	MOV DPTR,#-1275+28	;g
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	MOV DPTR,#-1275+28	;g
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	MOV DPTR,#-1136+28	;a
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	MOV DPTR,#-1136+28	;a
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	
	MOV DPTR,#-1275+28	;g
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	
	MOV DPTR,#-1432+28	;f
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	MOV DPTR,#-1432+28	;f
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	MOV DPTR,#-1519+28	;e
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	MOV DPTR,#-1519+28	;e
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	
	MOV DPTR,#-1700+28	;d
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	MOV DPTR,#-1700+28	;d
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	
	MOV DPTR,#-1915+28	;c
	MOV Load_TH,DPH
	MOV Load_TL,DPL
	SETB TR0
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CALL xxDelay
	CLR TR0
	CALL xxDelay
	

	JMP Main_Loop

xxDelay:
	MOV R1,#1
	MOV B,#70H
	MOV A,#70H

_xxDLY00:
	DJNZ Acc,_xxDLY00
	DJNZ B,_xxDLY00
	DJNZ R1,_xxDLY00
	RET

Timer0_Intr:
	CLR TR0
	PUSH Acc
	PUSH DPH
	PUSH DPL
	MOV TH0,Load_TH
	MOV TL0,Load_TL
	SETB TR0
	MOV A,Data_count
	CPL A
	MOV Data_count,A
	MOV P1,A
	MOV DPTR,#0E000H
	MOVX @DPTR,A
	POP DPL
	POP DPL
	POP Acc
	RETI
END