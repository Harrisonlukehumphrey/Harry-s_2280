//SS_Midterm - Travel to mars
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
    text("CLICK TO LAUNCH", width/4, height/2);
    
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
  rotate(frameCount / 800.0);
  ellipse(xPosition[i], yPosition[i], starSize[i], starSize[i]);
  popMatrix();
  
    if(mousePressed){
      gameState = "PLAY";
    }
  }
  }
 
  void playGame(){
  
  update(mouseX, mouseY);
  background(0);
  
 
  
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
  
  background(0);
  rectMode(CENTER);
  ellipseMode(CENTER);
  fill(200,100,80);
  rect(400, 600, width, height/2);
  fill(200);
    arc(600, 400, 30, 30, PI, PI+QUARTER_PI);
    arc(200, 600, 100, 100, PI, PI+QUARTER_PI);
    noStroke();
    
    if(keyPressed){
      
        gameState = "START"; 
}
}
