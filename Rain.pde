class Rain {
  float x, y, w, h, len, speed, arrSize;

  Rain(float _w, float _h) {
    this.x = random(0, _w);
    this.y = random(0, _h);
    this.len = random(5, 10);
    this.speed = random(1, 20);
    this.w = _w;
    this.h = _h;
  }

  void display() {
    for (int i =0; i <raindrops.size(); i++) {
      update();    
      show();
    }
  }

  void show() {
    strokeWeight(2);
    stroke(255); //change for rain colour
    line(x, y, x, y+len); //draws a line from original point to next point
  }
  
  void update() {
    for (int i =0; i < raindrops.size(); i++) {
       Rain r = raindrops.get(i);
      r.show();
      r.moveRain(r);
    }
  }

  void moveRain(Rain r) {
    r.y+=speed;
    if (r.y>h) {
      r.y = random(0, h);
      speed=random(1, 20);
    }
  }

  void populate() {
    float rainAmount = 500*rainGauge;
    println(rainGauge);
    println("Rain Amount" + rainAmount);
    while (rainAmount > raindrops.size()) {
      raindrops.add(new Rain(width, height));
    }
  }
}