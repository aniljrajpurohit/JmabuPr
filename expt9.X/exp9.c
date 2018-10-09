/*
 *  Experiment No. 9_A
 *  Program statement: Interface serial communication port(USART) of PIC18 
 *  with PC and write an embedded C program for PIC18 to transfer the
 *  information serially form microcontroller to PC for various baudrates.
 *  Roll no.- 312046     Batch no.- B2
 *  Date of performance- 12/09/2018     
 */

#include<P18F452.h>
#pragma config OSC = HS
#pragma config PWRT = OFF
#pragma config WDT = OFF
#pragma config DEBUG = OFF
#pragma config LVP = OFF

void serialTransmit(unsigned char data[50]);     //Function prototype
unsigned int i;

void main(){
    TXSTA = 0b00100000;                          //Enable the transmit bit
    RCSTA = 0b10000000;                          //Serial port enabled
    SPBRG = 12;                  //X = ((8M/9600)/64)-1  X = 12.02 = SPBRG 
    TRISCbits.TRISC6 = 0;                        //Tx pin as output
    while(1){
        serialTransmit('ANIL E&TC VIIT');
    }
}

void serialTransmit(unsigned char TX_data[50]){    //Function to transmit data
    while(PIR1bits.TXIF == 0);            //wait until all data is transmitted
    for(i = 0;TX_data[i]!='\0';i++){
        TXREG = TX_data[i];
        while(PIR1bits.TXIF == 0);
    }
}
