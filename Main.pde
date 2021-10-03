//Global Variables
int month, day, hour, colorType;
float temp,rain,wind,cloud;
boolean dateChanged;

//test values
int people = 7;

//constructors
Cafe cafe;
Jukebox juke;
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
  juke = new Jukebox(width,height);
  ghosts = new Ghosts(width,height,people);
  calender = new Calender(width,height, month(), day());
}

void draw() { 
  //updates for time
  if(dateChanged){
    println("date has been changed");
    colorType = getColortype(hour, month);
    println("new color is" + colorType);
    //0 day, 1 night, 2 dusk, 3 dawn
    sky.update(2);
    cafe.update(2);
    juke.update(2);
    dateChanged=false;
  }
  
  //initial displays
  sky.display();
  ghosts.display();
  sun.display();
  cafe.display();
  calender.display();
  juke.display();
  
  calender.keyPressed();
}

int getColortype(int hour, int month){
  int newColor = colorType; //default to current ColorType
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
  
  if(hour>periods[month-1][0] && hour<periods[month-1][1]){ //day
    newColor=0;
  } else if(hour<periods[month-1][0] || hour>periods[month-1][1]){ //night
    newColor=1;
  } else if (hour == periods[month-1][1]){ //dusk
    newColor=2;
  } else if (hour == periods[month-1][0]){ //dawn
    newColor=3;
  }
  return newColor;
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
