ArrayList<Particle> particles;
ArrayList<PVector> flowField;
int rows, cols, zone_size, initSpeed;
float zoff, zinc, fieldInc, fieldStrength;

void setup() {
  size(900,900, P2D);
  zone_size = 5;
  rows = height / zone_size;
  cols = width / zone_size;
  fieldStrength = 3;
  flowField = new ArrayList<PVector>();
  particles = new ArrayList<Particle>();
  zoff = .001;
  zinc = .005;
  fieldInc = .005;
  initSpeed = 7;
}

void draw() {
  background(0, 5);
  zoff += zinc;
  for (int x = 0; x < 1500; x++) {
    if (particles.size() < 200000) {
      Particle newP = newParticle();
      particles.add(newP);
    }
  }
  flowField = new ArrayList<PVector>();
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      float angle = noise(x * fieldInc, y * fieldInc, zoff) * TWO_PI * 4;
      PVector v = new PVector(fieldStrength, 0);
      v.rotate(angle);
      flowField.add(v);
    }
  }

  for (int i = 0; i < particles.size(); i++) {
    Particle part = particles.get(i);
    if (part.finished()) {
      particles.remove(i);
    }
    part.update();
    part.show();
  }
  fill(0, 80);
  noStroke();
  ellipse(width/2, height/2, 300,300);
  saveFrame("output/output-####.png");
  println(particles.size());
}

Particle newParticle() {
  float angle = random(0, TWO_PI);
  PVector v = new PVector(150, 0);
  PVector dv = new PVector(initSpeed, 0);
  v.rotate(angle);
  dv.rotate(angle);
  return new Particle(v.x + width/2,v.y+height/2, dv.x, dv.y);
}
