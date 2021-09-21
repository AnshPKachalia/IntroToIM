
float t=0;//Time for perlin noise

//Making a class to generate boxes
class boxes {
  float x, y, xsize, ysize ;

  boxes(float xpos, float ypos) {
    x=xpos;
    y=ypos;
    xsize=40;
    ysize=90;
  }

  void drawboxes() {
    rect(x, y, xsize, ysize);
  }
}
boxes[] boxarray= new boxes[5];

void setup() {
  size(1000, 1000);
  frameRate(10);
  background(0);
}

void draw() {
  float x=noise(t);// initializing the variable with perin noise
  x=map(x, 0, 1, 0, width);//mapping to scale
  t=t+0.01;// time increment

  for (int i=0; i< boxarray.length; i++) {
    boxarray[i]=new boxes(x, random(0, 910));//for loop to make additional boxes

    //implementing perlin noise on color
    float red=noise(t);
    red=map(red, 0, 1, 100, 255);
    float green=noise(t);
    green=map(green, 0, 1, 150, 255);
    float blue=noise(t);
    blue=map(blue, 0, 1, x, 255);
    fill(red, green, blue);

    boxarray[i].drawboxes();
  }
}
