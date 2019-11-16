
class Burst {
  PVector center;
  int size, clr;
  ArrayList<Particle> particles;

  Burst(float x, float y, int s) {
    center = new PVector(x, y);
    size = s;
    clr = int(random(255));
    particles = new ArrayList<Particle>();
    for (int p = 0; p < 5000; p++) {
      Particle newP = newParticle(center, clr, size);
      particles.add(newP);
    }
  }
  
  void update() {
    for (int i = 0; i < particles.size(); i++) {
      Particle particle = particles.get(i);
      if (particle.finished()) {
        particles.remove(i);
      }
      particle.update();
      particle.show();
    }
  }
  
  boolean finished() {
    return (particles.size() <= 10);
  }
}

Particle newParticle(PVector center, int clr, int size) {
  float angle = random(0, TWO_PI);
  PVector v = new PVector(0, 0);
  PVector dv = new PVector(1, 0);
  //v.rotate(angle);
  dv.rotate(angle);
  return new Particle(v.x + center.x,v.y+center.y, dv.x, dv.y, clr, size);
}
