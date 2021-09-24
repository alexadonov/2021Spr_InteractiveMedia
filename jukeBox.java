import controlP5.*;
import beads.*;
import java.util.Arrays; 

AudioContext ac;
SamplePlayer p1, p2, p3, p4, p5, p6;
ControlP5 cp5;
//adjust cols and rows to resize the display monitor
Cell[][] grid; 
int cols = 12;
int rows = 11;
//global variable to change jukebox
float jukeWidth = 200;
int buttonSize = 20;
int musicPlaying = 0;

void setup() {
  size(600, 600);
//display monitor
  grid = new Cell[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*10, j*10, 10, 10, i + j);
    }
  }
//sound button
ac = new AudioContext();
cp5 = new ControlP5(this);

cp5.addButton("music1")
.setValue(0)
.setCaptionLabel("+")
.setPosition(jukeWidth*1.05,jukeWidth*1.2)
.setSize(buttonSize,buttonSize)
.setColorBackground(#C9753D)
.setColorForeground(color(255, 0, 0))
.setColorActive(color(0, 0, 255));
;

cp5 = new ControlP5(this);
cp5.addButton("music2")
.setValue(0)
.setCaptionLabel("+")
.setPosition(jukeWidth*1.25,jukeWidth*1.2)
.setSize(buttonSize,buttonSize)
.setColorBackground(#726A95)
.setColorForeground(color(255, 0, 0))
.setColorActive(color(0, 0, 255))
;

cp5 = new ControlP5(this);
cp5.addButton("music3")
.setValue(0)
.setCaptionLabel("+")
.setPosition(jukeWidth*1.45,jukeWidth*1.2)
.setSize(buttonSize,buttonSize)
.setColorBackground(#9D7726)
.setColorForeground(color(255, 0, 0))
.setColorActive(color(0, 0, 255))
;

cp5 = new ControlP5(this);
cp5.addButton("music4")
.setValue(0)
.setCaptionLabel("+")
.setPosition(jukeWidth*1.65,jukeWidth*1.2)
.setSize(buttonSize,buttonSize)
.setColorBackground(#34626C)
.setColorForeground(color(255, 0, 0))
.setColorActive(color(0, 0, 255))
;

cp5 = new ControlP5(this);
cp5.addButton("music5")
.setValue(0)
.setCaptionLabel("+")
.setPosition(jukeWidth*1.85,jukeWidth*1.2)
.setSize(buttonSize,buttonSize)
.setColorBackground(#70AF85)
.setColorForeground(color(255, 0, 0))
.setColorActive(color(0, 0, 255))
;

cp5 = new ControlP5(this);
cp5.addButton("STOP")
.setValue(0)
.setPosition(jukeWidth*5/4,jukeWidth*1.02)
.setSize(buttonSize*5/4,buttonSize*5/4)
.setColorBackground(color(255, 0, 0))
.setColorForeground(color(0, 255, 0))
.setColorActive(color(0, 0, 255))
;

cp5 = new ControlP5(this);
cp5.addButton("PLAY")
.setValue(0)
.setPosition(jukeWidth*13/8,jukeWidth*1.02)
.setSize(buttonSize*5/4,buttonSize*5/4)
.setColorBackground(#133A1B)
.setColorForeground(color(255, 0, 0))
.setColorActive(color(0, 0, 255))
;

sound();
}

void sound(){
   String sample1 = sketchPath("") + "data/waltz-for-hulot.wav";
   String sample2 = sketchPath("") + "data/kind-as-ever.wav";
   String sample3 = sketchPath("") + "data/a-border.wav";
   String sample4 = sketchPath("") + "data/tricolor.wav";
   String sample5 = sketchPath("") + "data/kirari-futari.wav";
   
   p1 = new SamplePlayer(ac, SampleManager.sample(sample1));
   p1.setKillOnEnd(false);
   p1.setToEnd(); 
   
   Gain g1 = new Gain(ac, 1, 0.5);
   g1.addInput(p1);

   p2 = new SamplePlayer(ac, SampleManager.sample(sample2));
   p2.setKillOnEnd(false);
   p2.setToEnd();
   Gain g2 = new Gain(ac, 1, 0.5);
   g2.addInput(p2);

   p3 = new SamplePlayer(ac, SampleManager.sample(sample3));
   p3.setKillOnEnd(false);
   p3.setToEnd();
   Gain g3 = new Gain(ac, 1, 0.5);
   g3.addInput(p3);

   p4 = new SamplePlayer(ac, SampleManager.sample(sample4));
   p4.setKillOnEnd(false);
   p4.setToEnd();
   Gain g4 = new Gain(ac, 1, 0.5);
   g4.addInput(p4);

   p5 = new SamplePlayer(ac, SampleManager.sample(sample5));
   p5.setKillOnEnd(false);
   p5.setToEnd();
   Gain g5 = new Gain(ac, 1, 0.5);
   g5.addInput(p5);
   
   ac.out.addInput(g1);
   ac.out.addInput(g2);
   ac.out.addInput(g3);
   ac.out.addInput(g4);
   ac.out.addInput(g5);
   ac.start();
}

void draw() {
  background(0);
//first outer
stroke(255);
fill(133, 129, 252);
arc(jukeWidth*1.5, jukeWidth, jukeWidth+jukeWidth/4, jukeWidth+jukeWidth/4, PI, TWO_PI); //
rect(jukeWidth-jukeWidth/8,jukeWidth,jukeWidth+jukeWidth/4,jukeWidth,3);
//second out
fill(129, 187, 252);
arc(jukeWidth*1.5, jukeWidth, jukeWidth+jukeWidth/8, jukeWidth+jukeWidth/8, PI, TWO_PI);
rect(jukeWidth-jukeWidth/16,jukeWidth,jukeWidth+jukeWidth/8,jukeWidth,3);
//inner
fill(129, 218, 252);
noStroke();
rect(jukeWidth,jukeWidth,jukeWidth,jukeWidth,3);
arc(jukeWidth*1.5, jukeWidth, jukeWidth, jukeWidth, PI, TWO_PI);
//inner of inner
fill(255, 209, 243);
rect(jukeWidth+(jukeWidth/5),jukeWidth+(jukeWidth/3),jukeWidth*3/5,jukeWidth/3,3);
//legs
stroke(0);
fill(252, 252, 75);
rect(jukeWidth-jukeWidth/5,jukeWidth*2-jukeWidth/6,jukeWidth/4,jukeWidth/6+1,10);
rect(jukeWidth*2-jukeWidth/16,jukeWidth*2-jukeWidth/6,jukeWidth/4,jukeWidth/6+1,10);
//
fill(255, 209, 243);
stroke(0);
rect(jukeWidth-jukeWidth/5,jukeWidth+jukeWidth/10,jukeWidth/4,jukeWidth/20,5);
rect(jukeWidth-jukeWidth/5,jukeWidth+jukeWidth/20,jukeWidth/4,jukeWidth/20,5);
rect(jukeWidth-jukeWidth/5,jukeWidth,jukeWidth/4,jukeWidth/20,5);

rect(jukeWidth*2-jukeWidth/16,jukeWidth,jukeWidth/4,jukeWidth/20,5);
rect(jukeWidth*2-jukeWidth/16,jukeWidth+jukeWidth/10,jukeWidth/4,jukeWidth/20,5);
rect(jukeWidth*2-jukeWidth/16,jukeWidth+jukeWidth/20,jukeWidth/4,jukeWidth/20,5);
//
noStroke();
arc(jukeWidth*1.5, jukeWidth, jukeWidth/1.5, jukeWidth/1.5, PI, TWO_PI);
rect(jukeWidth+(jukeWidth/6),jukeWidth,jukeWidth*2/3,jukeWidth/6,3);
stroke(0,0,255);
arc(jukeWidth*1.5, jukeWidth, jukeWidth/1.7, jukeWidth/1.7, PI, TWO_PI);
stroke(255,0,0);
arc(jukeWidth*1.5, jukeWidth, jukeWidth/2, jukeWidth/2, PI, TWO_PI);
stroke(255);
arc(jukeWidth*1.5, jukeWidth, jukeWidth/2.5, jukeWidth/2.5, PI, TWO_PI);
stroke(255, 165, 0);
arc(jukeWidth*1.5, jukeWidth, jukeWidth/3.5, jukeWidth/3.5, PI, TWO_PI);
stroke(255,255,0);
arc(jukeWidth*1.5, jukeWidth, jukeWidth/5, jukeWidth/5, PI, TWO_PI);
stroke(221,160,221);
arc(jukeWidth*1.5, jukeWidth, jukeWidth/8, jukeWidth/8, PI, TWO_PI);
stroke(0,255,0);
arc(jukeWidth*1.5, jukeWidth, jukeWidth/15, jukeWidth/15, PI, TWO_PI);


stroke(0);
fill(255,0,0);
quad(jukeWidth*1.5, jukeWidth/1.8, jukeWidth*1.4, jukeWidth/3, jukeWidth*1.5, jukeWidth/2.65, jukeWidth*1.6, jukeWidth/3);


//
pushMatrix();
translate(jukeWidth+(jukeWidth/5),jukeWidth+(jukeWidth/3));
for (int i = 0; i < cols; i++) {     
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
popMatrix();
}

void music1()
{
    p1.setToLoopStart();
    p1.start();
    musicPlaying = 1;
}

void music2()
{
  p2.setToLoopStart();
  p2.start();
  musicPlaying = 2;
}

void music3()
{
  p3.setToLoopStart();
  p3.start();
  musicPlaying = 3;
}

void music4()
{
  p4.setToLoopStart();
  p4.start();
  musicPlaying = 4;
}

void music5()
{
  p5.setToLoopStart();
  p5.start();
  musicPlaying = 5;
}

void STOP()
{
  p1.pause(true);
  p2.pause(true);
  p3.pause(true);
  p4.pause(true);
  p5.pause(true);
}

void PLAY()
{
  if(musicPlaying == 1)
  {  
    p1.pause(false);
  }
  else if(musicPlaying == 2)
  {
    p2.pause(false);
  }
  else if(musicPlaying == 3)
  {
    p3.pause(false);
  }
  else if(musicPlaying == 4)
  {
    p4.pause(false);
  }
    else if(musicPlaying == 5)
  {
    p5.pause(false);
  }
     
}
