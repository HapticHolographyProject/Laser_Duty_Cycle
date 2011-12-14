/* Laser Duty Cycle
    By: Myles Borins
    
    Turn off a laser for 5 minutes every hour and a half

 */

#include <Time.h>

// constants won't change. Used here to 
// set pin numbers:
const int powerPin =  7;      // the number of the Power pin

// Variables will change:
int powerState = HIGH;             // powerState used to set the output
boolean changeState = true;

// the follow variables is a long because the time, measured in miliseconds,
// will quickly become a bigger number than can be stored in an int.


void setup() {
  Serial.begin(9600);
  
  // set the digital pin as output:
  pinMode(powerPin, OUTPUT);
  setTime(8,29,0,1,1,11); // set time to Saturday 8:29:00am Jan 1 2011
}

void loop()
{
  // If there has been a change in state write it to the pin
  
  if((second()%10) == 5){
    digitalWrite(powerPin, LOW);
  }
  else if ((second()%10) == 0) {
    digitalWrite(powerPin, HIGH);
  }
}

// When this alarm goes off the pin is set high

void TurnOn(){
  powerState = HIGH;
  changeState = true;
}

// When this alarm goes off the pin is set low

void TurnOff(){
  powerState = LOW;
  changeState = true;
}
