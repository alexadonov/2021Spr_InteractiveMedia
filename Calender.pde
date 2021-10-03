class Calender {
  float xR, yR;
  int month, day, colorType;
  
  //days in the months
  int monthDays[] = {
    31,29,31,30,31,30,31,31,39,31,39,31
  };
  
  //names of the months
  String monthText[] = {
    "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
  };
  
  //colors
  int colors[][] = {
    //day
    {
      //base
      #E1BFA6,
      //month bracket
      #E08963,
      //day bracket
      #EADBC3
    },
    //night
    {
      //base
      #BBC4C9,
      //month bracket
      #858D5A,
      //day bracket
      #F4F5F0
    },
    //dusk
    {
      //base
      #806063,
      //month bracket
      #BC85A3,
      //day bracket
      #ECDBBD
    },
    //dawn
    {
      //base
      #E1BFA6,
      //month bracket
      #F1CDB0,
      //day bracket
      #EADBC3
    }
  };
  
  Calender(float _x, float _y, int _month, int _day) {
    xR = _x/40;
    yR = _y/20;
    month = _month;
    day = _day;
  }

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
        if (dayCheck(month) == 30) {
          day = (day >1) ? --day : 30;
        } 

        if (dayCheck(month) == 31) {
          day = (day >1) ? --day : 31;
        } 

        if (dayCheck(month) == 29) {
          day = (day >1) ? --day : 29;
        }
        break;
      case RIGHT:
        if (dayCheck(month) == 30) {
          day = (day <30) ? ++day : 1;
        } 

        if (dayCheck(month) == 31) {
          day = (day <31) ? ++day : 1;
        }

        if (dayCheck(month) == 29) {
          day = (day < 29) ? ++day : 1;
        }
        break;
      default:
        break;
      }
    }
    //println("Month: " + month + " Day: " + day);
  }


  int dayCheck(int month) {
    int maxDays;
    
    maxDays = monthDays[month-1];
    
    return maxDays;
  }
  
  void update(int newColor) {
   colorType = newColor; 
  }

  void display() {
    String dayText;
    
    noStroke();
    fill(colors[colorType][0]);
    rect(12*xR, 4*yR, 2*xR, 2*yR);
    fill(colors[colorType][1]);
    rect(12*xR, 4*yR, 2*xR, 0.5*yR);
    fill(colors[colorType][2]);
    rect(12.25*xR, 4.75*yR, 1.5*xR, 1*yR);
    fill(0);
    textSize(20);
    text(monthText[month-1],12.55*xR,4.4*yR);
    textSize(40);
    if(day < 10){
      dayText = "0"+day;
      text(dayText, 12.5*xR, 5.5*yR);
    } else {
    text(day, 12.5*xR, 5.5*yR);
    }
  }
}