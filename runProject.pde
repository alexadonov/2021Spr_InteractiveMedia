//Global Variables
int month, day, hour;
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

void setup() {
  size(2000,1000);
  
  //initialised values
  month=month();
  day=day();
  hour=hour();
  dateChanged=true;
  
  //constructors
  sky = new Sky(width,height);
  cafe = new Cafe(width, height);
  sun = new Sun(width,height);
  juke = new CafeJuke(width,height);
  ghosts = new Ghosts(width,height,people);
}

void draw() { 
  //updates for time
  if(dateChanged){
    println("date has been changed");
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
  juke.display();
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
