/*
 *  Experiment No. 9_B
 *  Program statement: Interface serial communication port (USART) of PIC18 
 *  with PC and write an embedded C program for PIC18 to receive and transmit 
 *  the information serially form PC to microcontroller and microcontroller 
 *  to PC for various baud rates and display the received information on led
 *  or LCD.
 *  Roll no.- 312046     Batch no.- B2
 *  Date of performance- 12/09/2018     
 */

#include "LCD.h"
void serialComm();
void main(){
    TXSTA = 0b00100000;          //Enable the transmit bit
    RCSTA = 0b10010000;          //Serial port enabled
    SPBRG = 12;                  //X = ((8M/9600)/64)-1  X = 12.02 = SPBRG 
    TRISCbits.TRISC6 = 0;        //Tx pin as output
    TRISCbits.TRISC7 = 1;        //Rx pin as input
    while(1){
        serialComm();
    }
}

void serialComm(){
    while(PIR1bits.RCIF == 0);   //Wait until all data is received     
    displayMsg(1,1,RCREG);       //Display received data on LCD
    TXREG = RCREG;               //Transmit received data
    while(PIR1bits.TXIF == 0);   //Wait until all data is transmitted 
}