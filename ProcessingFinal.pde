int val = 0; 

import processing.serial.*;

PImage redHand, greenHand;

Serial myPort;

void setup() {
  size(500, 500);
  background(255);
  fill(0);
  rectMode(CENTER);

  redHand = loadImage("clipart636992.png");
  greenHand = loadImage("clipart340258.png");

  printArray(Serial.list());
  String[] portNames = Serial.list();
  if (portNames.length > 0) {
    String portName = portNames[0]; 
    myPort = new Serial(this, portName, 9600);
  } else {
    println("");
  }
}

void draw() {
  if (myPort != null && myPort.available() > 0) {
    String data = myPort.readStringUntil('\n');
    if (data != null) {
      data = trim(data);
      int value = Integer.parseInt(data);
      background(0);
      if (value > 6) {
        drawImage(greenHand);
      } else {
        drawImage(redHand);
      }
    }
  }
}

void drawImage(PImage img) {
  float imgX = width / 2 - img.width / 2;
  float imgY = height / 2 - img.height / 2;
  image(img, imgX, imgY);
}
