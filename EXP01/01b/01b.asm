;Exp 01b : Simple assembly langauge programming 8051 microcontroller
;A2 311036 Malhar Deshmukh
;6-Jul-2018

org 0000h
	mov r1,#40h			;source
	mov DPTR,#3000h		;destination
	mov r2,#5h			;length of block = 5  stored in r2
		
MovData:	
	mov a,@r1			;move from addr in r1 to A
	movx @DPTR,a		;move to addr in external RAM from A,
						;  DPTR pinting to address
	inc DPTR			;increment destination pointer
	inc r1				;increment source pointer
	djnz r2,Movdata 	;dec r2,jump if r2!=0
end
			