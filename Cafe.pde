class Cafe {
    float yR, xR;
    int colorType=0;
    
    //color array
    int colors[][] = {
      //day
      {
        //table tops + path
        #FFBFA3,
        //table sides
        #E08963,
        //main wall
        #B2EBE0,
        //window wall
        #E4F8F6,
        //floor
        #EFD986
      },
      //night
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
      //dusk
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
      //dawn
      {
        //table tops + path
        #E7CFC8,
        //table sides
        #F1CDB0,
        //main wall
        #97F2F3,
        //window wall
        #B1F1E1,
        //floor
        #F1E0B0
      }
    };
    
    Cafe(float _x, float _y) {
      yR = _y/20;
      xR = _x/40;
    }
    
    void updateColor(int newColor) {
     colorType = newColor; 
    }
    
    void display() {
      noStroke();
      //path
      fill(colors[colorType][0]);
      quad(15*xR, 9*yR, 15*xR, 11*yR, 40*xR, 11*yR, 40*xR, 9*yR);
      
      //floor
      fill(colors[colorType][4]);
      quad(0*xR, 11*yR, 40*xR, 11*yR, 40*xR, 20*yR, 0*xR, 20*yR);
      
      //door
      fill(colors[colorType][2]);
      rect(15*xR, 0*yR, 0.5*xR, 11*yR);
      rect(18*xR, 0*yR, 0.5*xR, 10*yR);
      quad(15*xR, 11*yR, 15*xR, 10*yR, 18.5*xR, 9*yR, 18.5*xR, 10*yR);
      
      //windows
      fill(colors[colorType][3]);
      rect(20*xR, 0*yR, 0.5*xR, 11*yR);
      rect(26.5*xR, 0*yR, 0.5*xR, 11*yR);
      rect(33*xR, 0*yR, 0.5*xR, 11*yR);
      rect(20*xR, 10*yR, 20*xR, 1*yR);
      
      
      //counter
      fill(colors[colorType][1]);
      quad(15*xR, 9*yR, 15*xR, 12*yR, 4*xR, 15.5*yR, 4*xR, 12*yR);
      fill(colors[colorType][0]);
      quad(15*xR, 9*yR, 11*xR, 9*yR, 4*xR, 10.5*yR, 4*xR, 12*yR);
  
      //jukebox
      
      //walls 
      //wall next to door
      fill(colors[colorType][3]);
      quad(11*xR, 0*yR, 15*xR, 0*yR, 15*xR, 9*yR, 11*xR, 9*yR);
      //wall behind counter
      fill(colors[colorType][2]);
      quad(11*xR, 0*yR, 0*xR, 0*yR, 0*xR, 12*yR, 11*xR, 9*yR);
      
      //clock
      fill(#FFFFFF);
      stroke(0);
      strokeWeight(4);
      ellipse(13*xR, 2*yR, 2*xR, 2*yR);
      line(13*xR, 2*yR, 13*xR, 1.25*yR);
      line(13*xR, 2*yR, 13.5*xR, 1.5*yR);
      
      //calender
      strokeWeight(3);
      rect(12*xR, 4*yR, 2*xR, 2*yR);
      rect(12*xR, 4*yR, 2*xR, 0.5*yR);
      rect(12.25*xR, 4.75*yR, 0.5*xR, 0.5*yR);
      rect(13.25*xR, 4.75*yR, 0.5*xR, 0.5*yR);
      rect(12.25*xR, 5.4*yR, 0.5*xR, 0.5*yR);
      rect(13.25*xR, 5.4*yR, 0.5*xR, 0.5*yR);
      
      //data board
      quad(10*xR, 1*yR, 10*xR, 6*yR, 1*xR, 8*yR, 1*xR, 2*yR);
      quad(9.5*xR, 2*yR, 9.5*xR, 5.75*yR, 1.5*xR, 7.5*yR, 1.5*xR, 3*yR);
    }
  }