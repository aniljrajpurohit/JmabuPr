; EXPERIMENT NO. 1 
; PROGRAM STATEMENT- Write an ALP to move a block of N bytedata from source destinitiom. 
; Asume that length of block is stored in R3 of bank 1, the source block starts from 
; memory location 0x30 and destination block begins from memory location ox50.
; Name: Anil Rajpurohit, Roll no - 312046, Batch - B2
; Date of performance - 4/7/18
		
		
		ORG 0000H
		
		SETB PSW.3		;Select bank 1
		MOV R0,#30H		;R0 holding source address
		MOV R1,#50H		;R1 holding destination address
		MOV R3,#10		;no of bytes to be transfered, R3 act as counter
	L1:	MOV A,@R0		;data from source to A
		MOV @R1,A		;data from a to destination
		INC R0			;go to next source address 40
		INC R1 			;go to next dest address
	 
		DJNZ R2,L1		;check all the data transfer
	 
		END	