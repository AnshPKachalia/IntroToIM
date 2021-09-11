
void setup()
{
  size(600, 600);
  background(255);
}

void draw()
{
  squares1();
  squares2();
  colouredshape();
}

//black and white background
void squares1()
{
  for (int pos = 0; pos < (600); pos=pos+1) {
    rotate(PI/2);
    fill(random(255));
    rect(pos, pos, 600, 600);
  }
}

//Coloured background
void squares2()
{
  for (int pos = 0; pos < (600); pos=pos+1) {
    rotate(PI/2);
    fill(random(255), random(255), random(255));
    rect(pos, 600-pos, 600, 600);
  }
}


void colouredshape() {
  fill(255);
  //left ear
  circle(235, 230, 100);

  //right ear
  //Diving into 2 arcs to color the part above and below the line differently
  arc(370, 230, 100, 100, radians(135), radians(315));
  fill(0);
  arc(370, 230, 100, 100, radians(315), radians(495));

  //Face
  //Dividing into 2 arcs to color the part above and below the line differently
  fill(255);
  arc(300, 300, 150, 150, radians(135), radians(315));
  fill(0);
  arc(300, 300, 150, 150, radians(315), radians(495));
}
