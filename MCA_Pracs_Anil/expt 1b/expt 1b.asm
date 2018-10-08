;EXPERIMENT: 1B
;Write an ALP to move a block of N byte of data fron source to destination.
;Assume that length of block is stored in R2 of bank 0. The source clock starts
;from memory location 0x40 and destination block begins from memory location 0x3000.
;Name: Anil Rajpurohit, Roll No: 312046, Batch - B2
;D.O.P - 4/7/18

	ORG 0000H
	MOV R0, #40H	;R0 acts as source for data block
	MOV DPTR,#3000H ;DPTR acts as destination for data block

	MOV R2,#05H		;Length of data block is stored in R2

L1: 				;Loop for transfering data one by one
    MOV A,@R0		;moving byte from source R0 to accumalator
	MOVX @DPTR,A	;moving byte from accumalator R0 to destination
	INC R0			;increment source R0 pointer
    INC DPTR		;increment destination DPTR Pointer
    DJNZ R2,L1  	;decrement the counter R3 and repeat the loop

	END