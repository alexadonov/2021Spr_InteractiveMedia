class Cloud {
  PImage cloud;
  float x, y, w, h,speed;

  Cloud(float _w, float _h, float _speed) {
    cloud=loadImage("cloud.png");
    this.w = _w;
    this.h = _h;
    this.speed = _speed;
    this.x=random(-500, -100);
    this.y=random(0, h);
  }

  void display() {
    image(cloud, x, y);
  }

  void moveCloud(Cloud c) { //pass windspeed here
    c.x+= speed; // x+=windspeed
    if (c.x>w) {
      c.x=random(-500, -100);
      c.y=random(0, h); //will be changed depending where the window is
    }
  }
  
  
}
