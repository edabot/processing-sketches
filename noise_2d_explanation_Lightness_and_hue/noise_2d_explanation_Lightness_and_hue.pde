  float xIndex = 0.0;
  float step = .1;
  int numBoxMargin = 30;
  int numBoxes = numBoxMargin * 2 + 1;
  int numBoxesWide = 20;
  float boxSize = 800 / numBoxes;
  int topMargin1 = 100;
  int leftMargin1 = 100;
  int topMargin2 = 500;
  int leftMargin2 = 400;
  int leftMargin3 = 700;
  int leftMargin4 = 1000;
  float currentRow = 0.0;

void setup() {
  size(1920, 1080);   
  colorMode(HSB);
}

void draw() {
  currentRow += step;
  background(0);
  stroke(0);
      strokeWeight(1);

  for (int row = -numBoxMargin; row < numBoxMargin; ++row) {
    for (int col = 0; col < numBoxesWide; ++col) {
      float noiseVal = noise(row * step + currentRow, col * step);
      fill(noiseVal * 255);
      rect(col * boxSize + leftMargin1, (row + numBoxMargin) * boxSize + topMargin1, boxSize, boxSize);
    }
  }
  
    for (int row = -numBoxMargin; row < numBoxMargin; ++row) {
    for (int col = 0; col < numBoxesWide; ++col) {
      float noiseVal = noise(row * step + currentRow + 50, col * step);
      color c = color(noiseVal * 360, 255, 255);
      fill(c);
      rect(col * boxSize + leftMargin2, (row + numBoxMargin) * boxSize + topMargin1, boxSize, boxSize);
    }
  }
  
     for (int row = -numBoxMargin; row < numBoxMargin; ++row) {
    for (int col = 0; col < numBoxesWide; ++col) {
      float noiseVal = noise(row * step + currentRow + 100, col * step);
      color c = color(200, 255 * noiseVal, 255);
      fill(c);
      rect(col * boxSize + leftMargin3, (row + numBoxMargin) * boxSize + topMargin1, boxSize, boxSize);
    }
  }
    for (int col = 0; col < numBoxesWide; ++col) {
      float noiseVal = noise(currentRow, col * step);
      fill(noiseVal * 255);
       rect(col * boxSize + leftMargin4, topMargin2, boxSize, boxSize);
    }

        for (int col = 0; col < numBoxesWide; ++col) {
      float noiseVal = noise(currentRow + 50, col * step);
            color c = color(noiseVal * 360, 255, 255);
      fill(c);
       rect(col * boxSize + leftMargin4, topMargin2 + 50, boxSize, boxSize);
    }
    
    for (int col = 0; col < numBoxesWide; ++col) {
      float noiseValH = noise(currentRow + 50, col * step);
      float noiseValB = noise(currentRow, col * step);
            color c = color(noiseValH * 360, 255, noiseValB*255);
      fill(c);
       rect(col * boxSize + leftMargin4, topMargin2 + 100, boxSize, boxSize);
    }
    
        for (int col = 0; col < numBoxesWide; ++col) {
      float noiseValH = noise(currentRow + 50, col * step);
      float noiseValS = noise(currentRow + 100, col * step);
      float noiseValB = noise(currentRow, col * step);
            color c = color(noiseValH * 360, noiseValS*255, noiseValB*255);
      fill(c);
       rect(col * boxSize + leftMargin4, topMargin2 + 150, boxSize, boxSize);
    }
    stroke(color(100, 255, 255));
    strokeWeight(4);
    fill(0,0);
    //rect(leftMargin2, topMargin2, boxSize * numBoxes, boxSize);
    rect(leftMargin1, topMargin2, boxSize * numBoxesWide, boxSize);
    rect(leftMargin2, topMargin2, boxSize * numBoxesWide, boxSize);
    rect(leftMargin3, topMargin2, boxSize * numBoxesWide, boxSize);

    
    delay(50);
}  
