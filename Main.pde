//Global Variables
int month, day, hour, colorType;
float temp,rain,wind,cloud;
boolean dateChanged;

//test values
int people = 7;

//constructors
Cafe cafe;
CafeJuke juke;
Ghosts ghosts;
Sun sun;
Sky sky;
Calender calender;

void setup() {
  size(2000,1000);
  
  //initialised values
  month=month();
  day=day();
  hour=hour();
  dateChanged=true;
  
  //constructors
  sky = new Sky(height,width);
  cafe = new Cafe(width, height);
  sun = new Sun(width,height);
  juke = new CafeJuke(width,height);
  ghosts = new Ghosts(width,height,people);
  calender = new Calender(width,height, month(), day());
}

void draw() { 
  //updates for time
  if(dateChanged){
    println("date has been changed");
    //retrieve new colorType for sky, cafe, juke updates
    colorType = getColortype(hour, month);
    println("new color is" + colorType);
    
    //0 day, 1 night, 2 dusk, 3 dawn
    sky.update(colorType);
    sun.update(colorType);
    cafe.update(colorType);
    calender.update(colorType);
    juke.update(colorType);
    ghosts.update(people);
    dateChanged=false;
  }
  
  //initial displays
  sky.display();
  sun.display();
  cafe.display();
  calender.display();
  juke.display();
  ghosts.display();
}

void keyPressed() {
 calender.keyPressed(); 
}

//calculates the correct period of the day(day,night,dusk,dawn) based on hour and month
//then sets the colorType to reflect that period
int getColortype(int hour, int month){
  int newColor = colorType; //default to current ColorType
  int monthPeriods = month;
  int periods[][] = {
    //0 Jan, Dec
    {5,20},
    //1 Feb, Mar
    {6,19},
    //2 Apr, May, Jun, Jul, Aug, Sep
    {6,17},
    //3 Oct
    {6,19},
    //4 Nov
    {5,19}
  };
  
  if(month==1 || month==12){
    monthPeriods=0;
  } else if (month==2 || month==3){
   monthPeriods=1; 
  } else if(month==10){
    monthPeriods=3;
  } else if(month==11){
    monthPeriods=4;
  }
  
  if(hour>periods[monthPeriods][0] && hour<periods[monthPeriods][1]){ //day
    newColor=0;
  } else if(hour<periods[monthPeriods][0] || hour>periods[monthPeriods][1]){ //night
    newColor=1;
  } else if (hour == periods[monthPeriods][1]){ //dusk
    newColor=2;
  } else if (hour == periods[monthPeriods][0]){ //dawn
    newColor=3;
  }
  return 1;
}