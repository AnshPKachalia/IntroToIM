//Ansh Kachalia
//This is the dino game, which is popularly seen when the internet goes out. 
//This is a simplifies attempt at the game and does not account for certain features that exist in the actual game.
//Sources and inspirations:
//https://github.com/yjqiang/chrome_dinosaur 
//https://thecodingtrain.com/CodingChallenges/147-chrome-dinosaur.html


//Dino Game
import processing.sound.*; //Importing to be able to play sound
SoundFile myJumpSound; //Creating sound file
//Creating global variables for required images, floats and booleans
PImage dinointro;
PImage clouds;
//PImage cactusimage[]=new PImage[3];
PImage cactusmain;
boolean introscreen=true;
boolean startgame=false;
boolean dead=false;
boolean restart=false;
PImage dinomain;
float score;

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
  introscreen();//Only calling introscreen in draw, once introscreen is called, it calls all other required functions
}


// Making the introscreen

void introscreen() {
  dinointro=loadImage("Intro.png"); //Loading the intro dino image

  if (introscreen==true & startgame==false) { //Using booleans to set conditions that will come handy when triggering another fucntion
    background(32, 33, 36);//Resetting the background so that the previous once can be erased

    image(dinointro, 0, 0, width, 800);//Trial and error to find correct placement and size
    textSize(50);
    fill(154, 160, 166); //Used the same colorscheme as google chrome
    text("Looks like you're not connected", width/2-890, height/3+150);
    text("Hit the Spacebar if you're bored", width/2-890, height/3+250);// Text on the introscreen to give user instructions
  }

  if (key==' ') {
    startgame=true; //sets boolean as true to trigger next function
  }

  if (startgame==true) {
    begingame();// calling begin game
    println("introcalled", startgame);//Checking if the function was called
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
    println("drawcalled");// Checking if function was called

    dinomain=loadImage("dinosingle.png"); //Loading main dino image
  }


  void dinojump() { //Making the jump mechanism and sound
    if (keyPressed) {
      if (key==' ') {
        if (myJumpSound.isPlaying()==false) { //Fixing choppy sound
          yspeed=-60; //Reduces y by 60 per while the spacebar is pressed. Helps dino jump over obstacles
          myJumpSound.play();//Plays sounds only when space is pressed
          println("jumping");//Checking if jump was called
        }
      }
    }
  }


  void dinomove() {
    image(dinomain, 800, y, 250, 250);
    y+=yspeed;
    yspeed+=100;
    y=constrain(y, 950, 1450);//Prevents participant from holding spacebar to make dino levitate
  }

  void collision() { //Checks for collision
    if (dist( dinorun.x,dinorun.y,obstacles.x,obstacles.y)<150) { // Using dist between centre of both images to check whether collision occured
      dead=true;//Sets boolean as true so it can be used to trigger a new function
    }

    if (dead==true) { //Triggering endgame function
      endgame();
      println("end");
    }
  }
}

//Cactus (Obstacles)
class cactus {
  float x;
  float y;
  int index;
  cactus(float xposcact, float yposcact) {
    x=xposcact;
    y=yposcact;
  }

  void drawcactus() {
    //for (int i=0; i<cactusimage.length; i++) {
    //  cactusimage[i]=loadImage("cactussingle"+i+".png"); //Making an array of images and using 3 different cactus images
    //}
    cactusmain=loadImage("cactussingle1.png");
  }

  void cactusmove() {
    //for (int index=0; index<3; index++) {
    x=x-100; //Changing x value so the obstacle moves closer to the dino
    y=1525;
    image(cactusmain, x, y, 150, 200); //Displaying the different images
    //}
    if (x<20) {
      x=3000;
    }
  }
}
//Time used as a score count

class scorecounter {
  float seconds;

  scorecounter(float tempseconds) {
    seconds=tempseconds;
  }
  float gettime() {
    return(score);
  }
  void settime(float tempseconds) {
    seconds=tempseconds;
  }
  void countup() { 
    score += seconds; //Increases with seconds

    text(score, 100, 200);
   
  }
}

//Clouds
class clouds {
  float x, y, xsize, ysize;
  clouds(float xtemp, float ytemp, float xsizetemp, float ysizetemp) {
    x=xtemp;
    y=ytemp;
    xsize=xsizetemp;
    ysize=ysizetemp;
  }
  void drawcloud() {
    clouds=loadImage("cloud.png");
    image(clouds, x, y, xsize, ysize);// Easier to write cloud 5 times than create an array
    image(clouds, x+1000, y, xsize, ysize);
    image(clouds, x+1400, y+500, xsize, ysize);
    image(clouds, x+2000, y+300, xsize, ysize);
    image(clouds, x+400, y+400, xsize, ysize);
  }
}

// End Game
void endgame() {
  background(32, 33, 36);
  text("Game over", 500, 500);
  text("Press R to replay the game", 600, 700); //Instructions to start the game again


  if (key=='r') {
    startgame=false; //Making booleans negative so that begingame() gets triggered
    dead=false;
    println(key);
  }
}





dinoRunning dinorun=new dinoRunning(10, 1450, 15);
cactus obstacles=new cactus(3000, 1500);
scorecounter totalscore=new scorecounter(1);
clouds backdrop=new clouds(1000, 400, 300, 200);


//Calling all functions
void begingame() {
  background(32, 33, 36);//Resets the background
  dinorun.drawdino();//Calling the dino drawing function
  dinorun.dinomove();
  dinorun.dinojump();
  obstacles.drawcactus();
  totalscore.settime(1);
  totalscore.countup();
  obstacles.cactusmove();
  dinorun.collision();
  backdrop.drawcloud();
}
