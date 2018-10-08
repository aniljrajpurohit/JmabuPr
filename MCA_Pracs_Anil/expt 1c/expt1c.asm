;EXPT-1C:SIMPLE ALP 8051 MICROCONTROLLER
;PROBLEM STSTEMENT: A two digit BCD number to be stored in location 30h.
;Write ALP to unpack this BCD number. Store the MSB in R1 and LSB in R0. 
;Find Product of Both these and store result in packed BCD in 31h.
;NAME: Anil Rajpurohit
;ROLL NO- 312046, BATCH: B2
;DATE OF PERFORMANCE: 11/07/18

		ORG 0000H		
			
		MOV 30H,#46H	;STORE BCD NUMBER TO 30H LOCATION
		MOV A,30H 		;A = 46H, packed BCD from 30H location
		ANL A,#0FH		;MASK THE UPPER nibble (A = 06)
		MOV R0,A		;LSB IN R0
		MOV A,30H		;GET ORIGNAL DATA
		ANL A,#0F0H 	;MASK LOWER nibble (A = 40)
		RL A			;ROTATE LEFT 
		RL A			;ROTATE LEFT
		RL A			;ROTATE LEFT
		RL A			;ROTATE LEFT (A=04)
		MOV R1,A        ;STORE MSB IN R1
		MOV B,R1		;MSB COPIED TO REGISTER B
		MOV A,R0		;LSB COPIED TO REGISTER A
		MUL AB			;MULTIPLICATION OF LSB AND MSB DONE
		MOV B,#0AH		;store 0x0A in B
		DIV AB			;divide A by B
		SWAP A			;we get decimal number stored in a swap it
		ORL A,B			;logical or to get packed BCD
		MOV 31H,A		;STORE DATA IN 31 LOCATION
		
		END
		
		
