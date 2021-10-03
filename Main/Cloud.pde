class Cloud {
  PImage cloud;
  float x, y, w, h;

  Cloud(float _w, float _h) {
    cloud=loadImage("cloud.png");
    this.w = _w;
    this.h = _h;
    this.x=random(0, -100);
    this.y=random(0, h*0.45);
  }

  void display() {
    image(cloud, x, y);
  }

  void moveCloud(Cloud c) { //pass windspeed here
    c.x+= windSpeed; // x+=windspeed
    if (c.x>w) {
      c.x=random(-500, -100);
      c.y=random(0, h*0.45); //will be changed depending where the window is
    }
  }
  void updateCloud() {
    for (int i =0; i < cloudsArr.size(); i++) {
      Cloud c = cloudsArr.get(i);
      c.display();
      c.moveCloud(c);
    }
  }

  void populateCloudArr(float solarRadiation) {
    if (solarRadiation > 1 && solarRadiation < 100) {
      for (int i=0; i<2; i++) {
        cloudsArr.add(new Cloud(width, height));
      }
    } else if (solarRadiation > 100 && solarRadiation < 250) {
      for (int i=0; i<4; i++) {
        cloudsArr.add(new Cloud(width, height));
      }
    } else if (solarRadiation > 250) {
      for (int i=0; i<6; i++) {
        cloudsArr.add(new Cloud(width, height));
      }
    }
  }
}