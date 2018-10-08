;EXPT_2A: Parallel port interfacing of LEDs
;Problem statement: Flash alternate LEDs connected to port 2 
;by having 1 sec delay, generate delay using simple loops
;NAME: Anil Rajpurohit
;BATCH: B2, ROLL NO :312046
;DATE OF PERFORMANCE: 11/07/18
			
				ORG 0000H
		 AGAIN: MOV P2,#0b01010101			//For alternate flashing 
				ACALL DELAY					//Call delay of 1sec
				MOV P2,#0b10101010			//For alternate flashing
				ACALL DELAY					//Call delay of 1sec
				SJMP AGAIN					//Continue the loop
		
		 
		 DELAY: MOV R2,#07h					//Delay Subroutine
		    L1: MOV R1,#0FFH
            L2: MOV R0,#0FFH
            L3: DJNZ R0,L3
                DJNZ R1,L2			  
				DJNZ R2,L1
				RET
		END