int val=0; //to send over Serial


import processing.serial.*;  

PImage redHand, greenHand

Serial myPort;  

void setup() {
  size(500, 500); 
  background (255);
  fill(0);
  rectMode (CENTER);
 
  image1= loadImage("clipart636992.png");
  image2 = loadImage("clipart340258.png");

  printArray(Serial.list()); 
  String portName = Serial.list()[3]; 
  myPort = new Serial(this, COM3, 9600);
}

void draw() {
  if (serial.available() > 0) {
    String data = serial.readStringUntil('\n');
    if (data != null) {
      data = trim(data);
      int value = Integer.parseInt(data); 
      background(0);
        if (value > 150) {
        image(redHand, 0, 0, width, height);
      } else {
        image(greenHand, 0, 0, width, height);
      }
    }
  }
}
