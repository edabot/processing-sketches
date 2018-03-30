ArrayList<Burst> bursts;
ArrayList<PVector> flowField;
int interval, countdown, inc;
int rows, cols, zone_size;
float zoff, zinc, fieldInc;

void setup() {
  size(900,900, P2D);
  bursts = new ArrayList<Burst>();
  flowField = new ArrayList<PVector>();
  Burst newB = newBurst();
  bursts.add(newB);
  interval = 30;
  countdown = 30;
  inc = 0;
  zone_size = 5;
  rows = height / zone_size;
  cols = width / zone_size;
  zoff = .001;
  zinc = .005;
  fieldInc = .005;
}

void draw() {
  colorMode(RGB);
  fill(0,20);
  stroke(0);
  rect(0,0,width, height);
  
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
    countdown = int(noise(inc)*20);
  }
  countdown--;
  inc++;
  
  for (int i = 0; i < bursts.size(); i++) {
    Burst burst = bursts.get(i);

    burst.update();
    if (burst.finished()) {
      bursts.remove(i);
    }
  }
  //saveFrame("output/output-####.png");
  println(frameRate);

}

Burst newBurst() {
  float x = random(100, width - 100);
  float y = random(100, height - 100);
  return new Burst(x , y, int(random(10,50)));
}
