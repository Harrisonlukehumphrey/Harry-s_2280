//Harrison Humphrey
//MTEC 2280
//SS1_Sketch3 uses for loops to emulate walking around a fence


int x= 50;
int y= 50;
//int c = 50;
void setup(){
  size(800, 800);
}

void draw(){
  background(50,50,230);
  fill(100,200,100);
  rect(0, height/2, width, 400);
  
  
 for(int x = 0; x<width; x = x+20){
 
 //line(mouseX, 0, x, height);
 line(mouseX + y, 0, mouseX , height);
 }
 
// int c= 50; 
//  while(c<width){
 //   ellipse(x, height - 100, 75, 75);
   // x+=100;
  //}
 
 strokeWeight(10); 
  for (int y = 0; y < height; y = y + 50){
  line(mouseX, y, width/2, height/2);
  
  
 
  
 
  }
  
  
}
  
