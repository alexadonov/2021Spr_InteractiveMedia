class Sun {
  float xR, yR;
  float outerRadius = 4;
  int colorType;

  int dayNight[][] = {
    //day
    {
      #FC9E50, 
      #FFDE93
    }, 
    //night
    {
      #FDFBC3, 
      #E7F7FF
    }
  };

  Sun(float _x, float _y) {
    xR=_x/40;
    yR=_y/20;
  }

  void update(int newColor) {
    if (newColor==1) {
      colorType=1;
    } else {
      colorType=0;
    }
  }

  void display() {
    fill(dayNight[colorType][0], 200);
    ellipse(37*xR, 3*yR, outerRadius*xR, outerRadius*yR);
    fill(dayNight[colorType][1]);
    ellipse(37*xR, 3*yR, 3*xR, 3*yR);
  }
}