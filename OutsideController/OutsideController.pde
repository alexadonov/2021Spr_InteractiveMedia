class OutsideController {
  /**
   
   @param int hout - references third column of csv
   @param int month - references to first column of csv
   @param Table t - passed in table
   **/
  void updateSky(int hour, int month, Table t) { //pass in clock hour here

    switch(month) {
    case 1:
      if (hour>6 && hour < 8) {
      }
      break;
    case 2:
      break;
    case 3:
      break;
    case 4:
      break;
    case 5:
      break;
    case 6:
      break;
    case 7:
      break;
    case 8:
      break;
    case 9:
      break;
    case 10:
      break;
    case 11:
      break;
    case 12:
      break;
    default:
      break;
    }
  }


  /**
   
   @param int month - references first column of csv
   @param int day - references second column of csv
   @param Table t - passed in table
   
   merge month, day, hour columns into one column
   use 01 as 1
   convert int to string
   **/
  void updateWeather(int month, int day, int hour, Table t) {
    t.getFloat(month, 0); //need to test. this should get row month, row
  }
}
