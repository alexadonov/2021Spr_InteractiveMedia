//Global Variables
int month, day, hour;
float temp, rain, wind, cloud;
boolean dateChanged;

//test values
int people = 7;

//constructors
Cafe cafe;
Furniture furniture;
CafeJuke juke;
//Ghosts ghosts;
Sun sun;
Sky sky;

void setup() {
  size(2000, 1000);

  //initialised values
  month=month();
  day=day();
  hour=hour();
  dateChanged=true;

  //constructors
  sky = new Sky(width, height);
  cafe = new Cafe(width, height);
  sun = new Sun(width, height);
  furniture = new Furniture(width, height);
  juke = new CafeJuke(width, height);
  //ghosts = new Ghosts(width,height,people);
}

void draw() {
  //updates for time
  //Should this be changed for timeChanged? And have another boolean for dayChanged
  //to use for updating calendar display
  if (dateChanged) {
    println("date has been changed");
    //0 day, 1 night, 2 dusk, 3 dawn
    sky.update(2);
    cafe.update(2);
    juke.update(2);
    furniture.update(2);
    dateChanged=false;
  }

  //initial displays
  sky.display();
  //ghosts.display();
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

void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case UP:
      month = (month <12) ? ++month : 1;
      break;
    case DOWN:
      month = (month >1) ? --month : 12;
      break;
    case LEFT:
      if (dayCheck() == 30) {
        day = (day >1) ? --day : 30;
      } 
      
      if (dayCheck() == 31) {
        day = (day >1) ? --day : 31;
      } 
      
      if (dayCheck() == 29) {
        day = (day >1) ? --day : 29;
      }
      break;
    case RIGHT:
      if (dayCheck() == 30) {
        day = (day <30) ? ++day : 1;
      } 
      
      if (dayCheck() == 31) {
        day = (day <31) ? ++day : 1;
      }

      if (dayCheck() == 29) {
        day = (day < 29) ? ++day : 1;
      }
      break;
    default:break;
    }
  }
  //println("Month: " + month + " Day: " + day);
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
