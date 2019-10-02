  
int x = 40;
float angle = 0;
float flameScale;
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;
PImage img, rocket, flame;  // Declare variable "a" of type PImage


void setup() {
  size(500, 400);
  c1 = color(201, 228, 255);
  c2 = color(42, 147, 255);
  img = loadImage("clouds.png");  // Load the image into the program  
  rocket = loadImage("ship.png");  // Load the image into the program  
  flame = loadImage("flame.png");  // Load the image into the program  

}
void draw() {
   setGradient(0, 0, width, height, c1, c2, Y_AXIS);

  if (x > 0) {
    x -= 1;
  } else {
    x = 40;
  }
  
    angle += .2;
    flameScale = 1 + sin(angle) * .3;

    image(img, 0, -10 * x);
    image(rocket, 0, 0);
    scale(flameScale,1);
    translate((flameScale-1)*250,0);
    image(flame, 0, 0);


  // Saves each frame as screen-0001.tif, screen-0002.tif, etc.
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
