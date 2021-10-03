class Clock {
  int mon, d, h;
  float min, xR, yR;  

  Clock(int month, int day, int hour, float _xR, float _yR) {
    min = minute();
    this.h = hour;
    this.d = day;
    this.mon = month;
    this.xR = _xR/40;
    this.yR = _yR/20;
  }

  void mousePressed() {
    if (h < 24) {
      h++;
    } else {
      h = 1;
    }

    hour = h;
    hourChanged = true;
    updateData();
  }

  void display() {
    translate(13*xR, 2*yR);    
    fill(255);  //white
    ellipse(0, 0, 2*xR, 2*xR);
    //Sets the color used to draw lines and borders around shapes. 
    stroke(0);  //Black
    fill(0);    //Black

    //The dial
    for (int i=1; i<=60; i++) {
      pushMatrix();
      rotate(PI*2.0*i/60.0);  //deg
      stroke(0);
      if (i%15==0) {
        strokeWeight(3);
        line(0, -40, 0, -50);
      } else if ( i%5 ==0) {
        strokeWeight(2);
        line(0, -42, 0, -50);
      } else {
        strokeWeight(1);
        line(0, -45, 0, -50);
      }
      popMatrix();
    }

    pushMatrix();
    rotate(PI*2*min/60+PI);
    stroke(0);
    strokeWeight(3);
    line(0, 0, 0, -34);     //min
    popMatrix();

    pushMatrix();
    rotate(PI*2*h/12+PI);
    stroke(0);
    strokeWeight(5);
    line(0, 0, 0, -28);     //hour
    popMatrix();
  }

  float getCircleDiameter() {
    return 2*xR;
  }
}
