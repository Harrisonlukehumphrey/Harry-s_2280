//SS4_AIArcadeDream
//this drawing uses a timer to move a png character across a .jpg background


PImage img1;
PImage img2;
float x = 0;
float y = 350;
int time1 = 2000;
int time2 = 5000;
String p = "SS4_AIAcadeDream";

void setup() {
  frameRate(60);
 size(600, 450);
 smooth();
 println(PFont.list());
 
 
 img1 = loadImage("AIworld1-1.jpg");
 img2 = loadImage("IMG_0406.PNG");
 
 
//PFont f createFont("Calibri");

 
 

}
void draw() {
 
  image(img1, 0, 0);
  PFont f = createFont("Cascadia Code",30 );
  textFont(f);
  textSize(30);
   fill(0);
 text(p, 250, 25);
  
//y += random(-1, 1);
 
  int currentTime = millis();
 if (currentTime > time2) {
 x -= 2;
 } 
 
 
 else if (currentTime > time1) {
 x += 4;
 }
 
 
 if (currentTime> time1){
  y += random(-1, 1);


} else if (currentTime> time2){
  y =350;
}


image(img2, x, y, 70, 75);
}
