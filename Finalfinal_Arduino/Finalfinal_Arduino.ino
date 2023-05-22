int lightSensorPin = A0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int sensorValue = analogRead(lightSensorPin);
  Serial.println(sensorValue);
  delay(500);
}