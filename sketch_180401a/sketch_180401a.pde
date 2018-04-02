float offset, size, zoff, zinc;
int rows, cols;

void setup() {
  size(900,900);
  size = 1100;
  rows = int(4 * height / size + 3);
  cols = int(width / size + 1);
  zoff = 0;
  zinc = .02;
}

void draw() {
  background(255);
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      if (row % 2 == 0) {
        offset = 0;
      } else {
        offset = size/2;
      }
      float xoff = noise(row *.1, zoff) * 50;
      float yoff = noise(col * .1, zoff)* 50;
      float soff = noise(row *.1, col *.1, zoff) * size;
      Target target = new Target(col * size + offset + xoff, row * size/4+ yoff - size / 2, size * .5 + soff);
      target.show();
    }
  }
  zoff += zinc;
  if ((frameCount + 1) % 240 == 0) {
    size -= 100;
    rows = int(4 * height / size + 3);
    cols = int(width / size + 1);
  }
  
  if (size < 100) { noLoop(); }
  saveFrame("output/output-####.png");
  println(frameCount);
}
