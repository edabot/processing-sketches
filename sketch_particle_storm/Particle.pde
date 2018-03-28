class Particle {
  PVector oldLoc, loc, vector;
  int c, s, decay;

  Particle(float x,float y, float dx, float dy, int clr) {
    loc = new PVector(x,y);
    oldLoc = new PVector(x,y);
    vector = new PVector(dx,dy);
    s = 255;
    c = clr;
    decay = 200;
  }

  void update() {
    oldLoc = new PVector(loc.x, loc.y);
    int row = int(loc.y / zone_size);
    int col = int(loc.x / zone_size);
    int index = row * cols + col;
    if (index > 0 && index < rows * cols) {
      vector.add(flowField.get(index));
    }
    vector.limit(7);
    loc.add(vector);
    decay -= 1;
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
