;EXPT_2C: Parallel port interfacing of LEDs
;Problem statement: WRITE AN ALP TO DISPLAY BCD NUMBERSON PORT 2.
;NAME: ANIL RAJPUROHIT 
;BATCH: B2, ROLL NO :312046
;DATE OF PERFORMANCE: 11/07/18

		ORG 0000H		
			
		MOV A,#00H		;INITIALIZE A WITH 00H
		MOV R1,#100D    ;INITIALIZE R1 WITH COUNT 99	
	L4: MOV P2,A		;COPY A IN P2
	    INC A			;INCREMENT A
		DA A			;ADJUST THE NUMBER IN A TO DECIMAL VALUE 
		ACALL DELAY		;CALL DELAY 
		DJNZ R1,L4		;DECREMENT R1 AND JUMP TO L1
		
		
 DELAY: MOV R2,#07		;LOOP FOR SEVEN REPETATION
    L1: MOV R1,#0FFH	
    L2: MOV R0,#0FFH	
    L3: DJNZ R0,L3		;Decrement jump till r0!=0
        DJNZ R1,L2		;Decrement jump till r1!=0	  
	    DJNZ R2,L1		;Decrement jump till r2!=0
		
	    RET
		END