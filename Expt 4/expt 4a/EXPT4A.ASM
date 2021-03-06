;EXPERIMENT_4A: LCD INTERFACING IN 8 BIT MODE FOR DISPLAYING 'WELCOME TO VIIT'
;SUCH THAT 'WELCOME' ON FIRST LINE AND 'TO VIIT' ON SECOND LINE.
;NAME - ANIL RAJPUROHIT
;ROLL NO.312046, BATCH -B2
;DATE OF PERFORMANCE - 25/7/18


		ORG 000H
		RS EQU P2.0
		EN EQU P2.1
		RW EQU P2.2
		LCD EQU P0
	
		MOV A,#38H    ;TO INITIALIZE LCD AS 8 BIT,5*7 RESOLUTION, 2 LINE
		ACALL COMMAND ;SEND COMMAND TO LCD

		MOV A,#0EH    ;TURN ON THE DISPLAY AND CURSOR
		ACALL COMMAND ;SEND COMMAND TO LCD
	
		MOV A,#01H    ;CLEAR LCD DISPLAY,MEMORY AND CURSOR AT HOME POSITION
		ACALL COMMAND ;SEND COMMAND TO LCD

		MOV A,#06H    ;TO SHIFT CURSOR TO LEFT FOR NEXT CHARACTER AND ENABLE  DISABLE
		ACALL COMMAND ;SEND COMMAND TO LCD

		MOV A,#80H    ;SELECT 1ST LINE AND POSITION TO DISPLAY MESSAGE
		ACALL COMMAND ;SEND COMMAND TO LCD

		MOV A,#'W'    ;DISPLAY CHAR 'W'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#'E'	  ;DISPLAY CHAR 'E'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#'L'    ;DISPLAY CHAR 'L'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#'C'    ;DISPLAY CHAR 'C'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#'O'    ;DISPLAY CHAR 'O'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#'M'    ;DISPLAY CHAR 'M'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#'E'    ;DISPLAY CHAR 'E'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		
		MOV A,#0C0H   ;SELECT 2ND LINE AND 1ST POSITION TO DISPLAY MESSAGE
		ACALL COMMAND ;SEND COMMAND TO LCD
		MOV A,#'T'	  ;DISPLAY CHAR 'T'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#'O'    ;DISPLAY CHAR 'O'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#' '    ;DISPLAY CHAR ' '
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#'V'    ;DISPLAY CHAR 'V'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#'I'    ;DISPLAY CHAR 'I'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#'I'    ;DISPLAY CHAR 'I'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
		MOV A,#'T'    ;DISPLAY CHAR 'T'
		ACALL DISPLAY ;DISPLAY SUBROUTINE
	
HERE:	JMP HERE	   ;TO HOLD CHARACTERS 

COMMAND:      	  	   ;SUBROUTINE TO SEND COMMAND INSTRUCTION TO LCD
		ACALL DELAY    ;DELAY CALL
		MOV P0,A       ;MOVE COMMAND TO LCD THROUGH PORT
		CLR RS         ;SELECTING COMMAND REGISTER FOR COMMAND
		CLR RW         ;SELECTING WRITE MODE
		SETB EN        ;FOR WRITE GIVE HIGH TO LOW PULSE
		NOP			   ;WAIT FOR TWO MACHINE CYCLES
		NOP			   
		CLR EN		   ;CLR EN PIN
		RET
		
DISPLAY:      		   ;SUBROUTINE TO DISPLAY INSTRUCTION TO LCD
		ACALL DELAY    ;DELAY CALL
		MOV P0,A       ;MOVE DATA TO LCD THROUGH PORT
		SETB RS        ;SELECTING DATA REGISTER FOR COMMAND
		CLR RW         ;SELECTING WRITING MODE
		SETB EN        ;FOR WRITE GIVE HIGH TO LOW PULDE
		NOP			   ;WAIT FOR TWO MACHINE CYCLES
		NOP
		CLR EN         ;CLR EN PIN
		RET

DELAY:
		MOV TMOD,#01H  ;TIMER 0,MODE 1
		MOV TH0,#0F8H  ;LOAD HIGH BYTE 
		MOV TL0,#0CCH  ;LOAD LOW BYTE
		SETB TR0       ;START TIMER
	L3:	JNB TF0,L3     ;MONITOR FLAG UNTIL IT ROLL OVER
		CLR TR0        ;STOP TIMER
		CLR TF0        ;CLEAR FLAG
		RET
  
		END