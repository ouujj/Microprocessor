	ORG 0000H
	MOV R0,#70H ;START READ RAM
	MOV R1,#10H ;STOP-START+1
	MOV DPTR,#9000H ;SAVE RAM
LOOP:   
 	MOV  A,@R0
        MOVX @DPTR,A
       
        INC R0
        INC DPTR
        DJNZ R1,Loop
        
        JMP $
        END