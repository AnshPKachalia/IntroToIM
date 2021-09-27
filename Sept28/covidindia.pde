Table covid; //creates table


void setup() {
  size(3840, 2160);
  background(0);
  covid = loadTable("covidcases.csv", "header"); //strings to load
}

void draw() {

  background(0); //set background colour
  fill(255, 0, 0); //set text colour
  textSize(25); //text size
  bubbles();
  noLoop();
}
void bubbles() {
  for (TableRow row : covid.rows()) {
    int cases=int(row.getString("Total Cases"));
    float cases1=map(cases, 0, 6524498, 0, 2500);

    int discharged=int(row.getString("Discharged"));
    float discharged1= map(discharged, 0, 6340723, 0, 2429.58);
    float xcord=random(30, width-30);
    float ycord=random(30, height-30);

    circle(xcord, ycord, cases1);
    circle(xcord, ycord, discharged1);
    float r= random(0, 255);
    float g=random(0, 255);
    float b=random(0, 255);
    fill(r, g, b, 50);
  }
}
