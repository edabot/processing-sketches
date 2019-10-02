class Particle {
  PVector oldLoc, loc, vector, gravity;
  int c, s, decay;
  int colorShift;

  Particle(float x,float y, float dx, float dy, int clr) {
    loc = new PVector(x,y);
    oldLoc = new PVector(x,y);
    vector = new PVector(dx,dy);
    gravity = new PVector(0,-3);
    s = 255;
    colorShift = floor(sin(random(PI))*40);
    c = clr + colorShift;
    decay = 200;
  }

  void update() {
    oldLoc = new PVector(loc.x, loc.y);
    int row = int(loc.y / zone_size);
    int col = int(loc.x / zone_size);
    int index = row * cols + col;
    if (index > 0 && index < rows * cols) {
      vector.add(flowField.get(index));
      vector.add(gravity);
    }
    vector.limit(7);
    loc.add(vector);
    decay -= 8;
    s = int(255 * decay / 200);
  }

  boolean finished() {
    int m = 50;
    return (loc.x > width + m || loc.x < -m || loc.y > height +m || loc.y < -m || decay < 5);
  }

  void show() {
    colorMode(HSB);
    stroke(c, s,s);
    strokeWeight(1);
    line(loc.x,loc.y, oldLoc.x, oldLoc.y);
  }
}
