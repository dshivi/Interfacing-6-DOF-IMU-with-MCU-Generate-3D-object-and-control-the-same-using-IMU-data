import processing.serial.*;
Serial serialPort; // Serial object
String data;
void setup() {
  size(400, 400);
  serialPort = new Serial(this, "COM6", 9600); // Open serial port at 9600 baud
}
void draw() {
  if (serialPort.available() > 0) { // If data is available
  String data = serialPort.readStringUntil('\n');
    if (data != null) {
           println("Received sensor value1: "+data);
    }
    }
  }
