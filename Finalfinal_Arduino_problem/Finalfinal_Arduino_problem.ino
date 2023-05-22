const int lightSensorPin = A0;
const int ultrasonicTrigPin = 9;
const int ultrasonicEchoPin = 10;

void setup() {
  Serial.begin(9600);

  pinMode(ultrasonicTrigPin, OUTPUT);
  pinMode(ultrasonicEchoPin, INPUT);
}

void loop() {
  int lightSensorValue = analogRead(lightSensorPin);
  int ultrasonicDistance = getUltrasonicDistance();

  Serial.print("Light Sensor: ");
  Serial.print(lightSensorValue);
  Serial.print(" - Ultrasonic Distance: ");
  Serial.println(ultrasonicDistance);

  delay(500);
}

int getUltrasonicDistance() {
  digitalWrite(ultrasonicTrigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(ultrasonicTrigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(ultrasonicTrigPin, LOW);

  long duration = pulseIn(ultrasonicEchoPin, HIGH);
  int distance = duration * 0.034 / 2;
  distance = constrain(distance, 0, 255); 
  return distance;
}