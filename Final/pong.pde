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





float ballX, ballY; //Variables to control ball position
float speedX, speedY; // Varaibles to control ball position
float acceleration;// Varaible to increase acceleration with time
PFont burko; // Original font from the Pong game
boolean introscreen=true; //Setting booleans to be able to track whcih screen is being trigerred
boolean startgame=false;


void setup() {
  size(2500, 1500);
  ballX = 1250;
  ballY = 750;
  speedX=10;
  speedY=10;
  burko= createFont("burko.ttf", 200); //Creating the original pong font
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
  ellipse(ballX, ballY, 40, 40); 
  calc();

  if (ballY<20|| ballY>height-20) { 
    speedY=-speedY;  //Change direction of movement once ball touches the top or bottom edges
  }

  if (ballX<20|| ballX>width-20) {
    speedX=-speedX; // To change 
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
