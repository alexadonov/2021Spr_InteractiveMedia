//Global Variables
int month, day, hour;
float temp,rain,wind,cloud;
boolean dateChanged;

//test values
int people = 7;

//constructors
Cafe cafe;
Furniture furniture;
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
  sky = new Sky(height,width);
  cafe = new Cafe(width, height);
  sun = new Sun(width,height);
  furniture = new Furniture(width, height);
  juke = new CafeJuke(width,height);
  ghosts = new Ghosts(width,height,people);
}

void draw() { 
  //updates for time
  if(dateChanged){
    sky.update(hour);
    cafe.update(0);
    juke.update(0);
    furniture.update(0);
    dateChanged=false;
  }
  
  //initial displays
  sky.display();
  ghosts.display();
  sun.display();
  cafe.display();
  juke.display();
  furniture.display();
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