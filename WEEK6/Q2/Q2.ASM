		ORG	8000H
		MOV	P3,#0FFH
		MOV     TMOD,#00010001B 
	
LOOP:		JNB	P3.2,K1hz
		JNB	P3.3,K2hz
		JNB	P3.4,K4hz
		JNB	P3.5,K8hz
		JMP	LOOP
		
K1hz:		MOV	DPTR,#-460+23
		JMP	T_OFF

K2hz:		MOV	DPTR,#-230+23
		JMP	T_OFF

K4hz:		MOV	DPTR,#-115+23
		JMP	T_OFF

K8hz:		MOV	DPTR,#-57+23
		JMP	T_OFF

T_OFF:		CLR 	TR1 			; Stop Timer 4
		MOV 	A,#00H 			; Out Pulse 5
 		MOV 	P1,A 			; Out P1 6
 		PUSH	DPH
		PUSH	DPL
 		MOV 	DPTR,#0E000H 		; Out Sound 6
 		MOVX 	@DPTR,A 		; 7
 		POP 	DPH			
 		POP 	DPL			
 		MOV 	TH1,DPH 		; For TH1 9
 		MOV 	TL1,DPL 		; For TL1 10
 		CLR 	TF1 			; Initial Start 11
 		SETB 	TR1 			; Start Timer1 12
 		JNB 	TF1,$ 			; Wait Until TF On 13
 						; 14
 					
T_ON: 		CLR 	TR1 			; 1MC 15
 		MOV 	A,#0FFH 		; 1MC 16
		MOV 	P1,A			; 1MC 17
		PUSH	DPH			; 2MC 18
		PUSH	DPL			; 2MC 19
 		MOV 	DPTR,#0E000H 		; 2MC 20
 		MOVX 	@DPTR,A 		; 2MC 21
 		POP 	DPH			; 2MC 22
 		POP 	DPL			; 2MC 23
 		MOV 	TH1,DPH 		; 2MC 24
 		MOV 	TL1,DPL 		; 2MC 25
 		CLR 	TF1 			; 1MC 26
 		SETB 	TR1 			; 1MC 27
 		JNB 	TF1,$ 			; 2MC 28
 						; 29
 		JMP LOOP 
		
			
	
	
	END