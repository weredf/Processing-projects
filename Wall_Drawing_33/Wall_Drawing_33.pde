// Based on instructions to Wall Drawing #33, 1970 by Sol LeWitt

import processing.svg.*;

boolean record;

color bg = #ffffff;
color vert = #000000;
color hor = #FFD700;
color diagR = #FF4500;
color diagL = #4682B4;

void setup() {
  // set up size for 10 squares of 1 inch each
  size(960, 960);
  noLoop();
}

void draw() {
  if (record) {
    beginRecord(SVG, "slwd-33-####.svg");
  }
  
  background(bg);
  
  // parameters
  float alpha = 99;
  
  float tilesX = 10;
  float tilesY = tilesX;
 
  float tileW = width / tilesX;
  float tileH = height / tilesY;
 
  noStroke();
  // draw grid
  for (int i = 0; i < height; i += tileW) {
    fill(vert);
    rect(0, i, width, .25);
    fill(vert);
    rect(i, 0, .25, height);
  }

  // draw lines
  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {
      float posX = tileW * x;
      float posY = tileH * y;
      
      // random selector
      int selector = int(random(4));

      // draw horizontal, vertical, or diagonal line
      pushMatrix();
      translate(posX, posY);
      if (selector == 0) {
        stroke(vert, alpha);
        line(tileW/2, 0, tileW/2, tileH*2);
      } else if (selector == 1) {
        stroke(hor, alpha);
        line(0, tileH/2, tileW*2, tileH/2);
      } else if (selector == 2) {
        stroke(diagR, alpha);
        line(0, 0, tileW*2, tileH*2);
      } else {
        stroke(diagL, alpha);
        line(0, tileH*2, tileW*2, 0);
      }

      popMatrix();
    }
  }
  
  if (record) {
    endRecord();
    record = false;
  }
}

// press up to renew randomized art, down to record
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
  redraw();
  }
  else if (keyCode == DOWN) {
  record = true;
    }
  }
}
