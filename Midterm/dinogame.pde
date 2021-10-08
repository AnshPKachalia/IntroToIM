//Dino Game
import processing.sound.*;
SoundFile myJumpSound;
PImage dinointro;
PImage clouds;
PImage cactusimage[]=new PImage[3];
boolean introscreen=true;
boolean startgame=false;
PImage dinomain;

void setup() {
  //fullScreen(); using command to find confines ofthe screen
  // println(width);
  //println(height);
  background(32, 33, 36);
  size(3800, 2100, P2D); //Made size just lesser than fullscreen because its difficult to find the minimze and close buttons on topright in full screen mode
  hint(ENABLE_KEY_REPEAT);// Prevents user from holding the key in keypressed method
  myJumpSound = new SoundFile(this, "sprites_jump.wav");
}

void draw () {
  introscreen();

}


// Making the introscreen

void introscreen() {
  //PImage dinointro;
  dinointro=loadImage("Intro.png");

  if (introscreen==true & startgame==false) {
    background(32, 33, 36);
    fill(0, 0, 0);

    image(dinointro, 0, 0, width, 800);//Trial and error to find correct placement and size
    textSize(50);
    fill(154, 160, 166);
    text("Looks like you're not connected", width/2-890, height/3+150);
    text("Hit the Spacebar if you're bored", width/2-890, height/3+250);
  }

  if (key==' ') {
    startgame=true;
  }

  if (startgame==true) {
    begingame();// calling begin game
  }
}

//Drawing dino: Will place the dino in the correct location and deal with jumping and ducking mechanism
class dinoRunning {

  float x, y, yspeed;

  //Intializing dinorunning
  dinoRunning(float xcoord, float ycoord, float ySpeed) {
    x=xcoord;
    y=ycoord;
    yspeed=ySpeed;
  }

  void drawdino() {
    // println("called");// Checking if function was called

    dinomain=loadImage("dinosingle.png");
  }


  void dinojump() {
    if (keyPressed) {
      if (key==' ') {
        if (myJumpSound.isPlaying()==false) { //Fixing choppy sound
          yspeed=-60;
          myJumpSound.play();
          println("called");
        }
      }
    }
  }


  void dinomove() {
    image(dinomain, 200, y, 200, 200);
    y+=yspeed;
    yspeed+=100;
    y=constrain(y, 1000, 1500);//Prevents participant from holding spacebar to make dino levitate
  }

  void collision() {
    if (dist( dinorun.x, dinorun.y, obstacles.x, obstacles.y)<175) {
      //(dist(dinorun.y,obstacles.y)<200){
      text("ded", 400, 500);
    }
  }
}

//Cactus (Obstacles)
class cactus {
  float x, y;
  int index;
  cactus(float xposcact, float yposcact) {
    x=xposcact;
    y=yposcact;
  }

  void drawcactus() {
    for (int i=0; i<cactusimage.length; i++) {
      cactusimage[i]=loadImage("cactussingle"+i+".png");
    }
  }

  void cactusmove() {
    for (int index=0; index<3; index++) {
      x=x-30;
      y=1525;
      image(cactusimage[index], x, y, 150, 200);
    }
  }
}
//Time used as a score count

class scorecounter {
  float score, seconds;

  scorecounter(float tempscore, float tempseconds) {
    score = tempscore;
    seconds=tempseconds;
  }
  float gettime() {
    return(score);
  }
  void settime(float tempscore, float tempseconds) {
    score = tempscore;
    seconds=tempseconds;
  }
  void countup() {
    score += seconds;
    seconds=seconds+1;

    text(score, 100, 200);
  }
}

//Clouds 
class clouds{
 float x,y,xsize,ysize;
 clouds(float xtemp,float ytemp, float xsizetemp, float ysizetemp){
   x=xtemp;
   y=ytemp;
   xsize=xsizetemp;
   ysize=ysizetemp;
 }
 void drawcloud(){
  clouds=loadImage("cloud.png");
  image(clouds,x,y,xsize,ysize);
  image(clouds, x+1000,y,xsize,ysize);
 }
}

// End Game




dinoRunning dinorun=new dinoRunning(10, 1500, 15);
cactus obstacles=new cactus(3000, 1500);
scorecounter totalscore=new scorecounter(0, 1);
clouds background=new clouds(1000,400,300,200);

void begingame() {
  background(32, 33, 36);//Resets the background
  dinorun.drawdino();//Calling the dino drawing function
  dinorun.dinomove();
  dinorun.dinojump();
  obstacles.drawcactus();
  totalscore.settime(0, 1);
  totalscore.countup();
  obstacles.cactusmove();
  dinorun.collision();
  background.drawcloud();
}
