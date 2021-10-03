//Global Variables
int month, day, hour, buttonSize, musicPlaying;
float airTemp, rainGauge, windSpeed, solarRadiation, cloudNum, jukeWidth,peopleCounter;
boolean dateChanged, jukeboxShown, userGuideShown;
AudioContext ac;
ControlP5 cp5;
Table table;
TableRow row;

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
String chosenDate;

void mousePressed() {
  jukebox.mousePressed();
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
  chosenDate = "";
  table = loadTable("EIFData.csv");

  jukeboxShown = false;
  ac = new AudioContext();
  cp5 = new ControlP5(this);

  //jukebox disco
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
  jukebox = new Jukebox(width, height, ac, cp5);

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
  sun.display();
  cafe.display();
  juke.display();

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