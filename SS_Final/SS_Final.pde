//Final
import processing.serial.*;

Serial myPort; 
int analogValue; 

void setup() {
  size(400, 400);
  myPort = new Serial(this, "COM", 9600); 

void draw() {
  if (myPort.available() > 0) { 
    analogValue = myPort.read(); 
  background(255);
  text("Is hand there?: " + analogValue, 20, 20);
} 
