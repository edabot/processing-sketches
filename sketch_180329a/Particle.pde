class Particle {
  PVector oldLoc, loc, vector;
  int clr, sb, shine, shine_countdown;
  float friction, speed;
  
  Particle(float x, float y, float dx, float dy, int c, int s) {
    loc = new PVector(x,y);
    oldLoc = new PVector(x,y); 
    vector = new PVector(dx, dy);
    speed = noise(dx * 100 + x, dy * 100 + y) * random(s);
    clr = c;
    sb = 255;
    friction = .98;
    shine = 0;
    shine_countdown = 8;
  }
  
  void update() {
    oldLoc = new PVector(loc.x, loc.y);
    float angle = noise(loc.x, loc.y) * TWO_PI * 4;
    int row = int(loc.y / zone_size);
    int col = int(loc.x / zone_size);
    int index = row * cols + col;
    vector.setMag(speed);

    if (index > 0 && index < rows * cols) {
      vector.add(flowField.get(index));
    }
    loc.add(vector);
    speed *= friction;
    sb -= 4;
    if (shine < 255 && shine_countdown <= 0 ) {
      shine += 40;
      sb = 255;
    }
    shine_countdown--;

  }
  
  void show() {
    colorMode(HSB);
    strokeWeight(1.5);
    if (shine < 255) {
      stroke(clr, shine, sb);
    } else {
      stroke(clr, sb, sb);
    }
 
    line(loc.x,loc.y, 0, oldLoc.x, oldLoc.y, 0);
  }
  
  boolean finished() {
    
    int m = 50;
    return (loc.x > width + m || loc.x < -m || loc.y > height +m || loc.y < -m || speed <= .01); 
  }
  
}
