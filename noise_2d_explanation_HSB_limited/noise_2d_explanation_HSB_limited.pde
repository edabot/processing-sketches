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
  int leftMargin5 = 1300;
  float currentRow = 0.0;
  float colorCenter = 200;
  int colorRange = 300;

void setup() {
  size(1920, 1080);   
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  currentRow += step;
  background(0);
  stroke(0);
      strokeWeight(1);

  for (int row = -numBoxMargin; row < numBoxMargin; ++row) {
    for (int col = 0; col < numBoxesWide; ++col) {
      float noiseVal = noise(row * step + currentRow, col * step);
      fill(0,0,noiseVal * 100);
      rect(col * boxSize + leftMargin1, (row + numBoxMargin) * boxSize + topMargin1, boxSize, boxSize);
    }
  }
  
    for (int row = -numBoxMargin; row < numBoxMargin; ++row) {
    for (int col = 0; col < numBoxesWide; ++col) {
      float noiseVal = noise(row * step + currentRow + 50, col * step);
      float hue = (colorCenter - (colorRange / 2) + noiseVal * colorRange + 360) % 360;
      color c = color(hue, 100 , 100);
      fill(c);
      rect(col * boxSize + leftMargin2, (row + numBoxMargin) * boxSize + topMargin1, boxSize, boxSize);
    }
  }
  
     for (int row = -numBoxMargin; row < numBoxMargin; ++row) {
    for (int col = 0; col < numBoxesWide; ++col) {
      float noiseVal = noise(row * step + currentRow + 100, col * step);
      color c = color(colorCenter, 100 * noiseVal, 100);
      fill(c);
      rect(col * boxSize + leftMargin3, (row + numBoxMargin) * boxSize + topMargin1, boxSize, boxSize);
    }
  }
    for (int col = 0; col < numBoxesWide; ++col) {
      float noiseVal = noise(currentRow, col * step);
      fill(noiseVal * 100);
       rect(col * boxSize + leftMargin4, topMargin2, boxSize, boxSize);
    }

        for (int col = 0; col < numBoxesWide; ++col) {
      float noiseVal = noise(currentRow + 50, col * step);
            float hue = (colorCenter - (colorRange / 2) + noiseVal * colorRange + 360) % 360;
            color c = color(hue, 100, 100);
      fill(c);
       rect(col * boxSize + leftMargin4, topMargin2 + 50, boxSize, boxSize);
    }
    
    for (int col = 0; col < numBoxesWide; ++col) {
      float noiseValS = noise(currentRow + 100, col * step);
            color c = color(colorCenter, noiseValS*100, 100);
      fill(c);
       rect(col * boxSize + leftMargin4, topMargin2 + 100, boxSize, boxSize);
    }
    
        for (int col = 0; col < numBoxesWide; ++col) {
      float noiseValH = noise(currentRow + 50, col * step);
      float noiseValS = noise(currentRow + 100, col * step);
      float noiseValB = noise(currentRow, col * step);
                  float hue = (colorCenter - (colorRange / 2) + noiseValH * colorRange + 360) % 360;

            color c = color(hue, noiseValS*100, noiseValB*100);
      fill(c);
       rect(col * boxSize + leftMargin4, topMargin2 + 150, boxSize, boxSize);
    }
    
        for (int col = 0; col < numBoxesWide; ++col) {
      float noiseValH = noise(currentRow + 50, col * step);
      float noiseValB = noise(currentRow, col * step);
                        float hue = (colorCenter - (colorRange / 2) + noiseValH * colorRange + 360) % 360;

            color c = color(hue, 100, noiseValB*100);
      fill(c);
       rect(col * boxSize + leftMargin5, topMargin2 + 25, boxSize, boxSize);
    }
    
        for (int col = 0; col < numBoxesWide; ++col) {
      float noiseValH = noise(currentRow + 50, col * step);
      float noiseValS = noise(currentRow + 100, col * step);
                  float hue = (colorCenter - (colorRange / 2) + noiseValH * colorRange + 360) % 360;
            color c = color(hue, noiseValS*100, 100);
      fill(c);
       rect(col * boxSize + leftMargin5, topMargin2 + 75, boxSize, boxSize);
    }
    stroke(color(100, 100, 100));
    strokeWeight(4);
    fill(0,0);
    //rect(leftMargin2, topMargin2, boxSize * numBoxes, boxSize);
    rect(leftMargin1, topMargin2, boxSize * numBoxesWide, boxSize);
    rect(leftMargin2, topMargin2, boxSize * numBoxesWide, boxSize);
    rect(leftMargin3, topMargin2, boxSize * numBoxesWide, boxSize);

    
    delay(50);
}  
