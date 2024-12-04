#include <Wire.h>

void setup() {
  Serial.begin(9600);         // Start the serial communication
  Wire.begin();               // Start the I2C bus

  // Initialize Wii Nunchuck
  Wire.beginTransmission(0x52); // 0x52 is the I2C address of the Nunchuck
  Wire.write(0xF0);             // Initialization command
  Wire.write(0x55);             // Initialization value
  Wire.write(0xFB);             // Initialization command
  Wire.write(0x00);             // Initialization value
  Wire.endTransmission();
}

void loop() {
  requestNunchuckData();     // Request data from the Nunchuck
  delay(100);                 // Small delay between readings
}

void requestNunchuckData() {
  Wire.beginTransmission(0x52);
  Wire.write(0x00);          // Request data command
  Wire.endTransmission();

  Wire.requestFrom(0x52, 6); // Request 6 bytes of data
  if (Wire.available() == 6) {
    // Read raw data
    byte joyX = decode(Wire.read());
    byte joyY = decode(Wire.read());
    byte accelX = decode(Wire.read());
    byte accelY = decode(Wire.read());
    byte accelZ = decode(Wire.read());
    byte buttons = decode(Wire.read());

    // Extract button states
    bool buttonC = !(buttons & 0x02);  // C button is active low
    bool buttonZ = !(buttons & 0x01);  // Z button is active low

    // Print data to Serial Monitor
    Serial.print("Joystick: (X=");
    Serial.print(joyX);
    Serial.print(", Y=");
    Serial.print(joyY);
    Serial.print("), ");
    Serial.print("Accelerometer: (X=");
    Serial.print(accelX);
    Serial.print(", Y=");
    Serial.print(accelY);
    Serial.print(", Z=");
    Serial.print(accelZ);
    Serial.print("), ");
    Serial.print("Buttons: C=");
    Serial.print(buttonC);
    Serial.print(", Z=");
    Serial.println(buttonZ);
  }
}

// Wii Nunchuck encodes data in a special way, so we need to decode it
byte decode(byte data) {
  return (data ^ 0x17) + 0x17;
}