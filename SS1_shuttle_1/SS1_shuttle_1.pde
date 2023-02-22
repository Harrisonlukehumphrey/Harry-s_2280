//Harrison Humphrey
//SS1_shuttle 1 is a drawing of a space shuttle with an US flag and an array of points meant to act as stars

float[][] distances;
float maxDistance;
int spacer;

void setup() {
  size(800, 800);
  maxDistance = dist(width/2, height/2, width, height);
  distances = new float[width][height];
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float distance = dist(width/2, height/2, x, y);
      distances[x][y] = distance/maxDistance * 255;
     
  
}  
    
  }
  spacer = 50;
  strokeWeight(3);
  noLoop();
}

void draw() {
  background(0);
  for (int y = 0; y < height; y += spacer) {
    for (int x = 0; x < width; x += spacer) {
      stroke(distances[x][y]);
      point(x + spacer/2, y + spacer/2);
      
       fill(200);
       triangle(320, 750, 432, 80, 544, 750);
       fill(255);
triangle(320, 300, 432, 80, 544, 300);
rect(320, 300, 224, 400);

fill(255,0, 0);
rect(400, 400, 100, 10);
fill(255);
rect(400, 410, 100, 10);

fill(0,0, 255);
rect(400, 400, 30, 20);

fill(255, 0, 0);
rect(400, 420, 100, 10);
fill(255);
rect(400, 430, 100, 10);
fill(255, 0, 0);
rect(400, 440, 100, 10);
fill(255);
rect(400, 450, 100, 10);
fill(255, 0, 0);
rect(400, 460, 100, 10);
    
    }
  }
}
