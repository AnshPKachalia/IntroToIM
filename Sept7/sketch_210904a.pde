size(1000,1000);

 //Face
 fill(223,166,117);
 arc(500,400,300,500,0,PI);
 
 //Eyes
 fill(0,0,0);//Eyebrow color
 rect(410,410,85,20);//left eye brow
 rect(510,410,85,20);//right eyebrow
 
 fill(223,166,117);//Glasses color
rect(410,435,85,70);//Left glass
 rect(510,435,85,70);//right glass
 
 fill(255,255,255);//Both eye color
 circle(450,470,60);//left eye
 circle(550,470,60);//right eye

 fill(0,0,0);//Pupil color
 arc(450,492,30,40,radians(180),radians(360));//left pupil
 arc(550,492,30,40,radians(180),radians(360));//right pupil
 line(495,460,510,460);//glass connector

   stroke(223,166,117);//eyebrow cut
  strokeWeight(5);//eyebrow cut
line(520,420,595,425);//eyebrow cut

//Nose
stroke(0,0,0);
strokeWeight(1);
line(500,500,520,520);
line(500,520,520,520);

//Smile
fill(0,0,0);
arc(500,540,100,80,0,PI);
fill(255,255,255);
rect(465,540,15,15);
rect(482,540,15,15);
rect(499,540,15,15);
rect(516,540,15,15);

//Ears
 fill(223,166,117);
arc(350,430,40,50,radians(90),radians(270));
arc(650,430,40,50,radians(270),radians(450));

//Hair
fill(0,0,0);
arc(500,400,350,400,radians(180),radians(360));
fill(223,166,117);
triangle(500,400,510,380,520,400);
triangle(440,400,450,380,460,400);
triangle(380,400,390,380,400,400);
triangle(560,400,570,380,580,400);
triangle(620,400,630,380,640,400);

 


 
 
 
 
 
