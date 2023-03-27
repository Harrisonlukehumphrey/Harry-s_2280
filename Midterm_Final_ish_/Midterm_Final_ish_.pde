//Midterm - Travel to marsw
/*
!INSTRUCTIONS!
MAKE SURE TO START ON LEFT SIDE OF SCREEN FOR FULL EFFECT
Use mouseX to travel to the red planet
hover over the planet until it becomes highlighted
click on the highlighted planet to land
*/ 

String gameState;
      
int planetX, planetY;       
int planetSize = 10;   
color planetColor;
color planetHighlight;

boolean planetOver = false;

int starCount = 400; 

float[] starSize = new float[starCount];
float[] xPosition = new float[starCount];
float[] yPosition = new float[starCount];


void setup() {
  size(800, 800);
  gameState = "START";
  planetColor = color(200,100,80);
  planetHighlight = color(200);
  planetX = width/2+planetSize/2+10;
  planetY = height/2;
   
  ellipseMode(CENTER);
  
    for(int i = 0; i<starCount; i++)
  {
    starSize[i] = random(0, 25);
    xPosition[i] = random(-width, width);
    yPosition[i] = random(-height, height);
  }
  
}

void draw() {
  
 if(gameState == "START") {
   startGame();
 }
 else if (gameState == "PLAY"){
   playGame();
 }
 else if (gameState == "MARS"){
   marsGame();
 }
}

  
  void startGame(){
    background(0);
    textMode(CENTER);
    fill(255);
    textSize(60);
    //text("CLICK TO LAUNCH", width/4, height/2);
    
    for(int i = 0; i<starCount; i++)
  {
    smooth();
    if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
  
 //https://processing.org/examples/star.html This example taught me how to rotate using push/popMatrix
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 800.0);
  ellipse(xPosition[i], yPosition[i], starSize[i], starSize[i]);
  text("MTECH 2280",0,100);
  text("CLICK TO LAUNCH", -200, 0);
  popMatrix();
  
    if(mousePressed){
      gameState = "PLAY";
    }
  }
  }
 
  void playGame(){
  update(mouseX, mouseY);
  background(0);
  
  //mouseX = 0;
 
  
    for(int i = 0; i<starCount; i++)
  {
    smooth();
    if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
  
  pushMatrix();
  translate(width*0.5, height*0.5);
  float scaleVar = map(mouseX, 0, width, 0.5, 5);
  scale(scaleVar);
  rotate(frameCount / 800.0);
  ellipse(xPosition[i], yPosition[i], starSize[i], starSize[i]);
  popMatrix();
 
  if (planetOver) {
    fill(planetHighlight);
  } else {
    fill(planetColor);
  }
  stroke(0);
  ellipse(planetX, planetY, planetSize+mouseX*.2, planetSize+mouseX*.2);
}

}

void update(int x, int y) {
  if ( planetCircle(planetX, planetY, planetSize) ) {
    planetOver = true;
  } else {
    planetOver = false;
  }
 
}  

void mousePressed() {
  if (planetOver) {
    gameState = "MARS";
  }
 //else
}


//https://processing.org/examples/button.html I used thise Example Creating lines 140-148
boolean planetCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter*0.5) {
    return true;
  } else {
    return false;
  }
}
void marsGame(){
  update(mouseX, mouseY);
  background(0);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  fill(200,100,80);
  rect(400, 600, width, height/2);
  
  fill(200);
    arc(600, 400, 30, 30, PI, PI+QUARTER_PI);
    arc(200, 600, 100, 100, PI, PI+QUARTER_PI);
    noStroke();
    
    
    
    fill(0,100, 255);
    ellipse(planetX, planetY-100, planetSize+10, planetSize+10);
    fill(0,255, 100);
    ellipse(planetX-5, planetY-102, 8, 5);
    ellipse(planetX-2, planetY-100, 3, 5);
    ellipse(planetX+4, planetY-98, 5, 6);
    ellipse(planetX-5, planetY-97, 2, 4);
    ellipse(planetX+4, planetY-104, 5, 3);
    
  

  if ( planetCircle(planetX, planetY-100, planetSize) ) {
    planetOver = true;
  } else {
    planetOver = false;
  }
  //gameState = "START";
  

if(mousePressed){
  if (planetOver) {
    gameState = "START";
  }
 //else
}
}

  boolean planetCircle2(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter*0.5) {
    return true;
  } else {
    return false;
  }
    
}
