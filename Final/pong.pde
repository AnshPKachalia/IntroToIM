// Ansh Kachalia- Final
//2 player pong game
// This is a classic rendition of the nostalgic pong game that we all have played at some point in our lives
//The aim is to create an interactive space between arduino and processing and also make it a fun experience from the user

//To Do:
// Intropage- 
// Player paddles-
//Figure out collision-
//Figure out bounce mechanism-
// Score on LCD screen-



import processing.serial.*;

Serial myPort;        // The serial port


float ballX, ballY; //Variables to control ball position
float speedX, speedY; // Varaibles to control ball position
float acceleration;// Variable to increase acceleration with time
PFont burko; // Original font from the Pong game
boolean introscreen=true; //Setting booleans to be able to track whcih screen is being trigerred
boolean startgame=false;
float player1X;
float player1Y=0;
float player2X, player2Y;
int player1Score, player2Score;

void setup() {
  size(2500, 1500);
  ballX = 1250;
  ballY = 750;
  speedX=10;
  speedY=10;
  player1X=25;
  player2X=width-65;
  player2Y=1000;
  player1Score=0;
  player2Score=0;
  burko= createFont("burko.ttf", 200); //Creating the original pong font
  // List all the available serial ports
  printArray(Serial.list());

  // I know that the first port in the serial list on my Linux
  // computer is always my Arduino, so I open Serial.list()[0].
  // You may have to change the index to correspond to the port
  // that you're using.
  myPort = new Serial(this, Serial.list()[4], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
}


void draw() {
  background(0); 
  fill(255);
  introscreen();
}


void introscreen() {
  if (introscreen==true & startgame==false) { //Setting booleans to ensure correct screens are called
    textFont(burko);
    text("PONG", 1000, height/2);
    textSize(100);
    text("Press SPACE to Play", 700, height/2 +200); // trial and error to make sure text is placed correctly
  }
  if (key==' ') {
    startgame=true; // Turning the startgame boolean true when space bar is pressed
  }
  if (startgame==true) {
    maingame(); //Calling the maingame function once space bar has been pressed
  }
}


void maingame() {
  ellipse(ballX, ballY, 40, 40);  //Ball 
  rect(player1X, player1Y, 40, 130); //Paddle- Player 1
  rect(player2X, player2Y, 40, 130); //Paddle- Player 2
  text(player1Score, 800, 200);
  text(player2Score, 1200, 200);
  calc();

  if (ballY<20|| ballY>height-20) { 
    speedY=-speedY;  //Change direction of movement once ball touches the top or bottom edges
  }

  if (dist(ballX, ballY, player1X, player1Y)<20) {
    speedX=-speedX;
  }
  if (dist(ballX, ballY, player2X, player2Y)<20) {
    speedX=-speedX;
  }

  if (ballX<20) {
    ballX=1250;
    ballY=750;
    player1Score++;
    speedX=10;
    speedY=10;
  }
  if (ballX>width-20) {
    ballX=1250;
    ballY=750;
    player2Score++;
    speedX=10;
    speedY=10;
  }

  if ( player1Score>=5 || player2Score>=5) {
    endgame();
  }
}

void calc() {
  ballX = ballX + speedX; //Increasing the ball x pos using speed
  ballY = ballY + speedY; //Increasing the ball y pos using speed
  speedX=speedX+acceleration; //Inreasing speed with time
  speedY=speedY+acceleration;

  if (speedX<0) {
    acceleration=-0.02; //Value selected using trial and error to ensure that ball speed increases at appropriate rate
  } else if (speedX>0) {
    acceleration=0.02;
  }

  if (speedY<0) {
    acceleration=-0.02;
  } else if (speedY>0) {
    acceleration=0.02;
  }
}

void endgame() {
  background(0);
}


void serialEvent(Serial myPort) 
{
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString);                                // taking the input values from arduino as a string and slicing them and putting them in strings as indivdual variables for each button
    float[] arduino_input = float(split(inString, ","));
    println(arduino_input[1]);
    if (arduino_input.length >= 2) {
      //stores the incoming values from the array into their corresponding variables
      player1Y = arduino_input[0];
      player1Y = map(player1Y, 0, 1023, 0, height-130);
      player2Y = arduino_input[1];
      player2Y = map(player2Y, 0, 1023, 0, height-130);
      println("This is p1y"+ player1Y);
      println("this is p2y" + player2Y);
    }
  }
}

//void serialEvent (Serial myPort) {
//  // get the ASCII string:
//  String inString = myPort.readStringUntil('\n');

//  // Always check to make sure the string isn't empty
//  if (inString != null) {
//    // trim off any whitespace:
//    inString = trim(inString);
//    // convert to a float
//    player1Y = float(inString);
//    // map to the width of the screen
//    player1Y = map(player1Y, 0, 1023, 0, height-130);
//    println(inString);

//  }
//}
