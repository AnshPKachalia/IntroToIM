
import processing.serial.*;
Serial myPort;
boolean arduinoIsReady = false;
void setup() {
  size(640, 360);
  noFill();
  printArray(Serial.list());
  // replace the index with the index of Arduino's serial port
  String portname=Serial.list()[0];
  myPort = new Serial(this, portname, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}
void draw() {
  if (keyPressed==true) { //Send value to arduino if any key is pressed
    myPort.write(1 + "\n"); // could be any value
    arduinoIsReady = false;
  }
}
void serialEvent(Serial myPort) {
  String s=myPort.readStringUntil('\n');
  arduinoIsReady = true; //Change boolean to change state of LED
}
