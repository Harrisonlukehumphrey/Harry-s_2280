// SS6_Travelingthroughstars
//move mouseX to travel through space
//mouse pressed will change the color of stars

int starCount = 600; 

float[] starSize = new float[starCount];
float[] xPosition = new float[starCount];
float[] yPosition = new float[starCount];


float angle;


void setup(){
  size(800, 800);
  ellipseMode(CENTER);
  rectMode(CENTER);
  

  
  for(int i = 0; i<starCount; i++)
  {
    starSize[i] = random(0, 25);
    xPosition[i] = random(-width, width);
    yPosition[i] = random(-height, height);
  }
  
}


void draw()
{
  background(0);
  
  
  
  for(int i = 0; i<starCount; i++)
  {
    smooth();
     if (mousePressed == true) {
    fill(mouseX, mouseY, 50, 50);
  } else {
    fill(255);
  }
    

     // for this section I used Processing.org as a referencew
     if(mousePressed == false){
       //starCount = starCount + 1; 
       pushMatrix();
  translate(width*0.5, height*0.5);
  float scaleVar = map(mouseX, 0, width, 0.5, 5);
  scale(scaleVar);
  rotate(frameCount / 300.0);
  //ellipseMode(CENTER);
  ellipse(xPosition[i], yPosition[i], starSize[i], starSize[i]);
  popMatrix();
     }
     else
     {
             pushMatrix();
  translate(width*0.5, height*0.5);
   float scaleVar = map(mouseX, 0, width, 0.5, 5);
  scale(scaleVar);
  rotate(frameCount / 300.0);
  ellipse(xPosition[i], yPosition[i], starSize[i], starSize[i]);
  popMatrix();
     }
     fill(10,10,200, 100);
       ellipse(mouseX, mouseY-10, width/32, height/32);
       fill(200);
       
       rect(mouseX, mouseY, width/16, height/32, 28);
     //ellipse(xPosition[i], yPosition[i], starSize[i], starSize[i]);
  }
}
