//Global Variables
int month, day, hour, colorType;
float temp, rain, wind, cloud;
boolean dateChanged, hourChanged;

//test values
int people = 7;

//constructors
Cafe cafe;
CafeJuke juke;
Ghosts ghosts;
Sun sun;
Sky sky;
Calender calender;
Clock clock;

void setup() {
  size(2000, 1000);

  //initialised values
  month=month();
  day=day();
  hour=hour();
  dateChanged=true;
  hourChanged = true;
  colorType = getColortype();

  //constructors
  sky = new Sky(height, width);
  cafe = new Cafe(width, height);
  sun = new Sun(width, height);
  juke = new CafeJuke(width, height);
  ghosts = new Ghosts(width, height, people);
  calender = new Calender(width, height, month(), day());
  clock = new Clock(month, day, hour, cafe.getX(), cafe.getY());
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
  clock.display();
}

void keyPressed() {
  calender.keyPressed();
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
