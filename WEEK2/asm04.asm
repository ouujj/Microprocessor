	;4
	
	ORG 0000H
	MOV R0,#00H ;START READ RAM
	MOV DPTR,#9000H ;SAVE RAM
LOOP:   
        MOV A,R0
        MOVX @DPTR,A
        INC R0
        INC DPTR
        MOV A,DPH
        CJNE A,#91H,LOOP
        MOV A,DPL
        CJNE A,#000H,LOOP
       
        
        JMP $
        END