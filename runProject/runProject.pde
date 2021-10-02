
//Global Variables
int month, day, hour, buttonSize, musicPlaying;
float temp, rain, wind, cloudNum, jukeWidth;
boolean dateChanged, jukeboxShown, userGuideShown;
AudioContext ac;
ControlP5 cp5;
Table table;
ArrayList<Cloud> cloudsArr = new ArrayList();

//test values
int people = 7;

//constructors
Cloud cloud;
Cafe cafe;
CafeJuke juke;
Ghosts ghosts;
Sun sun;
Sky sky;
Jukebox jukebox; 
Button music1, music2, music3, music4, music5, stopB, playB;
SamplePlayer p1, p2, p3, p4, p5, p6;
Guide guide;
PImage guideimg;
//jukebox display monitor
Cell[][] grid; 
int cols = 12;
int rows = 11;

void mousePressed() {
  float xR = juke.getX();
  float yR = juke.getY();

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

  if (dist(mouseX, mouseY, guide.xInput, guide.yInput)<guide.size/2) {

    if (!userGuideShown)userGuideShown = true;
    else {
      userGuideShown = false;
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
  table = loadTable("test.csv");
  String test = table.getString(1,0); //row,column
  println("oh no " + test);
  cloudNum = 0;
  for (int i=0; i<cloudNum; i++) {
    cloudsArr.add(new Cloud());
  } //fill up list with clouds

  jukeboxShown = false;
  guideimg = loadImage("user_guide.PNG");
  guideimg.resize(width-75, height);
  userGuideShown = false;
  dateChanged=true;
  ac = new AudioContext();
  cp5 = new ControlP5(this);

  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*10, j*10, 10, 10, i + j);
    }
  }

  //constructors
  sky = new Sky(width, height);
  cafe = new Cafe(width, height);
  sun = new Sun(width, height);
  juke = new CafeJuke(width, height);
  ghosts = new Ghosts(width, height, people);
  jukebox = new Jukebox(ac, cp5);
  guide = new Guide(width-100, 30, 60);

  music1 = cp5.addButton("music1")
    .setVisible(jukeboxShown)
    .setCaptionLabel("+")
    .setPosition(jukeWidth*1.05, jukeWidth*1.2)
    .setSize(buttonSize, buttonSize)
    .setColorBackground(#C9753D)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255));

  music2 = cp5.addButton("music2")
    .setVisible(jukeboxShown)
    .setCaptionLabel("+")
    .setPosition(jukeWidth*1.25, jukeWidth*1.2)
    .setSize(buttonSize, buttonSize)
    .setColorBackground(#726A95)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255));

  music3 = cp5.addButton("music3")
    .setVisible(jukeboxShown)
    .setCaptionLabel("+")
    .setPosition(jukeWidth*1.45, jukeWidth*1.2)
    .setSize(buttonSize, buttonSize)
    .setColorBackground(#9D7726)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255));

  music4 = cp5.addButton("music4")
    .setVisible(jukeboxShown)
    .setCaptionLabel("+")
    .setPosition(jukeWidth*1.65, jukeWidth*1.2)
    .setSize(buttonSize, buttonSize)
    .setColorBackground(#34626C)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255));

  music5 = cp5.addButton("music5")
    .setVisible(jukeboxShown)
    .setCaptionLabel("+")
    .setPosition(jukeWidth*1.85, jukeWidth*1.2)
    .setSize(buttonSize, buttonSize)
    .setColorBackground(#70AF85)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255));

  stopB = cp5.addButton("stopMusic")
    .setVisible(jukeboxShown)
    .setCaptionLabel("STOP")
    .setPosition(jukeWidth*5/4, jukeWidth*1.02)
    .setSize(buttonSize*5/4, buttonSize*5/4)
    .setColorBackground(#6389df)
    .setColorForeground(color(0, 255, 0))
    .setColorActive(color(0, 0, 255));

  playB = cp5.addButton("playMusic")
    .setValue(0)
    .setVisible(jukeboxShown)
    .setCaptionLabel("PLAY")
    .setPosition(jukeWidth*13/8, jukeWidth*1.02)
    .setSize(buttonSize*5/4, buttonSize*5/4)
    .setColorBackground(#133A1B)
    .setColorForeground(color(255, 0, 0))
    .setColorActive(color(0, 0, 255));

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

  println("Month is " + month + "\nDay is " + day + "\nHour is " + hour);
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
  guide.display();

  if (userGuideShown) {
    image(guideimg, 0, 0);
  }

  if (jukeboxShown) {
    jukebox.display();
    pushMatrix();
    translate(jukeWidth+(jukeWidth/5), jukeWidth+(jukeWidth/3));
    for (int i = 0; i < cols; i++) {     
      for (int j = 0; j < rows; j++) {
        // Oscillate and display each object
        grid[i][j].oscillate();
        grid[i][j].display();
      }
    }
    popMatrix();
  }
}

void updateData() {
  //cloud data
  
  
  //rain data

  //people data
  //get people count at this datetime
  //people = result/10;

  //sun data
  //outerRadius= (input data/total data)*2 + 3
}


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

void stopMusic() {
  playB.setCaptionLabel("RESUME");
  println("Music paused.");
  p1.pause(true);
  p2.pause(true);
  p3.pause(true);
  p4.pause(true);
  p5.pause(true);
}

void playMusic() {
  switch(musicPlaying) {
  case 1: 
    p1.pause(false); 
    println("Music " + musicPlaying + " is now playing.");
    break;
  case 2: 
    p2.pause(false); 
    println("Music " + musicPlaying + " is now playing.");
    break;
  case 3: 
    p3.pause(false); 
    println("Music " + musicPlaying + " is now playing.");
    break;
  case 4: 
    p4.pause(false); 
    println("Music " + musicPlaying + " is now playing.");
    break;
  case 5: 
    p5.pause(false); 
    println("Music " + musicPlaying + " is now playing.");
    break;
  default: 
    println("Error in playMusic()"); 
    break;
  }
}

int dayCheck() {
  int[] a1 = {4, 6, 9, 11}; //30s
  //int[] a2 = {1, 3, 5, 7, 8, 10, 12}; //31s
  int maxDays=999;

  if (month != 2) { //checks if it's feb
    for (int i = 0; i<a1.length; i++) {
      if (month == a1[i]) {
        maxDays = 30;
        break;
      } else {
        maxDays = 31;
      }
    }
  } else {
    maxDays = 29;
  }
  return maxDays;
}

void keyPressed() { // Do not store dayCheck() into a variable; it breaks.
  if (key == CODED) {
    switch(keyCode) {
    case UP:
      month = (month <12) ? ++month : 1;
      break;
    case DOWN:
      month = (month >1) ? --month : 12;
      break;
    case LEFT:
      if (dayCheck() == 30) {
        day = (day >1) ? --day : 30;
      } 

      if (dayCheck() == 31) {
        day = (day >1) ? --day : 31;
      } 

      if (dayCheck() == 29) {
        day = (day >1) ? --day : 29;
      }
      break;
    case RIGHT:
      if (dayCheck() == 30) {
        day = (day <30) ? ++day : 1;
      } 

      if (dayCheck() == 31) {
        day = (day <31) ? ++day : 1;
      }

      if (dayCheck() == 29) {
        day = (day < 29) ? ++day : 1;
      }
      break;
    default: 
      break;
    }
  }
}
