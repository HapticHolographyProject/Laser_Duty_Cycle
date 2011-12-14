/* Laser Duty Cycle
    By: Myles Borins
    
    Turn off a laser for 5 minutes every two hours

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
  // set the digital pin as output:
  pinMode(powerPin, OUTPUT);
  setTime(12,0,1,1,1,11); // set time to Saturday 12:01:00am Jan 1 2011
  digitalWrite(powerPin, HIGH);
}

void loop()
{
  // If there has been a change in state write it to the pin
  if((hour()%2) == 1 && (minute() == 55)){
    digitalWrite(powerPin, LOW);
  }
  else if ((hour()%2) == 0 && (minute() == 0)) {
    digitalWrite(powerPin, HIGH);
  }
}
