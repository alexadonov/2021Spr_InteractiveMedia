ArrayList<Cloud> cloudsArr = new ArrayList();
int cloudNum=5;
float x, y;

void setup() {
  size(600, 600);
  for (int i=0; i<cloudNum; i++) {
    cloudsArr.add(new Cloud());
  } //fill up list with clouds
}


void draw() {
  background(0);
  for (int i = cloudsArr.size() -1; i>=0; i--) {
    Cloud c = cloudsArr.get(i);
    c.spawnCloud();
    c.moveCloud(c);
  }
}

class Cloud {
  float x, y;
  PImage cloud;

  Cloud() {
    cloud=loadImage("cloud.png");
    x=random(-500, -100);
    y=random(0, height);
  }

  void spawnCloud() {
    image(cloud, x, y);
  }

  void moveCloud(Cloud c) { //pass windspeed here
    c.x++; // x+=windspeed
    if (c.x>width) {
      c.x=random(-500, -100);
      c.y=random(0, height); //will be changed depending where the window is
    }
  }
}
