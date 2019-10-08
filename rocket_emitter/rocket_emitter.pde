ArrayList<PVector> spots;
PImage img;
ArrayList<Particle> particles;
ArrayList<PVector> flowField;
int rows, cols, zone_size, initSpeed, numSpots,c;
float zoff, zinc, fieldInc, fieldStrength, pulseAngle;

void setup() {
  size(900, 900);
  zone_size = 5;
  rows = height / zone_size;
  cols = width / zone_size;
  fieldStrength = 2;
  flowField = new ArrayList<PVector>();
  particles = new ArrayList<Particle>();
  zoff = .001;
  zinc = .005;
  fieldInc = .01;
  initSpeed = 7;
  c = 0;
  pulseAngle = 0;
  
  spots = new ArrayList<PVector>();
  img = loadImage("rocketlogo.png");
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int index = x + y * img.width;
      color c = img.pixels[index];
      float b = brightness(c);
      if (b > 1) {
        spots.add(new PVector(x,y));
      }
    }
  }
  numSpots = spots.size();
  background(0);
}

void draw() {
  fill(0,150);
  stroke(0);
  rect(0, 0, width, height);

  zoff += zinc;
    for (int x = 0; x < 2500 * pow(sin(pulseAngle) + 1, 2); x++) {
    if (particles.size() < 330000) {
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
    saveFrame("output/output-####.png");
  println(particles.size());

  c = (c + 1) % 255;
  pulseAngle += .07;
}

Particle newParticle() {
  int spot = floor(random(numSpots));
  PVector source = spots.get(spot);
  return new Particle(source.x,source.y, 0, 0, c);
}
