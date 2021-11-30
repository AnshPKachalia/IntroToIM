float ballX,ballY;
float speedX, speedY;
float acceleration;
PFont burko; 
boolean introscreen=true;
boolean startgame=false;


void setup(){
  size(2500,1500);
  ballX = 1250;
ballY = 750;
speedX=10;
speedY=10;
burko= createFont("burko.ttf",200);
}

void draw() {
background(0);
fill(255);
introscreen();
}


void introscreen(){
  if (introscreen==true & startgame==false) {
  textFont(burko);
  text("PONG" ,1000,height/2);
  textSize(100);
  text("Press SPACE to Play", 700, height/2 +200);
}
if (key==' '){
  startgame=true;
}
if(startgame==true){
 maingame(); 
}
}


void maingame(){
 ellipse(ballX,ballY,40,40); 
 calc();
 
 if(ballY<20|| ballY>height-20){
   speedY=-speedY;
 }
 
 if(ballX<20|| ballX>width-20){
   speedX=-speedX;
 }
}

void calc(){
  ballX = ballX + speedX;
ballY = ballY + speedY;
speedX=speedX+acceleration;
speedY=speedY+acceleration;

if (speedX<0){
 acceleration=-0.02; 
}
else if (speedX>0){
 acceleration=0.02; 
}

if (speedY<0){
 acceleration=-0.02; 
}
else if (speedY>0){
 acceleration=0.02; 
}
}
