//SS7_toggleLights
//supposed to toggle on three lights with one button
const int LED1 = 2;
const int LED2 = 3;
const int LED3 = 4;
const int BUTTON = 5;

int buttonState = HIGH;
int ledState1 = LOW;
int ledState2 = LOW;
int ledState3 = LOW;

void setup() {
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(BUTTON, INPUT_PULLUP);
}

void loop() {
  buttonState = digitalRead(BUTTON);

  if (buttonState == LOW) {
    ledState1 = !ledState1;
    ledState2 = !ledState2;
    ledState3 = !ledState3;
  }

  digitalWrite(LED1, ledState1);
  digitalWrite(LED2, ledState2);
  digitalWrite(LED3, ledState3);
}