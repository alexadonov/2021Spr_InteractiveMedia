class CafeJuke {
    float xR, yR;
    
    CafeJuke(float _x, float _y) {
      yR = _y/20;
      xR = _x/40;
    }
    
    void display(){
      //depth
      ellipse(1*xR, 12*yR, 4*xR, 7*yR);
      
      //arch
      ellipse(2*xR, 12*yR, 4*xR, 6.5*yR);
      //arch detail
      ellipse(2*xR, 12*yR, 3.5*xR, 6*yR);
      ellipse(2*xR, 12*yR, 2*xR, 4*yR);
      
      //base
      quad(0*xR, 12*yR, 4*xR, 11*yR, 4*xR, 15.5*yR, 0*xR, 17*yR);
      //base details
      quad(0*xR, 12*yR, 0.25*xR, 11.95*yR, 0.25*xR, 16.9*yR, 0*xR, 17*yR);
      quad(4*xR, 11*yR, 4*xR, 15.5*yR, 3.75*xR, 15.6*yR, 3.75*xR, 11.1*yR);
      quad(1*xR, 13*yR, 3*xR, 12.5*yR, 3*xR, 14.5*yR, 1*xR, 15.2*yR);
      quad(0*xR, 11.8*yR, 0.35*xR, 11.7*yR, 0.35*xR, 12.6*yR, 0*xR, 12.7*yR);
      quad(3.65*xR, 11.8*yR, 4*xR, 11.7*yR, 4*xR, 10.8*yR, 3.65*xR, 10.9*yR);
    }
  }