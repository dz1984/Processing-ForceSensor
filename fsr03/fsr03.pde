import processing.serial.*;
Serial port;

void setup() {
  size(200, 200);
  smooth();
  String arduinoPort = "COM4";
  port = new Serial(this, arduinoPort, 9600);
  port.buffer(100);
  frameRate(1000);
}

void draw() {
  background(200, 200, 200);
  if (port.available()>0) {
    String tmp = port.readStringUntil('\n');
    if (tmp!=null) {
      //System.out.println(tmp);
      int[] fsrReadings = int(splitTokens(trim(tmp), ","));
      int len = fsrReadings.length;
      for (int i=0; i<len; i++) {
        FSR tmpFSR = new FSR("Channels-"+i, fsrReadings[i]);
        translate(0, 50);
        tmpFSR.update();
      }
    }
  }
  //delay(1000);
}

