class CafeJuke {
  float xR, yR;
  int colorType;

  int colors[][] = {
    //day
    {
      //base
      #F29BB1, 
      //arch detail
      #F2DEA0, 
      //inner arch
      #E2F2B1, 
      //depth
      #6A9188
    }, 
    //night
    {
      //base
      #153964, 
      //arch detail
      #30104B, 
      //inner arch
      #104B30, 
      //depth
      #102B4B
    }, 
    //dusk
    {
      //base
      #9C60A6, 
      //arch detail
      #8285F9, 
      //inner arch
      #FED7F6, 
      //depth
      #7B62A6
    }, 
    //dawn
    {
      //base
      #F7B7DA, 
      //arch detail
      #F7C8A2, 
      //inner arch
      #E9F7D7, 
      //depth
      #F7A2D1
    }
  };

  CafeJuke(float _x, float _y) {
    yR = _y/20;
    xR = _x/40;
  }

  void update(int newColor) {
    colorType = newColor;
  }

  void display() {
    //depth
    fill(colors[colorType][3]);
    ellipse(1*xR, 12*yR, 4*xR, 7*yR);

    //arch
    fill(colors[colorType][1]);
    ellipse(2*xR, 12*yR, 4*xR, 6.5*yR);
    //arch detail
    fill(colors[colorType][0]);
    ellipse(2*xR, 12*yR, 3.5*xR, 6*yR);
    fill(colors[colorType][2]);
    ellipse(2*xR, 12*yR, 2*xR, 4*yR);

    //base
    fill(colors[colorType][0]);
    quad(0*xR, 12*yR, 4*xR, 11*yR, 4*xR, 15.5*yR, 0*xR, 17*yR);
    //base details
    fill(colors[colorType][1]);
    quad(0*xR, 12*yR, 0.25*xR, 11.95*yR, 0.25*xR, 16.9*yR, 0*xR, 17*yR);
    quad(4*xR, 11*yR, 4*xR, 15.5*yR, 3.75*xR, 15.6*yR, 3.75*xR, 11.1*yR);
    fill(colors[colorType][2]);
    quad(1*xR, 13*yR, 3*xR, 12.5*yR, 3*xR, 14.5*yR, 1*xR, 15.2*yR);
    quad(0*xR, 11.8*yR, 0.35*xR, 11.7*yR, 0.35*xR, 12.6*yR, 0*xR, 12.7*yR);
    quad(3.65*xR, 11.8*yR, 4*xR, 11.7*yR, 4*xR, 10.8*yR, 3.65*xR, 10.9*yR);
  }

  float getX() {
    return this.xR;
  }

  float getY() {
    return this.yR;
  }
}
