class Particle {
  PVector loc, vector;
  int c, s, decay;

  Particle(float x,float y, float dx, float dy) {
    loc = new PVector(x,y);
    vector = new PVector(dx,dy);
    c = int(random(0,255));
    s = 255;
    decay = 200;
  }

  void update() {
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
    stroke(c, s, s);
    strokeWeight(2);
    point(loc.x,loc.y);
  }
}
