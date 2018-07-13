;Exp 01a : Simple assembly langauge programming 8051 microcontroller
;A2 311036 Malhar Deshmukh
;6-Jul-2018

org 0000h
	
	mov 30h,#34h ;move a packed BCD number 
				 ;into given location
	mov a,30h	 ;get the number in A 
	anl a,#0f0h	 ;Logically AND A with 11110000
				 ;this gets us the MSB number
	swap a		 ;move the digit to lower side
	mov r1,a	 ;move the MSB digit to R1
	mov a,30h	 ;move the original numbe rinto a again
	anl a,#0fh   ;Separate the LSB by logically ANDing 
				 ; A with 00001111
	mov r0,a	 ;move the LSB digit to R0
	mov b,r1	 ;get the MSB digit into B
	mul ab		 ;multiply A with B
	mov r7,a	 ;the result of multipication is 
				 ; Stored in R7
	mov b,#10	 ;move 10 in b
	div ab		 ;Divide A by B(10) to get the Ten's place in the 
				 ; Result of multiplication into A as Quotiant and 
				 ; the Unit's place into B as Remiander
	swap a	     ;move the Digit to MSB
	orl a,b		 ;as A has the digit at Ten's place in MSB,
				 ;and B has the digit at units place,
				 ;Logically Or those together
				 ;to get a number in packed BCD format
	mov 31h,a	 ;Move the result into 31h as required
	
end
		