/*
 *  Experiment No. 6
 *  Program statement: Write a embedded C program for interfacing switches, 
 *  LED's, relay and buzzer with PIC18F452 
 *  Roll no.- 312046     Batch no.- B2
 *  Date of performance- 29/08/2018
 */


#include<P18F452.h>
#pragma config OSC = HS
#pragma config PWRT = OFF
#pragma config WDT = OFF
#pragma config DEBUG = OFF
#pragma config LVP = OFF

#define SW1 PORTCbits.RC0                //Declaration of pin labels
#define SW2 PORTCbits.RC1
#define RELAY PORTBbits.RB0
#define BUZZER PORTBbits.RB1
#define LED PORTD

void milliDelay(unsigned int);             //Function prototype
unsigned int i,j;

void main(){
    TRISCbits.TRISC0 = 1;                //Making SW1 as I/P
    TRISCbits.TRISC1 = 1;                //Making SW2 as I/P
    TRISBbits.TRISB0 = 0;                //Making RELAY as O/P
    TRISBbits.TRISB1 = 0;                //Making BUZZER as O/P
    TRISD = 0;                           //Making LED as O/P
    for(;;){
        if(SW1 == 0 && SW2 == 0){        //Condition for both switch pressed
            RELAY = 1;
            BUZZER = 1;
           while(SW1 == 0 && SW2 == 0){
               LED = 0xFF;
               milliDelay(100);
               LED = 0;
           }
        }
        else if(SW1 == 0 && SW2 == 1){   //Condition for SW1 pressed
            RELAY = 0;
            BUZZER = 0;
            LED = 0b10000000;
            while(SW1 == 0 && SW2 == 1){
                LED = LED>>1;
                milliDelay(100);
            }
        }
        else if(SW1 == 1 && SW2 == 0){   //Condition for SW2 pressed
            RELAY = 1;
            BUZZER = 1;
            LED = 0b00000001;
            while(SW1 == 1 && SW2 == 0){
                LED = LED<<1;
                milliDelay(100);
            }
        }
        else{                            //Condition for both switch released
            RELAY = 1;
            BUZZER = 1;
            LED = 0;
        }
    }
}

void milliDelay(unsigned int millisec){ //Function for generating delay
    for(i=0;i<millisec;i++)
        for(j=0;j<165;j++);
}
