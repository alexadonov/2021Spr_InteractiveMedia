//Global Variables
int month, day, hour, buttonSize, musicPlaying;
float temp, rain, wind, cloud, jukeWidth;
boolean dateChanged, jukeboxShown;
AudioContext ac;
ControlP5 cp5;

//test values
int people = 7;

//constructors
Cafe cafe;
CafeJuke juke;
Ghosts ghosts;
Sun sun;
Sky sky;
Jukebox jukebox; 
Button music1, music2, music3, music4, music5, stopB, playB;

SamplePlayer p1, p2, p3, p4, p5, p6;


void mousePressed() {
  float xR = juke.getX();
  float yR = juke.getY();
  //quad(0*xR, 10.3*yR, 4*xR, 10*yR, 4*xR, 15.5*yR, 0*xR, 17*yR);
  //&& (mouseY > 10.3*yR) && (mouseY < 10*yR) && (mouseY < 15.5*yR) && (mouseY>17*yR)
  if ((mouseX > xR*0) && (mouseX < 4*xR) && (mouseY >10*yR) && (mouseY <17*yR)) {
    if (!jukeboxShown) {
      jukeboxShown = true;
      music1.setVisible(jukeboxShown);
      music2.setVisible(jukeboxShown);
      music3.setVisible(jukeboxShown);
      music4.setVisible(jukeboxShown);
      music5.setVisible(jukeboxShown);
      stopB.setVisible(jukeboxShown);
      playB.setVisible(jukeboxShown);
    } else {
      jukeboxShown = false;
       music1.setVisible(jukeboxShown);
      music2.setVisible(jukeboxShown);
      music3.setVisible(jukeboxShown);
      music4.setVisible(jukeboxShown);
      music5.setVisible(jukeboxShown);
      stopB.setVisible(jukeboxShown);
      playB.setVisible(jukeboxShown);
    }
  }
}

void setup() {
  size(2000, 1000);
  String sample1 = sketchPath("") + "data/waltz-for-hulot.wav";
  String sample2 = sketchPath("") + "data/kind-as-ever.wav";
  String sample3 = sketchPath("") + "data/a-border.wav";
  String sample4 = sketchPath("") + "data/tricolor.wav";
  String sample5 = sketchPath("") + "data/kirari-futari.wav";
  //initialised values
  month=month();
  day=day();
  hour=hour();
  jukeWidth = 200;
  buttonSize = 20;
  musicPlaying = 0;

  jukeboxShown = false;
  dateChanged=true;
  ac = new AudioContext();
  cp5 = new ControlP5(this);

  //constructors
  sky = new Sky(width, height);
  cafe = new Cafe(width, height);
  sun = new Sun(width, height);
  juke = new CafeJuke(width, height);
  ghosts = new Ghosts(width, height, people);
  jukebox = new Jukebox(ac, cp5);

  music1 = cp5.addButton("music1").setValue(0)
    .setVisible(jukeboxShown)
    .setCaptionLabel("+")
    .setPosition(jukeWidth*1.05, jukeWidth*1.2)
    .setSize(buttonSize, buttonSize)
    .setColorBackground(#C9753D)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255));

  music2 = cp5.addButton("music2")
    .setValue(0)
    .setVisible(jukeboxShown)
    .setCaptionLabel("+")
    .setPosition(jukeWidth*1.25, jukeWidth*1.2)
    .setSize(buttonSize, buttonSize)
    .setColorBackground(#726A95)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255))
    ;

  music3 = cp5.addButton("music3")
    .setValue(0)
    .setVisible(jukeboxShown)
    .setCaptionLabel("+")
    .setPosition(jukeWidth*1.45, jukeWidth*1.2)
    .setSize(buttonSize, buttonSize)
    .setColorBackground(#9D7726)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255))
    ;

  music4 = cp5.addButton("music4")
    .setValue(0)
    .setVisible(jukeboxShown)
    .setCaptionLabel("+")
    .setPosition(jukeWidth*1.65, jukeWidth*1.2)
    .setSize(buttonSize, buttonSize)
    .setColorBackground(#34626C)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255))
    ;

  music5 = cp5.addButton("music5")
    .setValue(0)
    .setVisible(jukeboxShown)
    .setCaptionLabel("+")
    .setPosition(jukeWidth*1.85, jukeWidth*1.2)
    .setSize(buttonSize, buttonSize)
    .setColorBackground(#70AF85)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255))
    ;


  stopB = cp5.addButton("STOP")
    .setValue(0)
    .setVisible(jukeboxShown)
    .setCaptionLabel("STOP")
    .setPosition(jukeWidth*5/4, jukeWidth*1.02)
    .setSize(buttonSize*5/4, buttonSize*5/4)
    .setColorBackground(#6389df)
    .setColorForeground(color(0, 255, 0))
    .setColorActive(color(0, 0, 255))
    ;

  playB = cp5.addButton("PLAY")
    .setValue(0)
    .setVisible(jukeboxShown)
    .setCaptionLabel("PLAY")
    .setPosition(jukeWidth*13/8, jukeWidth*1.02)
    .setSize(buttonSize*5/4, buttonSize*5/4)
    .setColorBackground(#133A1B)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255))
    ;

  try {
    p1 = new SamplePlayer(ac, new Sample(sample1));
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
  catch(Exception e) {
    e.printStackTrace();
  }
}

void draw() { 
  //updates for time
  if (dateChanged) {
    println("date has been changed");
    //0 day, 1 night, 2 dusk, 3 dawn
    sky.update(1);
    cafe.update(1);
    juke.update(1);
    dateChanged=false;
  }

  //initial displays
  sky.display();
  ghosts.display();
  sun.display();
  cafe.display();
  juke.display();

  if (jukeboxShown) {
    jukebox.display();
  }
}

//void updateData(int day, int month, int hour){
// //cloud data

// //rain data

// //people data
// //get people count at this datetime
// //people = result/10;

// //sun data
// //outerRadius= (input data/total data)*2 + 3
//}


void music1() {
  p1.setToLoopStart();
  p1.start();
  musicPlaying = 1;
  p2.setToEnd();
  p3.setToEnd();
  p4.setToEnd();
  p5.setToEnd();
}

void music2() {
  p2.setToLoopStart();
  p2.start();
  musicPlaying = 2;
  p1.setToEnd();
  p3.setToEnd();
  p4.setToEnd();
  p5.setToEnd();
}

void music3() {
  p3.setToLoopStart();
  p3.start();
  musicPlaying = 3;
  p2.setToEnd();
  p1.setToEnd();
  p4.setToEnd();
  p5.setToEnd();
}

void music4() {
  p4.setToLoopStart();
  p4.start();
  musicPlaying = 4;
  p2.setToEnd();
  p3.setToEnd();
  p1.setToEnd();
  p5.setToEnd();
}

void music5() {
  p5.setToLoopStart();
  p5.start();
  musicPlaying = 5;
  p2.setToEnd();
  p3.setToEnd();
  p4.setToEnd();
  p1.setToEnd();
}

void STOP()
{
  println("reached stop");
  p1.pause(true);
  p2.pause(true);
  p3.pause(true);
  p4.pause(true);
  p5.pause(true);
}

void PLAY() {
  println("reached play");
  if (musicPlaying == 1)
  {  
    p1.pause(false);
  } else if (musicPlaying == 2)
  {
    p2.pause(false);
  } else if (musicPlaying == 3)
  {
    p3.pause(false);
  } else if (musicPlaying == 4)
  {
    p4.pause(false);
  } else if (musicPlaying == 5)
  {
    p5.pause(false);
  }
}
