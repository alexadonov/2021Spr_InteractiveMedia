class DataBoard {
  float xR, yR;
  
  DataBoard(int _x, int _y) {
    xR = _x/40;
    yR = _y/20;
  }
  
  //10*xR, 1*yR, 10*xR, 6*yR, 1*xR, 8*yR, 1*xR, 2*yR
  void mousePressed(){
    if((mouseX>1*xR) && (mouseX<10*xR) && (mouseY>1*yR) && (mouseY<8*yR)){
     databoardShown = !databoardShown;
    }
  }
  
  void display() {
    //backboard
    rect(6*xR, 3*yR, 28*xR, 14*yR);
    
    fill(#EBF5FE);
    //inner board
    rect(7*xR, 6*yR, 26*xR, 10*yR);
    
    //value rectangles
    rect(10*xR, 6*yR, 10*xR, 2*yR);
    rect(22*xR, 6*yR, 10*xR, 2*yR);
    rect(10*xR, 9*yR, 10*xR, 2*yR);
    rect(22*xR, 9*yR, 10*xR, 2*yR);
    
    //text
    textSize(1.5*xR);
    text("Data Board",16*xR, 5*yR);
    fill(0);
    textSize(40);
    text("Air Temp (C):", 10*xR, 11*yR);
    text(airTemp, 10*xR, 12*yR);
    text("Rain Gauge (mm):", 22*xR, 11*yR);
    text(rainGauge, 22*xR, 12*yR);
    text("Solar Radiation (W/m^2):", 10*xR, 7*yR);
    text(solarRadiation, 10*xR, 8*yR);
    text("Wind Speed (km/h):", 22*xR, 7*yR);
    text(windSpeed, 22*xR, 8*yR);
    text("Population:", 16*xR, 14*yR);
    text(peopleCounter, 16*xR, 15*yR);
  }
}