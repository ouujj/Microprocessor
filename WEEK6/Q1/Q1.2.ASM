;Q1

;Make frequency @ 1431 and 2431 Hz
; f =1431Hz , t=0.698812019 mSec ,t/2 = 0.349406009 ,MC =322
; f =2431Hz , t=0.411353352 mSec ,t/2 = 0.205676676 ,MC =189.56 ~190	

;Make frequency @ 1KHz with 66% of duty circle 
;1mSec = 921.6589862 MC
;@T_ON : 921.65*0.66 = 608.29 ,@T_OFF : 921.65*0.34 = 313.36

	
		
		ORG	8000H
		MOV TMOD,#00010001B 	; Timer0,1 Mode1 16Bit 2 
		
T_OFF: 		CLR TR1 		; Stop Timer 4
 		MOV A,#00H 		; Out Pulse 5
 		MOV P1,A 		; Out P1 6
 		MOV DPTR,#0E000H 	; Out Sound 6
 		MOVX @DPTR,A 		; 7
		MOV DPTR,#-160+17	; Reload Data 8
 		MOV TH1,DPH 		; For TH1 9
 		MOV TL1,DPL 		; For TL1 10
 		CLR TF1 		; Initial Start 11
		SETB TR1		; Start Timer1 12
 		JNB TF1,$ 		; Wait Until TF On 13
 					; 14
T_ON: 		CLR TR1 		; 1MC 15
 		MOV A,#0FFH 		; 1MC 16
		MOV P1,A 		; 1MC 17
 		MOV DPTR,#0E000H 	; 2MC 18
 		MOVX @DPTR,A 		; 2MC 19
 		MOV DPTR,#-484+17 	; 2MC 20
 		MOV TH1,DPH 		; 2MC 21
	 	MOV TL1,DPL 		; 2MC 22
 		CLR TF1 		; 1MC 23
 		SETB TR1 		; 1MC 24
 		JNB TF1,$ 		; 2MC 25
 					; 26
 		JMP T_OFF ; 
		
END