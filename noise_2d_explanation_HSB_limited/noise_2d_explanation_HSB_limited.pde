  float xIndex = 0.0;
  float step = .1;
  int numBoxMargin = 30;
  int numBoxes = numBoxMargin * 2 + 1;
  int numBoxesWide = 20;
  float boxSize = 800 / numBoxes;
  float topMargin1 = 100;
  int leftMargin1 = 100;
  float topMargin2 = 500;
  int leftMargin2 = 400;
  int leftMargin3 = 700;
  int leftMargin4 = 1000;
  int leftMargin5 = 1300;
  float currentRow = 0.0;
  int colorCenter = 180;
  int colorRange = 180;

void setup() {
  size(1920, 1080);   
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  currentRow += step;
  //colorCenter = (colorCenter + 1) % 360;
  background(0);
  stroke(0);
  strokeWeight(1);

  drawNoiseColumn(0,0,-1, leftMargin1);
  drawNoiseColumn(-1,100,100, leftMargin2);
  drawNoiseColumn(250, -1, 100, leftMargin3);

  drawHueRange();

  drawNoiseBar(0, 0 , -1, currentRow, leftMargin4, topMargin2);
  drawNoiseBar(-1, 100, 100, currentRow, leftMargin4, topMargin2 + 50);
  drawNoiseBar(220, -1 , 100, currentRow, leftMargin4, topMargin2 + 100);
  drawNoiseBar(-1, -1 , -1, currentRow, leftMargin4, topMargin2 + 150);
  
  drawNoiseBar(-1, 100 , -1, currentRow, leftMargin5, topMargin2 + 25);
  drawNoiseBar(-1, -1 , 100, currentRow, leftMargin5, topMargin2 + 75);

  drawHighlightBox(leftMargin1);
  drawHighlightBox(leftMargin2);
  drawHighlightBox(leftMargin3);
    
  delay(50);
}  

void drawHighlightBox(int leftMargin) {
  stroke(color(100, 100, 100));
  strokeWeight(4);
  fill(0,0);
  rect(leftMargin, topMargin2, boxSize * numBoxesWide, boxSize);
}

void drawNoiseColumn(int hue, int saturation, int brightness, int leftMargin) {
  for (int row = -numBoxMargin; row < numBoxMargin; ++row) {
    drawNoiseBar(hue, saturation, brightness, row, leftMargin, (row + numBoxMargin) * boxSize + topMargin1);
  }
}

void drawNoiseBar(int hue, int saturation, int brightness, float row, int leftMargin, float topMargin) {
    for (int col = 0; col < numBoxesWide; ++col) {
      float h = hue, s = saturation, b = brightness;
      if ( hue < 0 ) {
        float noiseValH = noise(row * step + currentRow + 50, col * step);
        h = (colorCenter - (colorRange / 2) + noiseValH * colorRange + 360) % 360;
      }
      if ( saturation < 0 ) {
        float noiseValS = noise(row * step + currentRow + 100, col * step);
        s = noiseValS * 100;
      }
      if ( brightness < 0 ) {
        float noiseValB = noise(row * step + currentRow, col * step);
        b = noiseValB * 100;
      }      
      color c = color(h, s, b);
      fill(c);
      rect(col * boxSize + leftMargin, topMargin, boxSize, boxSize);
    }
}

void drawHueRange() {
  float increment = colorRange / (numBoxesWide - 1);
  float start = (colorCenter - (colorRange / 2) + 360) % 360;
  for (int box = 0; box < numBoxesWide; ++box) {
    float hue = (start + box * increment) % 360;
    color c = color(hue, 100, 100);
    fill(c);
    rect(box * boxSize + leftMargin2, 50, boxSize, boxSize);
  }
}
