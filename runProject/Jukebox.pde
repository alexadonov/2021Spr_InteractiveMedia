import controlP5.*;
import beads.*;

class Jukebox {
  AudioContext ac;
  SamplePlayer p1, p2, p3, p4, p5, p6;
  ControlP5 cp5;
  Cell[][] grid; 
  int cols, rows, buttonSize, jukeWidth, musicPlaying, xR, yR;

  Jukebox(int _x, int _y, AudioContext _ac, ControlP5 _cp5) {
    xR = _x/40;
    yR = _y/20;
    this.ac = _ac;
    this.cp5 = _cp5;
    cols = 12;
    rows = 11;
    jukeWidth = 200;
    buttonSize = 20;
    musicPlaying = 0;
    grid = new Cell[cols][rows];

    music1 = cp5.addButton("music1")
      .setVisible(jukeboxShown)
      .setCaptionLabel("+")
      .setPosition(jukeWidth*1.05, jukeWidth*1.2)
      .setSize(buttonSize, buttonSize)
      .setColorBackground(#C9753D)
      .setColorForeground(color(255, 0, 0))
      .setColorActive(color(0, 0, 255));

    music2 = cp5.addButton("music2")
      .setVisible(jukeboxShown)
      .setCaptionLabel("+")
      .setPosition(jukeWidth*1.25, jukeWidth*1.2)
      .setSize(buttonSize, buttonSize)
      .setColorBackground(#726A95)
      .setColorForeground(color(255, 0, 0))
      .setColorActive(color(0, 0, 255));

    music3 = cp5.addButton("music3")
      .setVisible(jukeboxShown)
      .setCaptionLabel("+")
      .setPosition(jukeWidth*1.45, jukeWidth*1.2)
      .setSize(buttonSize, buttonSize)
      .setColorBackground(#9D7726)
      .setColorForeground(color(255, 0, 0))
      .setColorActive(color(0, 0, 255));

    music4 = cp5.addButton("music4")
      .setVisible(jukeboxShown)
      .setCaptionLabel("+")
      .setPosition(jukeWidth*1.65, jukeWidth*1.2)
      .setSize(buttonSize, buttonSize)
      .setColorBackground(#34626C)
      .setColorForeground(color(255, 0, 0))
      .setColorActive(color(0, 0, 255));

    music5 = cp5.addButton("music5")
      .setVisible(jukeboxShown)
      .setCaptionLabel("+")
      .setPosition(jukeWidth*1.85, jukeWidth*1.2)
      .setSize(buttonSize, buttonSize)
      .setColorBackground(#70AF85)
      .setColorForeground(color(255, 0, 0))
      .setColorActive(color(0, 0, 255));

    stopB = cp5.addButton("stopMusic")
      .setVisible(jukeboxShown)
      .setCaptionLabel("STOP")
      .setPosition(jukeWidth*5/4, jukeWidth*1.02)
      .setSize(buttonSize*5/4, buttonSize*5/4)
      .setColorBackground(#6389df)
      .setColorForeground(color(0, 255, 0))
      .setColorActive(color(0, 0, 255));

    playB = cp5.addButton("playMusic")
      .setValue(0)
      .setVisible(jukeboxShown)
      .setCaptionLabel("PLAY")
      .setPosition(jukeWidth*13/8, jukeWidth*1.02)
      .setSize(buttonSize*5/4, buttonSize*5/4)
      .setColorBackground(#133A1B)
      .setColorForeground(color(255, 0, 0))
      .setColorActive(color(0, 0, 255));
  } 

  void mousePressed() {
    if ((mouseX > xR*0) && (mouseX < 4*xR) && (mouseY >10*yR) && (mouseY <17*yR)) {
      if (!jukeboxShown) {
        jukeboxShown = true;
        music1.setVisible(jukeboxShown);
        music2.setVisible(jukeboxShown);
        music3.setVisible(jukeboxShown);
        music4.setVisible(jukeboxShown);
        music5.setVisible(jukeboxShown);
        stopB.setVisible(jukeboxShown);
        playB.setVisible(jukeboxShown);
      } else {
        jukeboxShown = false;
        music1.setVisible(jukeboxShown);
        music2.setVisible(jukeboxShown);
        music3.setVisible(jukeboxShown);
        music4.setVisible(jukeboxShown);
        music5.setVisible(jukeboxShown);
        stopB.setVisible(jukeboxShown);
        playB.setVisible(jukeboxShown);
      }
    }
  }

  void music1() {
    p1.setToLoopStart();
    p1.start();
    musicPlaying = 1;
    p2.setToEnd();
    p3.setToEnd();
    p4.setToEnd();
    p5.setToEnd();
  }

  void music2() {
    p2.setToLoopStart();
    p2.start();
    musicPlaying = 2;
    p1.setToEnd();
    p3.setToEnd();
    p4.setToEnd();
    p5.setToEnd();
  }

  void music3() {
    p3.setToLoopStart();
    p3.start();
    musicPlaying = 3;
    p2.setToEnd();
    p1.setToEnd();
    p4.setToEnd();
    p5.setToEnd();
  }

  void music4() {
    p4.setToLoopStart();
    p4.start();
    musicPlaying = 4;
    p2.setToEnd();
    p3.setToEnd();
    p1.setToEnd();
    p5.setToEnd();
  }

  void music5() {
    p5.setToLoopStart();
    p5.start();
    musicPlaying = 5;
    p2.setToEnd();
    p3.setToEnd();
    p4.setToEnd();
    p1.setToEnd();
  }

  void stopMusic() {
    playB.setCaptionLabel("RESUME");
    println("Music paused.");
    p1.pause(true);
    p2.pause(true);
    p3.pause(true);
    p4.pause(true);
    p5.pause(true);
  }

  void playMusic() {
    switch(musicPlaying) {
    case 1: 
      p1.pause(false); 
      println("Music " + musicPlaying + " is now playing.");
      break;
    case 2: 
      p2.pause(false); 
      println("Music " + musicPlaying + " is now playing.");
      break;
    case 3: 
      p3.pause(false); 
      println("Music " + musicPlaying + " is now playing.");
      break;
    case 4: 
      p4.pause(false); 
      println("Music " + musicPlaying + " is now playing.");
      break;
    case 5: 
      p5.pause(false); 
      println("Music " + musicPlaying + " is now playing.");
      break;
    default: 
      println("Error in playMusic()"); 
      break;
    }
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