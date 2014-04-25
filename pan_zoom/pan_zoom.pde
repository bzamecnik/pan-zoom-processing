/*
Pan-Zoom Controller demo.

@author Bohumir Zamecnik
@license MIT
@see PanZoonController

Inspired by "Pan And Zoom" by Dan Thompson,
licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID= 46964  
License: 
http://creativecommons.org/licenses/by-sa/3.0/
http://creativecommons.org/licenses/GPL/2.0/

*/

PanZoomController panZoomController;

void setup() {
  size(600, 400);
  smooth();
  panZoomController = new PanZoomController(this);
}
 
void draw() {
  PVector pan = panZoomController.getPan();
  float scale = panZoomController.getScale();
  
  background(64);
  
  // grid relative to the window
  strokeWeight(2);
  stroke(96);
  drawGrid(40);
  
  pushMatrix();
  
  translate(pan.x, pan.y);
  scale(scale);

  // grid relative to current pan and zoom
  stroke(128);
  strokeWeight(2);
  drawGrid(40);
  
  // some scene
  drawScene();
  
  popMatrix();
  
  // mouse cursor
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 10, 10);
}

void drawScene() {
  noStroke();
  
  // head
  fill(255, 255, 0, 64);
  ellipseMode(CORNERS);
  
  ellipse(0, 0, width, height);
  
  // eyes
  fill(192, 192, 192, 128);
  ellipseMode(CENTER);
  ellipse(width * (0.5 - 0.2), height * 0.35, 75, 75);
  ellipse(width * (0.5 + 0.2), height * 0.35, 75, 75);
  // mouth
  ellipse(width * 0.5, height * 0.75, 300, 75);
}

void drawGrid(float spacing) {
  for (int x = 0; x <= width; x += spacing) {
    line(x, 0, x, height);
  }
  for (int y = 0; y <= height; y += spacing) {
    line(0, y, width, y);
  }
}

void keyPressed() {
  panZoomController.keyPressed();
}

void mouseDragged() {
  panZoomController.mouseDragged();
}

