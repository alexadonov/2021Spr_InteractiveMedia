class Sky {
  float h, w;
  int colorType;

  //color Array
  int colors[][] = {
    //day
    {
      #38908F,
      #E08963
    },
    //night
    {
      #002D33,
      #858D5A
    },
    //dusk
    {
      #BC85A3,
      #F9E1E0
    },
    //dawn
    {
      #89AEB2,
      #E7CFC8
    }
  };

  Sky(float w, float h) { //h for height, w for width
    this.w = w;
    this.h = h;
  }

  void update(int newColor) {
    colorType = newColor;
  }

  void display() {
    for (int i =0; i<(h*0.45); i++) {
      float n = map(i, 0, h, 0, 1); // for some reason, none of these work without size()
      color blendC = lerpColor(colors[colorType][0], colors[colorType][1], n); //
      stroke(blendC);
      line(0, i, w, i);
    }
  }
}
