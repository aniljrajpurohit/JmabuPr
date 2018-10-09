/*
 *  Experiment No. 8
 *  Program statement: Write an embedded C program for generating waveform
 *  using timer interrupt for following activity.
 *  Roll no.- 312046     Batch no.- B2
 *  Date of performance- 12/09/2018
 */

#include<P18F452.h>
#pragma config OSC = HS
#pragma config PWRT = OFF
#pragma config WDT = OFF
#pragma config DEBUG = OFF
#pragma config LVP = OFF
#define output PORTCbits.RC4

#pragma interrupt resetTimer        

void resetTimer(void){              //ISR ROUTINE
	if(INTCONbits.TMR0IF == 1){
		output =~output;
		TMR0H = 0b11111100;         //Delay of 0.5 ms
		TMR0L =	0b00011000;         //65536 - 1000 = 64536
		INTCONbits.TMR0IF = 0;
	}
	
}

#pragma code highPriority = 0x08    //INTERRUPT VECTOR ADDRESS
void highPriority(void){
	_asm
	GOTO resetTimer
	_endasm
}

#pragma code
void main(void){                    
	TRISCbits.TRISC4 = 0;           //Set RC4 as O/p
	T0CON = 0b00001000;             //Timer 0 16bit, byass prescaler
	TMR0H = 0b11111100;             //Delay of 0.5 ms
	TMR0L =	0b00011000;             //65536 - 1000 = 64536
	INTCONbits.TMR0IF = 0;          //Initialise TMR0 Int. Flag to 0
	INTCONbits.TMR0IE = 1;          //Enable the timer 0 int.
	T0CONbits.TMR0ON = 1;           //Start the timer
	INTCONbits.GIE = 1;             //set the global int. enable bit
	while(1);                       
}

