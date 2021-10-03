//Global Variables
int month, day, hour, colorType;
float airTemp, rainGauge, windSpeed, solarRadiation, cloudNum, jukeWidth;
int peopleCounter;
Table table;
TableRow row;
boolean dateChanged, hourChanged, databoardShown, guideShown;
String chosenDate;

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
  cafe.display();
  calender.display();
  juke.display();
  ghosts.display();
  if (databoardShown) {
    databoard.display();
  }
  guide.display();
  clock.display();
}

void keyPressed() {
  calender.keyPressed(); 
  updateData();
}

void mousePressed() {
  databoard.mousePressed();
  guide.mousePressed();
  clock.mousePressed();
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
  peopleCounter = row.getInt(11);
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