class Guide{
  float xInput, yInput;
  float size;
  PImage guideimg;
  
  Guide(float xInput, float yInput, float size){
    this.xInput = xInput;
    this.yInput = yInput;
    this.size = size;
    
    guideimg = loadImage("user_guide.png");
    guideimg.resize(width, height);
  }
  
  void mousePressed() {
    if(dist(mouseX, mouseY, guide.xInput, guide.yInput)<guide.size/2){
      guideShown = !guideShown;
    }
  }
    
  void display(){
    fill(0,255,0);
    ellipse(xInput, yInput, size, size);
    fill(0);
    textSize(size/3);
    text("HELP", xInput-size/2.5, yInput+size/10);
    if(guideShown){
    image(guideimg, 0, 0); 
    }
  }

  }