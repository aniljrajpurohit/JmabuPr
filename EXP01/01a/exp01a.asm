;Exp 01a : Simple assembly langauge programming 8051 microcontroller
;A2 311036 Malhar Deshmukh
;6-Jul-2018

org 0000h
	setb psw.3			;enable bank 1
	mov r0,#50h			;destination
	mov r1,#30h			;source
	mov r3,#5h			;length of block stored in r3
		
MovData:	
	mov a,@r1			;move from addr in r1 to A
	mov @r0,a			;move to addr in r0 from A
	inc r0				;increment destination pointer
	inc r1				;increment source pointer
	djnz r3,Movdata 	;dec r3,jump if r3!=0
end
			