Raindrop[] raindrops = new Raindrop[500];

void setup() {
  size(700, 800);
  for (int i=0; i<raindrops.length; i++) {
    raindrops[i]=new Raindrop();
  }
}

void draw() {
  background(0);
  for (int i =0; i <raindrops.length; i++) {
    raindrops[i].update();    
    raindrops[i].show();
  }
}

class Raindrop {
  float x, y, len, speed;

  Raindrop() {
    x=random(width); 
    y=random(-300, -200); //so they start from the very top
    len=10;
    speed=random(1, 20); //different speeds for some variety
  }

  void update() {
    y+=speed;

    if (y>height) {
      y=random(-300, -200);
      speed=random(1, 20);
    }
  }

  void show() {
    strokeWeight(2);
    stroke(255); //change for rain colour
    line(x, y, x, y+len); //draws a line from original point to next point, since this is called in draw it keeps going
  }
}
