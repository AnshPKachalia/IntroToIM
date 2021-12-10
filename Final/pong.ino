void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:
  int PotentiometerP1 = analogRead(A0); //Read value of potentiometer 1
  int PotentiometerP2 = analogRead(A5); //Read Value of potentiometer 2
  // print out the value you read:
  Serial.print(PotentiometerP1);
  Serial.print(","); //To be able to recive them as separate readings and split them in Processing
  Serial.println(PotentiometerP2);
  delay(1);        // delay in between reads for stability
}
