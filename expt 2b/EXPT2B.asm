;EXPT 2: Parallel port interfacing of LEDs
;Problem statement: 2B Flash alternate LEDs 
;connected to port 2 by having 1 sec delay, generate delay using TIMER.
;NAME: Anil Rajpurohit
;BATCH: B2, ROLL NO :312046
;DATE OF PERFORMANCE: 11/07/18
	

		ORG 0x0000	
		
		AGAIN: 	MOV P2,#0b01010101		;VALUE AT PORT2 TO GLOW ALTERNATE LED
				ACALL DELAY				;DELAY of 1s
				MOV P2,#0b10101010		;OTHER SET OF ALTERNATE LEDS GLOW
				ACALL DELAY				;DELAY of 1s 
				SJMP AGAIN				;JUMP TO AGAIN LOOP FOR LED BLINKING
				
				
				
	   DELAY: 	MOV R0,#0x14			;DELAY USING TIMER
		        MOV TMOD,#0x01			;MODE1 IS SELECTED 
		  L1:  	MOV TL0,#0x00			;INITIALISE TL0 = 0, FOR MAX COUNT
			    MOV TH0,#0x00			;INITIALISE TH0 = 0, FOR MAX COUNT, i.e (TH0TL0 = 0)
				SETB TR0				;START TIMER
	      L2:  	JNB TF0,L2 				;WAIT UNTIL TIMER OVERFLOWS, i.e COUNTS UPTO 65535
		        CLR TR0					;STOP TMER
				CLR TF0					;CLEAR
				DJNZ R0,L1				;continue the above opertaions for 14 times 

				RET			
				END			 