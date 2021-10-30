const int specs = 6;
const int yellowLED = A3;
void setup() {
  pinMode (yellowLED, OUTPUT); //Declaring the output
  pinMode (specs, INPUT);     // Declaring the input
}

void loop() {
  int buttonState = digitalRead(specs);
  if (buttonState == HIGH) {
    digitalWrite(yellowLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(yellowLED, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);
    digitalWrite(yellowLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(yellowLED, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);
    digitalWrite(yellowLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(yellowLED, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);
    digitalWrite(yellowLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(yellowLED, LOW);    // turn the LED off by making the voltage LOW
    delay(3000);
    digitalWrite(yellowLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for 3 seconds
    digitalWrite(yellowLED, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);
    digitalWrite(yellowLED, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(yellowLED, LOW);    // turn the LED off by making the voltage LOW
    delay(7000);                       // wait for 7 seconds

  }
}
