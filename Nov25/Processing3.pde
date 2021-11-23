PVector velocity;
PVector gravity;
PVector position;
PVector acceleration;
PVector wind;
float drag = 0.99;
float mass = 50;
float hDampening;
import processing.serial.*;
Serial myPort;
boolean arduinoIsReady = false;
void setup() {
  size(640, 360);
  noFill();
  position = new PVector(width/2, 0);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  gravity = new PVector(0, 0.3*mass);
  wind = new PVector(0, 0);
  hDampening=map(mass, 15, 80, .98, .96);
  printArray(Serial.list());
  // replace the index with the index of Arduino's serial port
  String portname=Serial.list()[0];
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
  // Opening the serial port will cause Arduino to reset,
  // so wait a bit to allow Arduino to finish
  // so that we don't miss the first bounce
  delay (2000);
}
void draw() {
  background(255);
  if (!keyPressed) {
    // In the original version wind is only applied when keys
    // are pressed, but we need wind to work always
    //wind.x=0;
    velocity.x*=hDampening;
  }
  applyForce(wind);
  applyForce(gravity);
  velocity.add(acceleration);
  velocity.mult(drag);
  position.add(velocity);
  acceleration.mult(0);
  // Note that the mass is also the radius
  ellipse(position.x, position.y, mass, mass);
  // Did we hit the floor?
  if (position.y > height-mass/2) {
    // change direction to bounce, also loose some energy
    // (dampning) so we the bounce is a little less each time
    velocity.y *= -0.9;  
    // prevent sinking beneath the floor
    position.y = height-mass/2;
    // Send message to Arduino
    if (arduinoIsReady) {
      myPort.write(1 + "\n"); // could be any value
      arduinoIsReady = false;
    }
  }
}
void applyForce(PVector force) {
  // Newton's 2nd law: F = M * A
  // or A = F / M
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}
void keyPressed() {
  if (keyCode==LEFT) {
    wind.x=-1;
  }
  if (keyCode==RIGHT) {
    wind.x=1;
  }
  if (key==' ') {
    mass=random(15, 80);
    position.y=-mass;
    velocity.mult(0);
  }
}
void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  // Always check to make sure the string isn't empty
  if (inString != null) { 
    // trim off any whitespace:
    inString = trim(inString);
    // convert to a float
    float inValue = float(inString);
    println("received from Arduino: " + inValue);
    // Finally, map it to sensible values for wind
    wind.x = map(inValue, 0, 1023, -5, 5);
    arduinoIsReady = true;
  }
}
