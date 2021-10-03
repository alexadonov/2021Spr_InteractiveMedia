import controlP5.*;
import beads.*;

class Cell {
  float x, y, w, h, angle;

  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  }

  void oscillate() {
    angle += 0.02;
  }

  void display() {
    stroke(255);
    // Color calculated using sine wave
    float bright = map(tan(angle), -1, 1, 0, 255);
    fill(bright, 50, 255);
    rect(x, y, w, h);
  }
}


class Jukebox {
  AudioContext ac;
  SamplePlayer p1, p2, p3, p4, p5, p6;
  ControlP5 cp5;
  Cell[][] grid; 
  int cols, rows, buttonSize, jukeWidth, musicPlaying;
  
  Jukebox(AudioContext _ac, ControlP5 _cp5) {
    this.ac = _ac;
    this.cp5 = _cp5;
    cols = 12;
    rows = 11;
    jukeWidth = 200;
    buttonSize = 20;
    musicPlaying = 0;
    grid = new Cell[cols][rows];
  } 

  void display() {
    //Jukebox overlay
    stroke(255);
    fill(133, 129, 252);
    arc(jukeWidth*1.5, jukeWidth, jukeWidth+jukeWidth/4, jukeWidth+jukeWidth/4, PI, TWO_PI); //
    rect(jukeWidth-jukeWidth/8, jukeWidth, jukeWidth+jukeWidth/4, jukeWidth, 3);
    //second out
    fill(129, 187, 252);
    arc(jukeWidth*1.5, jukeWidth, jukeWidth+jukeWidth/8, jukeWidth+jukeWidth/8, PI, TWO_PI);
    rect(jukeWidth-jukeWidth/16, jukeWidth, jukeWidth+jukeWidth/8, jukeWidth, 3);
    //inner
    fill(#9656A1);
    noStroke();
    rect(jukeWidth, jukeWidth, jukeWidth, jukeWidth, 3);
    arc(jukeWidth*1.5, jukeWidth, jukeWidth, jukeWidth, PI, TWO_PI);
    //inner of inner
    fill(255, 209, 243);
    rect(jukeWidth+(jukeWidth/5), jukeWidth+(jukeWidth/3), jukeWidth*3/5, jukeWidth/3, 3);
    //legs
    stroke(0);
    fill(252, 252, 75);
    rect(jukeWidth-jukeWidth/5, jukeWidth*2-jukeWidth/6, jukeWidth/4, jukeWidth/6+1, 10);
    rect(jukeWidth*2-jukeWidth/16, jukeWidth*2-jukeWidth/6, jukeWidth/4, jukeWidth/6+1, 10);
    //
    fill(255, 209, 243);
    stroke(0);
    rect(jukeWidth-jukeWidth/5, jukeWidth+jukeWidth/10, jukeWidth/4, jukeWidth/20, 5);
    rect(jukeWidth-jukeWidth/5, jukeWidth+jukeWidth/20, jukeWidth/4, jukeWidth/20, 5);
    rect(jukeWidth-jukeWidth/5, jukeWidth, jukeWidth/4, jukeWidth/20, 5);

    rect(jukeWidth*2-jukeWidth/16, jukeWidth, jukeWidth/4, jukeWidth/20, 5);
    rect(jukeWidth*2-jukeWidth/16, jukeWidth+jukeWidth/10, jukeWidth/4, jukeWidth/20, 5);
    rect(jukeWidth*2-jukeWidth/16, jukeWidth+jukeWidth/20, jukeWidth/4, jukeWidth/20, 5);
    //
    noStroke();
    arc(jukeWidth*1.5, jukeWidth, jukeWidth/1.5, jukeWidth/1.5, PI, TWO_PI);
    rect(jukeWidth+(jukeWidth/6), jukeWidth, jukeWidth*2/3, jukeWidth/6, 3);
    stroke(0, 0, 255);
    arc(jukeWidth*1.5, jukeWidth, jukeWidth/1.7, jukeWidth/1.7, PI, TWO_PI);
    stroke(255, 0, 0);
    arc(jukeWidth*1.5, jukeWidth, jukeWidth/2, jukeWidth/2, PI, TWO_PI);
    stroke(255);
    arc(jukeWidth*1.5, jukeWidth, jukeWidth/2.5, jukeWidth/2.5, PI, TWO_PI);
    stroke(255, 165, 0);
    arc(jukeWidth*1.5, jukeWidth, jukeWidth/3.5, jukeWidth/3.5, PI, TWO_PI);
    stroke(255, 255, 0);
    arc(jukeWidth*1.5, jukeWidth, jukeWidth/5, jukeWidth/5, PI, TWO_PI);
    stroke(221, 160, 221);
    arc(jukeWidth*1.5, jukeWidth, jukeWidth/8, jukeWidth/8, PI, TWO_PI);
    stroke(0, 255, 0);
    arc(jukeWidth*1.5, jukeWidth, jukeWidth/15, jukeWidth/15, PI, TWO_PI);

    stroke(0);
    fill(255, 0, 0);
    quad(jukeWidth*1.5, jukeWidth/1.8, jukeWidth*1.4, jukeWidth/3, jukeWidth*1.5, jukeWidth/2.65, jukeWidth*1.6, jukeWidth/3);
  }
}
