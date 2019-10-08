  float xIndex = 0.0;
  float step = .1;
  int boxSize = 40;
  int numBoxes = 21;
  int topMargin1 = 100;
  int leftMargin1 = 100;
  int topMargin2 = 500;
  int leftMargin2 = 1000;
  float currentRow = 0.0;

void setup() {
  size(1920, 1080);   
}

void draw() {
  currentRow += step;
  background(0);
  stroke(0);
      strokeWeight(1);

  for (int row = -10; row < 10; ++row) {
    for (int col = 0; col < numBoxes; ++col) {
      float noiseVal = noise(row * step + currentRow, col * step);
      fill(noiseVal * 255);
      rect(col * boxSize + leftMargin1, (row + 10) * boxSize + topMargin1, boxSize, boxSize);
    }
  }
    for (int col = 0; col < numBoxes; ++col) {
      float noiseVal = noise(currentRow, col * step);
      fill(noiseVal * 255);
       rect(col * boxSize + leftMargin2, topMargin2, boxSize, boxSize);
    }
    
    stroke(color(0, 204, 0));
    strokeWeight(4);
    fill(0,0);
    rect(leftMargin2, topMargin2, boxSize * numBoxes, boxSize);
    rect(leftMargin1, topMargin2, boxSize * numBoxes, boxSize);
    delay(100);
}  
