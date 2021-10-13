//Ansh Kachalia
//This is the dino game, which is popularly seen when the internet goes out. 
//This is a simplified attempt at the game and does not account for certain features that exist in the actual game.
//Sources and inspirations:
//https://github.com/yjqiang/chrome_dinosaur 
//https://thecodingtrain.com/CodingChallenges/147-chrome-dinosaur.html
//https://forum.processing.org/


//Dino Game
import processing.sound.*; //Importing to be able to play sound
SoundFile myJumpSound; //Creating sound file
//Creating global variables for required images, floats and booleans
PImage dinointro;
PImage clouds;
PImage cactusimage[]=new PImage[3];
boolean introscreen=true;
boolean startgame=false;
boolean dead=false;
boolean restart=false;
PImage dinomain;
float score;

void setup() {
  background(32, 33, 36);
  size(3800, 2100,P2D); //Made size just lesser than fullscreen because it is difficult to find the minimze and close buttons on topright in full screen mode
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
          yspeed=-100; //Reduces y by 100 while the spacebar is pressed. Helps dino jump over obstacles
          myJumpSound.play();//Plays sounds only when space is pressed
          println("jumping");//Checking if jump was called
        }
      }
    }
  }


  void dinomove() {
    image(dinomain, 50  , y, 250, 250);
    y+=yspeed;
    yspeed+=100;// downard motion after jump
    y=constrain(y, 950, 1450);//Prevents participant from holding spacebar to make dino levitate
  }

  void collision() { //Checks for collision
    if (dist( dinorun.x,dinorun.y,obstacles.x,obstacles.y)<200) { // Using dist between centre of both images to check whether collision occured
      dead=true;//Sets boolean as true so it can be used to trigger a new function
    
    }

    if (dead==true) { //Triggering endgame function
      endgame();
      println("end");// checking is endgame was triggered
    }
  }
}

//Cactus (Obstacles)
class cactus {
  float x,y;
  int index;
  cactus(float xposcact, float yposcact) {
    x=xposcact;
    y=yposcact;
  }

  void drawcactus() {
    for (int i=0; i<cactusimage.length; i++) {
      cactusimage[i]=loadImage("cactussingle"+i+".png"); //Making an array of images and using 3 different cactus images
    }
  }

  void cactusmove() {
    for (int index=0; index<3; index++) {
    x=x-50; //Changing x value so the obstacle moves closer to the dino
    y=1525;
    image(cactusimage[index], x, y, 150, 200); //Displaying the different images
    }
    println("cactus at (x,y)=("+x+","+y+")");//Finding position so it cn be used for colliision mechanism
    if (x<10) {// Helps respawn the obstacle once it runs out of the screen
      x=3000;
    }
  }
}

//Keeping Score

  void countup(){
    if(dead==false){
      //score=0;
    score++; //Score increases incrementally 
  text (score,100,200);// Displays score on top left corner
  }
  else if (dead==true){
   score=score+0;
  }
  }


//Clouds
class clouds { //Just decoration pieces because the screen looked really empty
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
    image(clouds, x+2000, y+300, xsize, ysize);
    image(clouds, x+400, y+400, xsize, ysize);
    circle(x-400,y,200);
    fill(255,255,255);
  }
}

// End Game
void endgame() {
  background(32, 33, 36);
  textSize(50);
  text("Game over", width/2, 1000);
  text("Press R to replay the game", width/2, 1100); //Instructions to start the game again
text("Your total score is"+ score,width/2,1200);
  if (key=='r') {
    startgame=false; //Making booleans false so that begingame() gets triggered
    dead=false; ////Making booleans false so that begingame() gets triggered
    score=0;// Resetting score
    println(key);// Checking for correct key being pressed
  }
}


dinoRunning dinorun=new dinoRunning(10, 1450, 15);
cactus obstacles=new cactus(3000, 1500);
clouds backdrop=new clouds(1000, 400, 300, 200);


//Calling all functions
void begingame() {
  background(32, 33, 36);//Resets the background
  dinorun.drawdino();
  dinorun.dinomove();
  dinorun.dinojump();
  obstacles.drawcactus();
  obstacles.cactusmove();
  dinorun.collision();
  backdrop.drawcloud();
  countup();
}
