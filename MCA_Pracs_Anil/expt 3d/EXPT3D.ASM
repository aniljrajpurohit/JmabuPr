;EXPERIMENT_3D: WRITE AN ALP TO INTERFACE DAC AND GENERATE SINE WAVEFORM
;NAME: ANIL RAJPUROHIT
;ROLL N0: 312046
;BATCH: B2
;DATE OF PERFORMANCE:1/8/2018
 
			ORG 0000H
				
			CLR A            		;clr accumulator
		L1:	MOV DPTR,#SINEWAVE   	;taking sine wave content in DPTR
			MOV R0,#72
			CLR P0.7         		;enable the dac wr line
		L2:	MOVC A,@A+DPTR   		;load content in accumulator
			MOV P1,A          		;load data in port 1
			CLR A
			INC DPTR         		;taking next content
			DJNZ R0,L2
			SJMP L1          		;continuous waveform
 
 
			ORG 0100H
SINEWAVE:	DB 128,138,150,160,170,180,191,201,209,217,224,231,238,242,246,250,253,254
			DB 255,254,253,250,246,242,238,231,224,217,209,201,191,181,170,160,150,115
			DB 128,117,106,96,84,74,64,55,46,38,31,25,18,13,9,5,2,1,0
			DB 0,1,2,5,9,13,18,25,31,38,46,55,64,74,84,96,106,117,126
	   
			END