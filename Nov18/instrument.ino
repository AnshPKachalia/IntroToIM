//Making an instrument using

//integer for storing the frequency of the note corresponding to the third(yellow) button
int redButton = A3;  //pin for the first(green) button
int blueButton = A4; //pin for the second(red) button
int yellowButton = A5;  //pin for the third(yellow) button
int spkPin = 7;   //pin for the buzzer
int potPin = A0; //Pin for potentiometer

int aminor = 440; //Assigning frequency values based on chords
int g = 392;
int c = 262;

void setup() {
  //set the button pins as inputs or outputs

  pinMode(redButton, INPUT);
  pinMode(blueButton, INPUT);
  pinMode(yellowButton, INPUT);
  pinMode(potPin, INPUT);
  pinMode(spkPin, OUTPUT);
  Serial.begin(9600); //Initializing so it can be used to debug later

}

void loop() {

  playSong(); //Linking another function in loop

}
void playSong() { //function to play a sound
  int val = analogRead(potPin);
  Serial.println(val);
  val = map(val, 0, 1023, 0, 440); //Maps the potentiometer value to appropriate freq value
  if (digitalRead(redButton) == HIGH) { //Plays a certain freq based on which button is pressed and how much resistance is provided by potentiometer
    tone(spkPin, aminor - val);
  }
  else if (digitalRead(blueButton) == HIGH) {
    tone(spkPin, g - val);
  }
  else if (digitalRead(yellowButton) == HIGH) {
    tone(spkPin, c - val);
  }
  else {
    noTone(spkPin);   //if no key is pressed turn the buzzer off
  }
}
