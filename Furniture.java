class Furniture {
    float xR, yR;
    int colorType=0;
    
    //colors
    int colors[][] = {
      //day
      {
        //chair
        #5E96AE,
        //table
        #FFBFA3
      },
      //night
      {
        //chair
        #002D33,
        //table
        #98A27D
      },
      //dusk
      {
        //chair
        #BC85A3,
        //table
        #FEADB9
      },
      //dawn
      {
        //chair
        #89AEB2,
        //table
        #E7CFC8
      }
    };
    
    Furniture(float _x, float _y) {
      yR = _y/20;
      xR = _x/40;
    }
    
    void updateColor(int newColor) {
      colorType = newColor;
    }
    
    void display() {
      noStroke();
      //furthest chair
      fill(colors[colorType][0]);
      rect(38*xR, 11*yR, 2*xR, 1*yR);
      ellipse(40*xR, 11*yR, 4*xR, 1*yR);
      
      //furthest table
      fill(colors[colorType][1]);
      quad(36*xR, 12*yR, 40*xR, 12*yR, 40*xR, 14*yR, 33*xR, 14*yR);
      
      //middle chair
      fill(colors[colorType][0]);
      rect(29*xR, 14*yR, 11*xR, 2*yR);
      ellipse(40*xR, 14*yR, 22*xR, 1*yR);
      
      //closest table
      fill(colors[colorType][1]);
      quad(27*xR, 16*yR, 40*xR, 16*yR, 40*xR, 18*yR, 23*xR, 18*yR);
      
      //closest chair
      fill(colors[colorType][0]);
      rect(17*xR, 18*yR, 23*xR, 2*yR);
      ellipse(40*xR, 18*yR, 46*xR, 1*yR);
    }
  }