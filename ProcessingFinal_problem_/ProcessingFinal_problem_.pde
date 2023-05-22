import processing.serial.*;

Serial myPort;

int ultrasonicDistance;
int lightSensorValue;

PImage redHand, greenHand;

void setup() {
  size(500, 500);
  background(0);
  
  redHand = loadImage("clipart636992.png");
  greenHand = loadImage("clipart340258.png");
  
  
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if (myPort.available() > 0) {
    String data = myPort.readStringUntil('\n');
    if (data != null) {
      data = trim(data);
      String[] values = data.split(",");
      
      if (values.length == 2) {
        ultrasonicDistance = int(values[0]);
        lightSensorValue = int(values[1]);
        
        background(255);
        
      
        textSize(24);
        fill(0, 0, 255);
        text("Ultrasonic: " + ultrasonicDistance, width/2, height/2 - 60);
        
       
        textSize(24);
        fill(255, 0, 0);
        text("Light Sensor: " + lightSensorValue, width/2, height/2 - 20);
        
        
        if (lightSensorValue > 176yutgf) {
          drawCenteredImage(redHand);
        } else {
          drawCenteredImage(greenHand);
        }
      }
    }
  }
}

void drawCenteredImage(PImage img) {
  float imgX = width / 2 - img.width / 2;
  float imgY = height / 2 - img.height / 2;
  image(img, imgX, imgY);
}
