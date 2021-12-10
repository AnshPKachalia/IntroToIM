// Ansh Kachalia- Final
//2 player pong game
// This is a classic rendition of the nostalgic pong game that we all have played at some point in our lives
//The aim is to create an interactive space between arduino and processing and also make it a fun experience from the user

//To Do:
// Intropage- Done
// Instructions-Done
// Add Music-Done
// Player paddles- Done
//Figure out collision- Done
//Figure out bounce mechanism- Done
//Add larger potentiometers- Done
//Make addition to original game to make it more fun- Done
//End Page- Done
//Restart game- Done

import processing.sound.*; //Importing to be able to play sound
SoundFile bgsound; //Creating sound file
import processing.serial.*;

Serial myPort;        // The serial port

float ballX, ballY; //Variables to control ball position
float speedX, speedY; // Varaibles to control ball position
float acceleration;// Variable to increase acceleration with time
PFont burko; // Original font from the Pong game
boolean introscreen=true; //Setting booleans to be able to track whcih screen is being trigerred
boolean startgame=false;
boolean endgame=false;
float player1X; //X value of player 1 paddle
float player1Y=0; //Y value of player 1 paddle
float player2X, player2Y; //X and Y values of player 2 paddle
int player1Score, player2Score; //To track score of players 1 and 2
int paddleWidth1=40; //Width and height of each players paddle
int paddleWidth2=40;
int paddleHeight1=250; 
int paddleHeight2=250;
int scorediff; //Score difference between player 1 and 2


void setup() {
  size(2500, 1500); //Setting initial values for most global variables
  ballX = 1250;
  ballY = 750;
  speedX=10;
  speedY=10;
  player1X=105;
  player2X=width-105;
  player2Y=1000;
  player1Score=0;
  player2Score=0;
  bgsound = new SoundFile(this, "Chiptronical.mp3");
  burko= createFont("burko.ttf", 200); //Creating the original pong font
  // List all the available serial ports
  printArray(Serial.list());

  myPort = new Serial(this, Serial.list()[4], 9600); //My arduino was plugged to port 4
  myPort.bufferUntil('\n');
}


void draw() {

  background(0);  //Keeping background true to the original game
  fill(255);
  introscreen();
}


void introscreen() {
  if (bgsound.isPlaying()==false) {
    bgsound.play();
  }
  if (introscreen==true & startgame==false ) { //Setting booleans to ensure correct screens are called
    textFont(burko);
    text("PONG", 1000, height/2);
    textSize(75); //Setting appropriate font size to match game style
    text("Press SPACE to Play", 800, height/2 +400); // trial and error to make sure text is placed correctly
    text("Press G to see the Guide", 700, height/2+200);
  }

  if (key==' ') {
    startgame=true; // Turning the startgame boolean true when space bar is pressed
    introscreen=false;
  }
  if (startgame==true & introscreen==false) {
    maingame(); //Calling the maingame function once space bar has been pressed
  }

  if (startgame==false & key=='g') {
    instruction();
  }
}


void maingame() {
  ellipse(ballX, ballY, 40, 40);  //Ball 
  fill(0, 0, 255);
  rect(player1X, player1Y, paddleWidth1, paddleHeight1-scorediff); //Paddle- Player 1
  fill(255, 0, 0);
  rect(player2X, player2Y, paddleWidth2, paddleHeight2+scorediff); //Paddle- Player 2
  fill(0, 0, 255);
  text(player1Score, 1000, 200); //Displaying individual scores
  fill(255, 0, 0);
  text(player2Score, 1400, 200);
  calc(); //Triggering function that deals with any changes in movement of ball
  //println("This is scorediff" + scorediff); //Printing difference in score to see if the variable was correctly set up

  if (ballY<20|| ballY>height-20) { 
    speedY=-speedY;  //Change direction of movement once ball touches the top or bottom edges
  }

  // Collision detection between moving object and rectangle. Sees if edges collided.
  //Used https://happycoding.io/tutorials/processing/collision-detection as a guide
  if (ballX> player1X && 
    ballX < player1X+ paddleWidth1 && 
    ballY> player1Y && 
    ballY < player1Y+ paddleHeight1) {
    speedX=-speedX;
  }

  if (ballX> player2X && 
    ballX < player2X+ paddleWidth2 && 
    ballY> player2Y && 
    ballY < player2Y+ paddleHeight2) {
    speedX=-speedX;
  }


  if (ballX<20) { //If ball collides with left edge then reset the ball and change scores
    ballX=1250; //Reset ball position and speed
    ballY=750;
    player2Score++;
    speedX=10;
    speedY=10;
  }
  if (ballX>width-20) { //If ball collides with right edge then reset the ball and change scores
    ballX=1250; //Reset ball position and speed
    ballY=750;
    player1Score++;
    speedX=10;
    speedY=10;
  }
  scorediff=(player1Score-player2Score)*10; //Calculates a multiple of the scorediff to be able to change paddle heights as a way to make the game tougher for the individual leading

  if ( player1Score>=5 || player2Score>=5) {
    endgame=true;
  }

  if (endgame==true) {
    introscreen=false;
    endgame(); //End the game when either players reach 5 points
  }
}

void calc() {
  ballX = ballX + speedX; //Increasing the ball x pos using speed
  ballY = ballY + speedY; //Increasing the ball y pos using speed
  speedX=speedX+acceleration; //Inreasing speed with time
  speedY=speedY+acceleration;

  //Increasing speed based on direction of ball
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

  if (player1Score>player2Score) { //If player 5 wins display this
    text("Player 1 Wins", width/2-400, height/2); 
    text("Press R to Restart the Game", width/2 - 700, height/2+300);
  }

  if (player2Score>player1Score) { //If player 2 wins display this
    text("Player 2 Wins", width/2-250, height/2); 
    text("Press R to Restart the Game", width/2 - 600, height/2+300);
  }
  if (startgame==true & introscreen==false & endgame==true & key=='r') {
    startgame=false;
    introscreen=true;
    endgame=false;
    introscreen();
    player1Score=0; // Allows restarting the game. Prevents from being redirected to end page
    player2Score=0;
    ballX=1250; //Resets the ball
  }
}

void instruction() {
  background(0);
  textSize(100);
  text("Instructions:", width/2-400, 200);
  textSize(50);
  text("This is a rendition of the classic 2 player Pong Game", width/3-400, 550);
  text("The goal is to score 5 points", width/3, 700);
  text("Use your controllers to control your paddle", width/3-200, 850);
  text("The player on the left should pick the blue controller",width/3-400,1000);
  text("As your lead increases, the size of the paddle gets smaller", width/3-600, 1150);
  text("press b to go back to the mainscreen", width/3-100, 1300);

  if (key=='b') {
    introscreen();
  }
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString); // taking the input values from arduino as a string and slicing them and putting them in strings as indivdual variables for each button
    float[] arduino_input = float(split(inString, ",")); //Create an array of arduino inputs and separate using the comma
    //println(arduino_input);
    if (arduino_input.length >= 2) {
      //stores the incoming values from the array into their corresponding variables
      player1Y = arduino_input[0]; //Assign first value of array
      player1Y = map(player1Y, 0, 1023, 0, height-250);//Mapping according to the confines of the screen
      player2Y = arduino_input[1];//Assign second value of array
      player2Y = map(player2Y, 0, 1023, 0, height-250);//Mapping according to the confines of the screen
      //println("This is p1y"+ player1Y); //Checking if potentiometers were working correctly and if y values were being changed
      //println("this is p2y" + player2Y);
    }
  }
}
