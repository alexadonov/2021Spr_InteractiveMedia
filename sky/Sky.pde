import controlP5.*;


void setup() {
} //this is just to test things, comment this out.
//none of the functions work without size()

class Sky {
  color c1, c2;
  int h, w, time;

  Sky(int h, int w, int time) { //h for height, w for width, time for whatever time it is.
    this.h = h; //based time on Alexa's way of changing colours for furniture
    this.w = w;
    this.time = time;
  }

  void updateTime() {

    switch(time) {
    case 1: //day
      c1 = color(#38908F);
      c2 = color(#E08963);

      break;
    case 2: //dawn
      c1 = color(#89AEB2);
      c2 = color(#E7CFC8);
      break;
    case 3: //dusk
      c1 = color(#BC85A3);
      c2 = color(#F9E1E0);
      break;
    case 4: //night
      c1 = color(#002D33);
      c2 = color(#858D5A);
      break;
    default: //just to have something. can be changed.
      c1 = color(#38908F);
      c2 = color(#E08963);
      println("Default sky colours selected.");
      break;
    }
  }

  void display() {
    for (int i =0; i<h; i++) {
      float n = map(i, 0, h, 0, 1); // for some reason, none of these work without size()
      color blendC = lerpColor(c1, c2, n); //
      stroke(blendC);
      line(0, i, w, i);
    }
  }
}
