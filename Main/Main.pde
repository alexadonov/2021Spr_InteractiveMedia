//Global Variables
int month, day, hour, colorType, buttonSize, musicPlaying;
float airTemp, rainGauge, windSpeed, solarRadiation, cloudNum, jukeWidth;
int peopleCounter;
Table table;
TableRow row;
boolean dateChanged, hourChanged, databoardShown, guideShown, jukeboxShown;
String chosenDate;
ArrayList<Cloud> cloudsArr = new ArrayList();

ControlP5 cp5;
AudioContext ac;

SamplePlayer p1;
Cell[][] grid; 
int cols = 12;
int rows = 11;

//constructors
Cafe cafe;
CafeJuke juke;
Ghosts ghosts;
Sun sun;
Sky sky;
Calender calender;
DataBoard databoard;
Guide guide;
Clock clock;
Cloud cloud;
Jukebox jukebox;
void setup() {
  size(2000, 1000);

  //initialised values
  month=month();
  day=day();
  hour=hour();
  dateChanged=true;
  hourChanged=true;
  databoardShown=false;
  table = loadTable("EIFData.csv");
  updateData();
  buttonSize = 20;
  musicPlaying = 0;
  jukeboxShown = false;
  ac = new AudioContext();
  cp5 = new ControlP5(this);

  //constructors
  sky = new Sky(height, width);
  cafe = new Cafe(width, height);
  sun = new Sun(width, height);
  juke = new CafeJuke(width, height);
  ghosts = new Ghosts(width, height, peopleCounter);
  calender = new Calender(width, height);
  databoard = new DataBoard(width, height);
  guide = new Guide(width-30, 30, 60);
  clock = new Clock(month(), day(), hour(), width, height);
  cloud = new Cloud(width, height);
  jukebox = new Jukebox(ac, cp5);

  //jukebox disco
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*10, j*10, 10, 10, i + j);
    }
  }


  try {
    String sample1 = sketchPath("") + "data/waltz-for-hulot.wav";
    p1 = new SamplePlayer(ac, new Sample(sample1));
    p1.setKillOnEnd(false);
    p1.setToEnd(); 

    Gain g1 = new Gain(ac, 1, 0.5);
    g1.addInput(p1);  
    ac.out.addInput(g1);
    ac.start();
    p1.setToLoopStart();
    //p1.start();
  } 
  catch(Exception e) {
    e.printStackTrace();
  }
}

void draw() { 
  //updates for time
  if (dateChanged || hourChanged) {
    println("date has been changed");
    //retrieve new colorType for sky, cafe, juke updates
    colorType = getColortype(hour, month);
    updateData();
    println("new color is" + colorType);

    //0 day, 1 night, 2 dusk, 3 dawn
    sky.update(colorType);
    sun.update(colorType);
    cafe.update(colorType);
    calender.update(colorType);
    juke.update(colorType);
    ghosts.update(peopleCounter);
    dateChanged=false;
    hourChanged=false;
  }

  //initial displays
  sky.display();
  sun.display();
  cloud.updateCloud();
  cafe.display();
  calender.display();
  juke.display();
  ghosts.display();
  if (databoardShown) {
    databoard.display();
  }
  guide.display();
  clock.display();

  if (jukeboxShown) {
    jukebox.display();
  }
}

void keyPressed() {
  calender.keyPressed(); 
  updateData();
}

void mousePressed() {
  float xR = juke.getX();
  float yR = juke.getY();

  if ((mouseX > xR*0) && (mouseX < 4*xR) && (mouseY >10*yR) && (mouseY <17*yR)) {
    if (!jukeboxShown) {
      jukeboxShown = true;
      ac.start();
    } else {
      jukeboxShown = false;
      ac.stop();
    }
  }

  databoard.mousePressed();
  guide.mousePressed();
  clock.mousePressed();
}

//updates the data
void updateData() {
  chosenDate=""; //reset 
  if (month < 10) {
    chosenDate += "0" +Integer.toString(month);
  } else {
    chosenDate += Integer.toString(month);
  }
  if (day < 10) {
    chosenDate += "0" + Integer.toString(day);
  } else {
    chosenDate +=  Integer.toString(day);
  }
  if (hour < 10) {
    chosenDate += "0" +Integer.toString(hour);
  } else {
    chosenDate += Integer.toString(hour);
  } 
  try {
    row=table.findRow(chosenDate, 0);
    solarRadiation = row.getFloat(9); //grab new solar radiation data
    windSpeed = row.getFloat(8);
    airTemp = row.getFloat(7);
    rainGauge = row.getFloat(10);
    peopleCounter = row.getInt(11);

    //cloud data
    cloudsArr.clear(); //reset list
    cloud.populateCloudArr(solarRadiation);
  } 
  catch(NullPointerException e) {
    solarRadiation = 0;
    windSpeed = 0;
    airTemp = 0;
    rainGauge = 0;
    peopleCounter = 1;
  }
}

//calculates the correct period of the day(day,night,dusk,dawn) based on hour and month
//then sets the colorType to reflect that period
int getColortype(int hour, int month) {
  int newColor = colorType; //default to current ColorType
  int monthPeriods = month;
  int periods[][] = {
    //0 Jan, Dec
    {5, 20}, 
    //1 Feb, Mar
    {6, 19}, 
    //2 Apr, May, Jun, Jul, Aug, Sep
    {6, 17}, 
    //3 Oct
    {6, 19}, 
    //4 Nov
    {5, 19}
  };

  if (month==1 || month==12) {
    monthPeriods=0;
  } else if (month==2 || month==3) {
    monthPeriods=1;
  } else if (month==10) {
    monthPeriods=3;
  } else if (month==11) {
    monthPeriods=4;
  }

  if (hour>periods[monthPeriods][0] && hour<periods[monthPeriods][1]) { //day
    newColor=0;
  } else if (hour<periods[monthPeriods][0] || hour>periods[monthPeriods][1]) { //night
    newColor=1;
  } else if (hour == periods[monthPeriods][1]) { //dusk
    newColor=2;
  } else if (hour == periods[monthPeriods][0]) { //dawn
    newColor=3;
  }
  return newColor;
}

//void playMusic() {
//  switch(musicPlaying) {
//  case 1: 
//    p1.pause(false); 
//    println("Music " + musicPlaying + " is now playing.");
//    break;
//  case 2: 
//    p2.pause(false); 
//    println("Music " + musicPlaying + " is now playing.");
//    break;
//  case 3: 
//    p3.pause(false); 
//    println("Music " + musicPlaying + " is now playing.");
//    break;
//  case 4: 
//    p4.pause(false); 
//    println("Music " + musicPlaying + " is now playing.");
//    break;
//  case 5: 
//    p5.pause(false); 
//    println("Music " + musicPlaying + " is now playing.");
//    break;
//  default: 
//    println("Error in playMusic()"); 
//    break;
//  }
