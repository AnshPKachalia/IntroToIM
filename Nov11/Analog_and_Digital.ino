const int redLED = A0;//Pin for red LED
const int blueButton = A3;//Pin for blue Button
const int yellowLED = 5; //Pin for yellow LED
const int ldrPin = A5; // Pin for LDR
int brightness = 0; //Initial Brightness of bulb
int fadeAmount = 5; //Fade amount for bulb
void setup() {
  Serial.begin(9600);
  pinMode (redLED, OUTPUT); //Declaring the output
  pinMode (blueButton, INPUT); // Declaring the input
  pinMode(yellowLED, OUTPUT); //Declaring rhe output
}

void loop() {
  int buttonState = digitalRead(blueButton); //Reading the value of the button digitally
  int ldrValue = analogRead(ldrPin); //Reading the LDR value in an analog way


  if (buttonState == HIGH) {
    digitalWrite(redLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(redLED, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);
    digitalWrite(redLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(redLED, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);
    digitalWrite(redLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(redLED, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);
    digitalWrite(redLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(redLED, LOW);    // turn the LED off by making the voltage LOW
    delay(3000);
    digitalWrite(redLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for 3 seconds
    digitalWrite(redLED, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);
    digitalWrite(redLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(redLED, LOW);    // turn the LED off by making the voltage LOW
    delay(7000);                       // wait for 7 seconds

  }
  if (buttonState == LOW && ldrValue < 400) { //Only run this function is blue button is not pressed and LDR has a value of below 400
    //Triggering both LEDs on and off simultaneously to create a random pattern
    //Delay between LED blinks is dependent on the LDR value
    analogWrite(redLED, 190);
    analogWrite(yellowLED, 190);
    delay(ldrValue);
    analogWrite(redLED, LOW);
    delay(ldrValue);
    analogWrite(redLED, 190);
    analogWrite(yellowLED, LOW);
    delay(ldrValue);
    analogWrite(redLED, 190);
    analogWrite(yellowLED, 190);
    delay(ldrValue);
    analogWrite(redLED, LOW);
    analogWrite(yellowLED, LOW);
    delay(ldrValue);
    analogWrite(redLED, LOW);
    analogWrite(yellowLED, 190);
    delay(ldrValue);
    analogWrite(redLED, 190);
    analogWrite(yellowLED, LOW);
    delay(ldrValue);
    analogWrite(redLED, LOW);
    analogWrite(yellowLED, LOW);
    delay(ldrValue);
  }

  if (buttonState == LOW && ldrValue > 400) { //Only trigger when blue button is not pressed and when LDR value is above 400
    analogWrite(yellowLED, brightness);

    // change the brightness for next time through the loop:
    brightness = brightness + fadeAmount;

    // reverse the direction of the fading at the ends of the fade:
    if (brightness <= 0 || brightness >= 255) {
      fadeAmount = -fadeAmount;
    }
    // wait for 30 milliseconds to see the dimming effect
    delay(30);
  }
  Serial.println(brightness);//Checking to see if brightness changes properly
}
