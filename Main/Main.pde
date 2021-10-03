//Global Variables
int month, day, hour, colorType;
float airTemp, rainGauge, windSpeed, solarRadiation, jukeWidth, peopleCounter;
boolean dateChanged, hourChanged, userGuideShown;
Table table;
TableRow row;
ArrayList<Cloud> cloudsArr = new ArrayList();

//test values
int people = 7;

//constructors

Cloud cloud;
Cafe cafe;
CafeJuke juke;
Ghosts ghosts;
Guide guide;
Sun sun;
Sky sky;
Calender calender;
Clock clock;
Rain rain;

PImage guideimg;
String chosenDate;

void setup() {
  size(2000, 1000);

  //initialised values
  month=month();
  day=day();
  hour=hour();
  updateData();

  dateChanged=true;
  hourChanged = true;
  colorType = getColortype();
  table = loadTable("EIFData.csv");

  //constructors
  sky = new Sky(height, width);
  cafe = new Cafe(width, height);
  sun = new Sun(width, height);
  juke = new CafeJuke(width, height);
  ghosts = new Ghosts(width, height, people);
  calender = new Calender(width, height, month(), day());
  clock = new Clock(month, day, hour, cafe.getX(), cafe.getY());
  cloud = new Cloud(width, height, windSpeed);
  guide = new Guide(width-100, 30, 60);

  guideimg = loadImage("user_guide.PNG");
  guideimg.resize(width-75, height);
  userGuideShown = false;
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
  cloud.updateCloud();
  cafe.display();
  calender.display();
  juke.display();
  ghosts.display();
  clock.display();
  guide.display();

  if (userGuideShown) {
    image(guideimg, 0, 0);
  }
}

void keyPressed() {
  updateData();
  calender.keyPressed();
  month = calender.getMonth();
  day = calender.getDay();
}


void mousePressed() { 
  //Circle
  if (dist(mouseX, mouseY, 13*juke.getX(), 2*juke.getY()) < clock.getCircleDiameter()/2 ) {
    hour = clock.mousePressed();
    hourChanged = true;
    updateData();
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
  try {
    row=table.findRow(chosenDate, 0);
    solarRadiation = row.getFloat(9); //grab new solar radiation data
    windSpeed = row.getFloat(8);
    airTemp = row.getFloat(7);
    rainGauge = row.getFloat(10);
    peopleCounter = row.getFloat(11);

    cloudsArr.clear(); //reset list
    cloud.populateCloudArr(solarRadiation, windSpeed);
  } 
  catch(NullPointerException e) {
    solarRadiation = 0;
    windSpeed = 0;
    airTemp = 0;
    rainGauge = 0;
    peopleCounter = 1;
  }

  //Rain
  //Rain(float _w, float _h, float numDrops) {
  //500*raingauge
  //println("rain gauge " + rainGauge);
  //if (rainGauge > 0) {
  //  rain = new Rain(width, height, 500*rainGauge);
  //  rain.display();
  //}


  //people data
  //get people count at this datetime
  //people = result/10;

  //sun data
  //outerRadius= (input data*0.2
}
