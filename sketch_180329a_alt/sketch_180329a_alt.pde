ArrayList<Burst> bursts;
ArrayList<PVector> flowField;
int interval, countdown, inc;
int rows, cols, zone_size;
float zoff, zinc, fieldInc, intensity;

void setup() {
  size(900,900, P3D);
  bursts = new ArrayList<Burst>();
  flowField = new ArrayList<PVector>();
  Burst newB = newBurst();
  bursts.add(newB);
  interval = 30;
  countdown = 120;
  inc = 0;
  zone_size = 5;
  intensity = 70;
  rows = height / zone_size;
  cols = width / zone_size;
  zoff = .001;
  zinc = .005;
  fieldInc = .005;
}

void draw() {
  colorMode(RGB);
    stroke(255);
    noFill();
    rotateX(noise(zoff*10)* (PI/2) - PI/4);
    rotateY(noise(zoff *10+ 1000) * (PI/2) - PI/4);
  fill(0);
  stroke(0);
  background(0);
 
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      float angle = noise(x * fieldInc, y * fieldInc, zoff) * PI;
      PVector v = new PVector(.2, 0);
      v.rotate(angle);
      flowField.add(v);
    }
  }
  
  if (countdown <= 0) {
    Burst newB = newBurst();
    bursts.add(newB);
    countdown = int(noise(inc)*intensity);
  }
  countdown--;
  inc++;
  if (intensity > 1) {
    
    intensity -= .1;
  }
  println(intensity);
  
  for (int i = 0; i < bursts.size(); i++) {
    Burst burst = bursts.get(i);

    burst.update();
    if (burst.finished()) {
      bursts.remove(i);
    }
  }
  saveFrame("output/output-####.png");

}

Burst newBurst() {
  float x = random(100, width - 100);
  float y = random(100, height - 100);
  return new Burst(x , y, int(random(10,50)));
}
