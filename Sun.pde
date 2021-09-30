class Sun {
  float xR,yR;
  
  float outerRadius = 4;
  
  Sun(float _x, float _y){
    xR=_x/40;
    yR=_y/20;
  }
  
  void display() {
    fill(#FC9E50);
    ellipse(37*xR, 3*yR, outerRadius*xR, outerRadius*yR);
    fill(#FFDE93);
    ellipse(37*xR, 3*yR, 3*xR, 3*yR);
  }
}