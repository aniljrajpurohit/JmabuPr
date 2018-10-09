/*
 *  Experiment No. 9_B
 *  Program statement: Interface serial communication port (USART) of PIC18 
 *  with PC and write an embedded C program for PIC18 to receive the 
 *  information serially form PC to microcontroller for various baudrates 
 *  and display the received information on LCD or lED.
 *  Roll no.- 312046     Batch no.- B2
 *  Date of performance- 12/09/2018     
 */

#include"LCD.h"

void main(){
    RCSTA = 0b10010000;                   //SPEN bit enable & CREN enable
    SPBRG = 12;                //X = ((8M/9600)/64)-1  X = 12.02 = SPBRG 
    TRISCbits.TRISC7 = 1;                  //Rx pin input
    while(1){
        while(PIR1bits.RCIF == 0);         //Wait until all data received
            displayMsg(1,1,RCREG);         //Display received data on LCD
    }
}