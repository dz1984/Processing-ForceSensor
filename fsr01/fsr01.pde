import processing.serial.*;
Serial port;
int x;
float val;
float easing = 0.1;
float easedVal;

void setup(){
  size(440,255);
  frameRate(30);
  smooth();
  //To establish a channel between Arduino and Processing
  String arduinoPort = Serial.list()[1];
  port = new Serial(this,arduinoPort,9600);
  //Setup background color is black
  background(0);
}
//Draw a gride.
void gride(){
  stroke(255);
  for (int i=1; i<=4; i++){
    int dash_len = width/20;
    for (int j=0;j<dash_len; j+=2)
      line(j*dash_len,(height*i)/4,(j*dash_len)+dash_len,(height*i)/4);
  }
}
void draw(){
  if (port.available()>0){
    //Read data from serial port.
    val = port.read();
    //Translate the data to 0~height of display of windows.
    val = map(val,0,254,0,height);
  }
  float targetVal = val;
  //Setup easing effect.
  easedVal += (targetVal-easedVal) * easing;
  
  //Clear the vertical line.
  stroke(0);
  line(x,0,x,height);
  
  //Draw data curve.
  stroke(43,142,4);
  line(x,255-easedVal,x,255-easedVal);
  
  //Draw separate line.
  stroke(255,0,0);
  line(x+1,0,x+1,height);
  
   gride();
  x++;
  //if x over th width of display windows then reset to 0.
  if ( x>width)
    x=0;
}
