org 0000h
jmp main

main:
	mov sp,#0x6f				;moved stack to 0x6f location
	
		loop:
			mov P2,#0x55		;Even Leds are ON
			acall delay1s		;call subroutine delay for 1 sec
			mov P2,#0xaa		;odd leds are on
			acall delay1s		;call subroutine delay for 1 sec
			jmp loop			;loop forever



delayms:						;1ms delay loop
	mov 0x20,#230 ;2cycles
	L:
		djnz 0x20,L
		
	mov 0x20,#230 ;2cycles
	L1:
		djnz 0x20,L1
ret

delay1s:
	mov 0x21,#250
	l2:
	acall delayms
	acall delayms
	acall delayms
	acall delayms
	djnz 0x21,l2
ret	
	