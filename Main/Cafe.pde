class Cafe {
  float yR, xR;
  int colorType;
<<<<<<< Updated upstream
  
=======

>>>>>>> Stashed changes
  //color array
  int colors[][] = {
    //0 day
    {
      //0 table tops + path
<<<<<<< Updated upstream
      #FFBFA3,
      //1 table sides
      #E08963,
      //2 main wall
      #B2EBE0,
      //3 window wall
      #E4F8F6,
      //4 floor
      #EFD986
    },
    //1 night
    {
      //table tops + path
      #98A27D,
      //table sides
      #858D5A,
      //main wall
      #005862,
      //window wall
      #0385C2,
      //floor
      #1F5496
    },
    //2 dusk
    {
      //table tops + path
      #FEADB9,
      //table sides
      #BC85A3,
      //main wall
      #9799BA,
      //window wall
      #F1987D,
      //floor
      #39093B
    },
    //3 dawn
    {
      //table tops + path
      #E7CFC8,
      //table sides
      #F1CDB0,
      //main wall
      #97F2F3,
      //window wall
      #B1F1E1,
=======
      #FFBFA3, 
      //1 table sides
      #E08963, 
      //2 main wall
      #B2EBE0, 
      //3 window wall
      #E4F8F6, 
      //4 floor
      #EFD986
    }, 
    //1 night
    {
      //table tops + path
      #98A27D, 
      //table sides
      #858D5A, 
      //main wall
      #005862, 
      //window wall
      #0385C2, 
      //floor
      #1F5496
    }, 
    //2 dusk
    {
      //table tops + path
      #FEADB9, 
      //table sides
      #BC85A3, 
      //main wall
      #9799BA, 
      //window wall
      #F1987D, 
      //floor
      #39093B
    }, 
    //3 dawn
    {
      //table tops + path
      #E7CFC8, 
      //table sides
      #F1CDB0, 
      //main wall
      #97F2F3, 
      //window wall
      #B1F1E1, 
>>>>>>> Stashed changes
      //floor
      #F1E0B0
    }
  };
<<<<<<< Updated upstream
  
=======

>>>>>>> Stashed changes
  Cafe(float _x, float _y) {
    yR = _y/20;
    xR = _x/40;
  }
<<<<<<< Updated upstream
  
  void update(int newColor) {
   colorType = newColor; 
  }
  
=======

  void update(int newColor) {
    colorType = newColor;
  }

>>>>>>> Stashed changes
  void display() {
    noStroke();
    //path
    fill(colors[colorType][0]);
    quad(15*xR, 9*yR, 15*xR, 11*yR, 40*xR, 11*yR, 40*xR, 9*yR);
<<<<<<< Updated upstream
    
    //floor
    fill(colors[colorType][4]);
    quad(0*xR, 11*yR, 40*xR, 11*yR, 40*xR, 20*yR, 0*xR, 20*yR);
    
=======

    //floor
    fill(colors[colorType][4]);
    quad(0*xR, 11*yR, 40*xR, 11*yR, 40*xR, 20*yR, 0*xR, 20*yR);

>>>>>>> Stashed changes
    //door
    fill(colors[colorType][2]);
    rect(15*xR, 0*yR, 0.5*xR, 11*yR);
    rect(18*xR, 0*yR, 0.5*xR, 10*yR);
    quad(15*xR, 11*yR, 15*xR, 10*yR, 18.5*xR, 9*yR, 18.5*xR, 10*yR);
<<<<<<< Updated upstream
    
=======

>>>>>>> Stashed changes
    //windows
    fill(colors[colorType][3]);
    rect(20*xR, 0*yR, 0.5*xR, 11*yR);
    rect(26.5*xR, 0*yR, 0.5*xR, 11*yR);
    rect(33*xR, 0*yR, 0.5*xR, 11*yR);
    rect(20*xR, 10*yR, 20*xR, 1*yR);
<<<<<<< Updated upstream
    
=======

>>>>>>> Stashed changes
    //Furniture
    //furthest chair
    fill(colors[colorType][1]);
    rect(38*xR, 11*yR, 2*xR, 1*yR);
    ellipse(40*xR, 11*yR, 4*xR, 1*yR);
<<<<<<< Updated upstream
    
    //furthest table
    fill(colors[colorType][0]);
    quad(36*xR, 12*yR, 40*xR, 12*yR, 40*xR, 14*yR, 33*xR, 14*yR);
    
=======

    //furthest table
    fill(colors[colorType][0]);
    quad(36*xR, 12*yR, 40*xR, 12*yR, 40*xR, 14*yR, 33*xR, 14*yR);

>>>>>>> Stashed changes
    //middle chair
    fill(colors[colorType][1]);
    rect(29*xR, 14*yR, 11*xR, 2*yR);
    ellipse(40*xR, 14*yR, 22*xR, 1*yR);
<<<<<<< Updated upstream
    
    //closest table
    fill(colors[colorType][0]);
    quad(27*xR, 16*yR, 40*xR, 16*yR, 40*xR, 18*yR, 23*xR, 18*yR);
    
=======

    //closest table
    fill(colors[colorType][0]);
    quad(27*xR, 16*yR, 40*xR, 16*yR, 40*xR, 18*yR, 23*xR, 18*yR);

>>>>>>> Stashed changes
    //closest chair
    fill(colors[colorType][1]);
    rect(17*xR, 18*yR, 23*xR, 2*yR);
    ellipse(40*xR, 18*yR, 46*xR, 1*yR);
<<<<<<< Updated upstream
    
=======

>>>>>>> Stashed changes
    //counter
    fill(colors[colorType][1]);
    quad(15*xR, 9*yR, 15*xR, 12*yR, 4*xR, 15.5*yR, 4*xR, 12*yR);
    fill(colors[colorType][0]);
    quad(15*xR, 9*yR, 11*xR, 9*yR, 4*xR, 10.5*yR, 4*xR, 12*yR);
<<<<<<< Updated upstream
    
=======

>>>>>>> Stashed changes
    //walls 
    //wall next to door
    fill(colors[colorType][3]);
    quad(11*xR, 0*yR, 15*xR, 0*yR, 15*xR, 9*yR, 11*xR, 9*yR);
    //wall behind counter
    fill(colors[colorType][2]);
    quad(11*xR, 0*yR, 0*xR, 0*yR, 0*xR, 12*yR, 11*xR, 9*yR);
<<<<<<< Updated upstream
    
    //clock
    //fill(#FFFFFF);
    //stroke(0);
    //strokeWeight(4);
    //ellipse(13*xR, 2*yR, 2*xR, 2*yR);
    //line(13*xR, 2*yR, 13*xR, 1.25*yR);
    //line(13*xR, 2*yR, 13.5*xR, 1.5*yR);
    
=======

    //calender
    strokeWeight(3);
    rect(12*xR, 4*yR, 2*xR, 2*yR);
    rect(12*xR, 4*yR, 2*xR, 0.5*yR);
    rect(12.25*xR, 4.75*yR, 0.5*xR, 0.5*yR);
    rect(13.25*xR, 4.75*yR, 0.5*xR, 0.5*yR);
    rect(12.25*xR, 5.4*yR, 0.5*xR, 0.5*yR);
    rect(13.25*xR, 5.4*yR, 0.5*xR, 0.5*yR);

>>>>>>> Stashed changes
    //data board
    noStroke();
    fill(colors[colorType][1]);
    quad(10*xR, 1*yR, 10*xR, 6*yR, 1*xR, 8*yR, 1*xR, 2*yR);
    fill(#FFFFFF);
    quad(9.5*xR, 2*yR, 9.5*xR, 5.75*yR, 1.5*xR, 7.5*yR, 1.5*xR, 3*yR);
  }
<<<<<<< Updated upstream
  
  float getX() {
    return this.xR;
  }
  
=======

  float getX() {
    return this.xR;
  }

>>>>>>> Stashed changes
  float getY() {
    return this.yR;
  }
}
