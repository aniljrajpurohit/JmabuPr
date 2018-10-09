//LCD Header file

#ifndef LCD_H
#define	LCD_H

#include<P18F452.h>
#pragma config OSC = HS
#pragma config PWRT = OFF
#pragma config DEBUG = OFF
#pragma config WDT = OFF
#pragma config LVP = OFF

#define RS PORTCbits.RC0        //Declaration of pin labels
#define RW PORTCbits.RC1
#define EN PORTCbits.RC2

void milliDelay(unsigned int time){	//Function for generating delay in millisecs
	int i,j;
	for(i=0;i<time;i++);
	for(j=0;j<165;j++);
}

void sendCommand(unsigned char send){
	milliDelay(3);
	RS = 0;			//Select command register
	RW = 0; 		//Select write to LCD mode
	PORTD = send;	//Send command to LCD
	EN = 1;
	milliDelay(5);
	EN = 0;
}

void sendData(unsigned char send){
	milliDelay(3);
	RS = 1;			//Select display register
	RW = 0; 		//Select write to LCD mode
	PORTD = send;	//Send command to LCD
	EN = 1;
	milliDelay(5);
	EN = 0;
}

void displayMsg(unsigned char row,unsigned char column,rom unsigned char *message){
	if(row == 1)              //Function for displaying a string 
		row = 0x80;
	else
		row = 0xC0;
	
	sendCommand(row | column);
	while(*message){
		sendData(*message);
		message++;
	}
}

void initLCD(void){		//Function to initialise LCD 
	TRISD = 0x00;
	TRISCbits.TRISC0 = 0;
	TRISCbits.TRISC1 = 0;
	TRISCbits.TRISC2 = 0;
	sendCommand(0x38);
	sendCommand(0x0E);
	sendCommand(0x01);
	sendCommand(0x06);
}

