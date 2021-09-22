/*
Author: Danielle A.

A start to the sky gradient.
*/

import controlP5.*;

ControlP5 cp5;
color c1, c2;

void setup() {
  size(800, 800);
  c1 = color(#38908F); 
  c2 = color(#E08963);
  cp5 = new ControlP5(this);

  //This part will be changed. Should be connected to Clock object.
  cp5.addButton("dayButton")
    .setSize(50, 50)
    .setPosition(50, 30)
    .setCaptionLabel("Day");
  cp5.addButton("dawnButton")
    .setSize(50, 50)
    .setPosition(120, 30)
    .setCaptionLabel("Dawn");
  cp5.addButton("duskButton")
    .setSize(50, 50)
    .setPosition(190, 30)
    .setCaptionLabel("Dusk");
  cp5.addButton("nightButton")
    .setSize(50, 50)
    .setPosition(260, 30)
    .setCaptionLabel("Night");
}

void draw() {
  //Background
  for (int i =0; i<height; i++) {
    float n = map(i, 0, height, 0, 1); //i should be between 0 and height, n should be between 0 and 1. 
    color blendC = lerpColor(c1, c2, n); //meaning n should increase with i.
    stroke(blendC); // meaning lerpColor finds every color in between c1 and c2.
    line(0, i, width, i);
  }
}

void dayButton() {
  c1 = color(#38908F); 
  c2 = color(#E08963);
}
void dawnButton() {
  c1 = color(#89AEB2); 
  c2 = color(#E7CFC8);
}

void duskButton() {
  c1 = color(#BC85A3); 
  c2 = color(#F9E1E0);
}

void nightButton() {
  c1 = color(#002D33); 
  c2 = color(#858D5A);
}
