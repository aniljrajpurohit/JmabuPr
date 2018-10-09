/*
 *  Experiment No. 10
 *  Program statement: Write an embedded C program for PIC 18 to monitor 
 *  the status of the switch SW and perform the following
 *      1. If SW = 0 the DC motor moves with 50% duty cycle
 *      2. If SW = 1 the motor moves with 25% duty cycle.
 *  Roll no.- 312046     Batch no.- B2
 *  Date of performance- 
 */

//PROGRAM FOR 1KHZ PWM WAVE
#include<P18F452.h>
#pragma config OSC = HS
#pragma config PWRT = OFF
#pragma config DEBUG = OFF
#pragma config WDT = OFF
#pragma config LVP = OFF

void main(void){
	TRISC = 0b11111011;                 //CCP1 as output
	TRISD = 0b10000000;                 //Switch i/p
	CCP1CON	= 0x0F;                     //PWM mode 11XX(1111)
	PR2 = 124;                          //Value for 1kHz 
	T2CON = 0x10;                       //1:16 PRESCALER
	while(1){
		if(PORTDbits.RD7 == 1){
			CCPR1L = 31;                //25% Duty cycle
		}
		else{
			CCPR1L = 62;                //50% Duty cycle
		}
		TMR2 = 0x0;                     //Clear Timer 2
		PIR1bits.TMR2IF = 0;            //Clear Timer Flag
		T2CONbits.TMR2ON = 1;           //TIMER 2 ON
		while(PIR1bits.TMR2IF == 0);	//WAIT FOR END OF PERIOD 
	}
}