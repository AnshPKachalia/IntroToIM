PImage dinorunningsheets;//sprite sheet of dino running
PImage[][] dinorunning;
int direction = 0; // 0 up
int step = 0;
int x;
int y;
int speed = 3;//setting speed

void setup() {
  fullScreen();
  dinorunningsheets = loadImage("dino.png");
  dinorunning = new PImage[1][5];//1 row and 5 columns

  int w = dinorunningsheets.width/5;
  int h = dinorunningsheets.height;
  //dividing the spritesheet
  for (int y=0; y<1; y=y+0) {
    for (int x=0; x< 5; x++) {
      dinorunning[y][x] = dinorunningsheets.get(x*w, y*h, w, h);
    }
    x=200;
    y=500;
  }
}

void draw() {
  background(255);
  //if (keyPressed) {
  //  if (key==' ') {
  //    direction=0;


  if (frameCount%speed==0) {
    step = (step+1) % 5;
  }


  image(dinorunning[direction][step], x, y);//sprite images of dinorunning
  println (y);
  println(x);
}
