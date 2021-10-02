class Guide{
  float xInput, yInput;
  float size;
  PImage guideimg;
  
  Guide(float xInput, float yInput, float size){
    this.xInput = xInput;
    this.yInput = yInput;
    this.size = size;
  }
    
  void display(){
    fill(0,255,0);
    ellipse(xInput, yInput, size, size);
    fill(0);
    textSize(size/3);
    text("HELP", xInput-size/2.5, yInput+size/10);
  }

  }
 
