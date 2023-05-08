int lightSensorPin = A0;

void setup()
{
  Serial.begin(9600);

}

void loop()
{
  int sensorValue = analogRead(lightSensorPin);
   if (analogValue < 10) {
    Serial.println("Hand");
  } else if (analogValue < 200) {
    Serial.println("NoHand");
  }
  delay(300);
}
