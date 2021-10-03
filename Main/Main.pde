//Global Variables
int month, day, hour, colorType;
<<<<<<< Updated upstream
float temp, rain, wind, cloud;
boolean dateChanged, hourChanged;
=======
float airTemp, rainGauge, windSpeed, solarRadiation, cloudNum, jukeWidth, peopleCounter;
boolean dateChanged, hourChanged, userGuideShown;
Table table;
TableRow row;
ArrayList<Cloud> cloudsArr = new ArrayList();
>>>>>>> Stashed changes

//test values
int people = 7;

//constructors
<<<<<<< Updated upstream
Cafe cafe;
CafeJuke juke;
Ghosts ghosts;
=======
Cloud cloud;
Cafe cafe;
CafeJuke juke;
Ghosts ghosts;
Guide guide;
>>>>>>> Stashed changes
Sun sun;
Sky sky;
Calender calender;
Clock clock;
<<<<<<< Updated upstream
=======
PImage guideimg;
String chosenDate;
>>>>>>> Stashed changes

void setup() {
  size(2000, 1000);

  //initialised values
  month=month();
  day=day();
  hour=hour();
  dateChanged=true;
  hourChanged = true;
  colorType = getColortype();
<<<<<<< Updated upstream
=======
  table = loadTable("EIFData.csv");
>>>>>>> Stashed changes

  //constructors
  sky = new Sky(height, width);
  cafe = new Cafe(width, height);
  sun = new Sun(width, height);
  juke = new CafeJuke(width, height);
  ghosts = new Ghosts(width, height, people);
  calender = new Calender(width, height, month(), day());
  clock = new Clock(month, day, hour, cafe.getX(), cafe.getY());
<<<<<<< Updated upstream
=======
  guide = new Guide(width-100, 30, 60);

  guideimg = loadImage("user_guide.PNG");
  guideimg.resize(width-75, height);
  userGuideShown = false;
>>>>>>> Stashed changes
}

void draw() { 
  //updates for time
  if (dateChanged || hourChanged) {
    colorType = getColortype();     //retrieve new colorType for sky, cafe, juke updates
    //0 day, 1 night, 2 dusk, 3 dawn
    sky.update(colorType);
    sun.update(colorType);
    cafe.update(colorType);
    juke.update(colorType);
    dateChanged=false;
    hourChanged=false;
  }

  //initial displays
  sky.display();
  sun.display();
  cafe.display();
  calender.display();
  juke.display();
  ghosts.display();
<<<<<<< Updated upstream
  clock.display();
=======
  guide.display();

  clock.display();

  if (userGuideShown) {
    image(guideimg, 0, 0);
  }
>>>>>>> Stashed changes
}

void keyPressed() {
  calender.keyPressed();
<<<<<<< Updated upstream
=======
  updateData();
>>>>>>> Stashed changes
}

//calculates the correct period of the day(day,night,dusk,dawn) based on hour and month
//then sets the colorType to reflect that period
int getColortype() {
  int newColor = colorType; //default to current ColorType
  int monthPeriods = 2;
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
  println("get colour type hour is " +hour);

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

void mousePressed() { 
<<<<<<< Updated upstream
  if (dist(mouseX,mouseY,13*juke.getX(),2*juke.getY()) < clock.getCircleDiameter()/2 ) {
    println("reached clock!");
    hour = clock.mousePressed();
    hourChanged = true;
  }
  // if(dist(mouseX, mouseY, 0, 0) < (clock.getCircleDiameter()/2)){
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
=======

  //Clock
  if (dist(mouseX, mouseY, 13*juke.getX(), 2*juke.getY()) < clock.getCircleDiameter()/2 ) {
    hour = clock.mousePressed();
    hourChanged = true;
  }

  //Guide
  if (dist(mouseX, mouseY, guide.xInput, guide.yInput)<guide.size/2) {
    if (!userGuideShown)
      userGuideShown = true;
    else {
      userGuideShown = false;
    }
  }
}

void updateData() {
  //cloud data
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
  row=table.findRow(chosenDate, 0);
  solarRadiation = row.getFloat(9); //grab new solar radiation data
  windSpeed = row.getFloat(8);
  airTemp = row.getFloat(7);
  rainGauge = row.getFloat(10);
  peopleCounter = row.getFloat(11);

  cloudsArr.clear(); //reset list
  if (solarRadiation > 1 && solarRadiation < 100) {
    for (int i=0; i<2; i++) {
      cloudsArr.add(new Cloud(width, height, windSpeed));
    }
  } else if (solarRadiation > 100 && solarRadiation < 250) {
    for (int i=0; i<4; i++) {
      cloudsArr.add(new Cloud(width, height, windSpeed));
    }
  } else if (solarRadiation > 250) {
    for (int i=0; i<6; i++) {
      cloudsArr.add(new Cloud(width, height, windSpeed));
    }
  }

  updateCloud();
  //rain data

  //people data
  //get people count at this datetime
  //people = result/10;

  //sun data
  //outerRadius= (input data/total data)*2 + 3
}

void updateCloud() {
  for (int i =0; i < cloudsArr.size(); i++) {
    Cloud c = cloudsArr.get(i);
    c.display();
    c.moveCloud(c);
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
>>>>>>> Stashed changes
