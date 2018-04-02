class Particle {
  PVector oldLoc, loc, vector;
  int clr, sb, shine, shine_countdown;
  float friction, speed, zoff;
  
  Particle(float x, float y, float dx, float dy, int c, int s) {
    loc = new PVector(x,y, 0);
    oldLoc = new PVector(x,y, 0); 
    vector = new PVector(dx, dy, 0);

    speed = noise(dx * 100 + x, dy * 100 + y) * random(s);
    zoff = -100;
    clr = c;
    sb = 255;
    friction = .98;
    shine = 0;
    shine_countdown = 6;
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
    zoff += 20;    
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
    beginShape();
      vertex(loc.x,loc.y, zoff);
      vertex(oldLoc.x, oldLoc.y, zoff);
      vertex(oldLoc.x, oldLoc.y, zoff);
    endShape();
    
 
  }
  
  boolean finished() {
    
    int m = 50;
    return (zoff > 500 || speed <= .01); 
  }
  
}
