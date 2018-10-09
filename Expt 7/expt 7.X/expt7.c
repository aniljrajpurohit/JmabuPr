/*
 *  Experiment No. 7
 *  Program statement: Interface serial communication port(USART) of PIC18 
 *  with PC and write an embedded C program for PIC18 to transfer the 
 *  information serially form microcontroller to PC for various baud rates.
 *  Roll no.- 312046     Batch no.- B2
 *  Date of performance- 05/09/2018
 */


#include "LCD.h"
#define COL PORTB
#define ROW PORTB
unsigned char colLoc,rowLoc;
unsigned char keypad[4][4] = {
								{'0','1','2','3'},
								{'4','5','6','7'},
								{'8','9','A','B'},
								{'C','D','E','F'}
                             };							 	

void main(void){
	TRISB = 0x00;                       //Initialse PORTB as o/p
	initLCD();
	displayMsg(1,0,"Anil Rajpurohit");
	displayMsg(2,0,"Roll No.:");
	COL = 0xF0;                         //Initialse cloumns as i/p
	
	while(1){
		
		do{                             //Check all keys open
			ROW = 0xF0;
			colLoc = COL;               // read all columns
			colLoc &=0xF0;              //Masking of unused bits
		}while(colLoc != 0xF0);	
		
		do{
			do{
				milliDelay(20);         //Added delay 
				colLoc = COL;           //Read all columns
				colLoc &=0xF0;
			}while(colLoc == 0xF0);
			milliDelay(20);             //Added delay for debounce
			colLoc = COL;               //Read all columns
			colLoc &=0xF0;
		}while(colLoc == 0xF0);	
		
		while(1){                       //Key detection by grounding rows
			ROW = 0xFE;
			colLoc = COL;
			colLoc &= 0xF0;
			if(colLoc != 0xF0){         //Key detected from row 0
				rowLoc = 0;
				break;
			}
			ROW = 0xFD;
			colLoc = COL;
			colLoc &= 0xF0;
			if(colLoc != 0xF0){         //Key detected from row 1
				rowLoc = 1;
				break;
			}
			ROW = 0xFB;
			colLoc = COL;
			colLoc &= 0xF0;
			if(colLoc != 0xF0){         //Key detected from row 2
				rowLoc = 2;
				break;
	 		}
			ROW = 0xF7;
			colLoc = COL;
			colLoc &= 0xF0;
			if(colLoc != 0xF0){         //Key detected from row 3
				rowLoc = 3;
				break;
	 		}
			ROW = 0xF7;
			colLoc = COL;
			colLoc &= 0xF0;
			if(colLoc == 0xE0)
				sendData(keypad[rowLoc][0]);
			if(colLoc == 0xD0)
				sendData(keypad[rowLoc][1]);
			if(colLoc == 0xB0)
				sendData(keypad[rowLoc][2]);
			if(colLoc == 0x70)
				sendData(keypad[rowLoc][3]);  	
		}
	}
}