
	ORG 0000H
	MOV R0,#00H ;START READ RAM
	MOV DPTR,#1100H ;SAVE RAM
LOOP:   
        MOV A,R0
        MOVX @DPTR,A
        INC R0
        INC R0
        INC DPTR
        MOV A,DPH
        CJNE A,#11H,LOOP
        MOV A,DPL
        CJNE A,#020H,LOOP
       
        
        JMP $
        END