/*
 *  Experiment No. 11
 *  Program statement: Program statement: Write an embedded C program for PIC 18 to monitor 
 *  the status of the switch SW and perform the following
 *      1. If SW = 0 the DC motor moves with 50% duty cycle
 *      2. If SW = 1 the motor moves with 25% duty cycle.
 *  Roll no.- 312046     Batch no.- B2
 *  Date of performance- 
 */

#include<P18F452.h>
#pragma config OSC = HS
#pragma config PWRT = OFF
#pragma config DEBUG = OFF
#pragma config WDT = OFF
#pragma config LVP = OFF

void main(void){
	TRISC = 0xFB;
	TRISD = 0x80;
	CCP1CON	= 0x0F;					//PWM mode 11XX
	PR2 = 199;						//Value for 2.5kHz 
	T2CON = 0x01;					//1:4 PRESCALER
	while(1){
		if(PORTDbits.RD7 == 1){
			CCP1CONbits.DC1B1 = 1;  //0.75%
			CCP1CONbits.DC1B0 = 1;
			CCPR1L = 49;            //25% Duty cycle
		}
		else{
			CCP1CONbits.DC1B1 = 1;  //0.25%
			CCP1CONbits.DC1B0 = 0;
			CCPR1L = 99;            //50% Duty cycle
		}
		TMR2 = 0x0;					//Clear Timer 2
		PIR1bits.TMR2IF = 0;		//Clear Timer Flag
		T2CONbits.TMR2ON = 1;		//TIMER 2 ON
		while(PIR1bits.TMR2IF == 0);	//WAIT FOR END OF PERIOD 
	}
}