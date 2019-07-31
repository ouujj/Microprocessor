	ORG 0000H
	MOV R0,#40H ;START READ RAMMOV 
	MOV DPTR,#9000H ;SAVE RAM
LOOP:   
	
	MOV  A,@R0
	INC R0
	CJNE A,B,LOOP	
        MOVX A,@DPTR
        ADD  A,#01H
        MOVX @DPTR,A
        CJNE R0,#80H,Loop
        
        JMP $
        END