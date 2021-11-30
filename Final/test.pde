float ballX, ballY; //Variables to control ball position
float speedX, speedY; // Varaibles to control ball position

void setup() {
  size(2500, 1500);
  ballX = 1250;
  ballY = 750;
  speedX=10;
  speedY=10;
}

void draw() {
  background(0); 
  fill(255);
  ellipse(ballX, ballY, 40, 40); 
  if (ballY<20|| ballY>height-20) { 
    speedY=-speedY;  //Change direction of movement once ball touches the top or bottom edges
  }

  if (ballX<20|| ballX>width-20) {
    speedX=-speedX; //Change direction of movement once ball touches the left or right edges
  }
  ballX = ballX + speedX; //Increasing the ball x pos using speed
  ballY = ballY + speedY; //Increasing the ball y pos using speed
}
