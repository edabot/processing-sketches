  float step = .1;
  float currentRow = 0.0;

  int numBoxMargin = 30;
  int numBoxes = numBoxMargin * 2 + 1;
  int numBoxesWide = 20;
  float boxSize = 800 / numBoxes;

  float topMarginColumn = 100;
  float topMarginMidBar = 500;

  int leftMarginB = 100;
  int leftMarginH = 400;
  int leftMarginS = 700;
  int leftMarginResult1 = 1000;
  int leftMarginResult2 = 1300;
  
  int hueCenter = 180;
  int hueRange = 180;
  boolean hueCycling = true;
  int hueSpeed = 2;

  int saturationMin = 00;
  int saturationMax = 100;

  int brightMin = 0;
  int brightMax = 100;

  int saturationRange = saturationMax - saturationMin;
  int brightRange = brightMax - brightMin;

void setup() {
  size(1920, 1080);   
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  currentRow += step;
  if (hueCycling) {
    hueCenter = (hueCenter + hueSpeed) % 360;
  }
  background(0);
  stroke(0);
  strokeWeight(1);

  drawNoiseColumn(0,0,-1, leftMarginB);
  drawNoiseColumn(-1,100,100, leftMarginH);
  drawNoiseColumn(250, -1, 100, leftMarginS);
 
  drawBrightnessRange();
  drawHueRange();
  drawSaturationRange();

  drawNoiseBar(0, 0 , -1, currentRow, leftMarginResult1, topMarginMidBar);
  drawNoiseBar(-1, 100, 100, currentRow, leftMarginResult1, topMarginMidBar + 50);
  drawNoiseBar(220, -1 , 100, currentRow, leftMarginResult1, topMarginMidBar + 100);
  drawNoiseBar(-1, -1 , -1, currentRow, leftMarginResult1, topMarginMidBar + 150);
  
  drawNoiseBar(-1, 100 , -1, currentRow, leftMarginResult2, topMarginMidBar + 25);
  drawNoiseBar(-1, -1 , 100, currentRow, leftMarginResult2, topMarginMidBar + 75);

  drawHighlightBox(leftMarginB);
  drawHighlightBox(leftMarginH);
  drawHighlightBox(leftMarginS);
    
  delay(50);
}  

void drawHighlightBox(int leftMargin) {
  stroke(color(100, 100, 100));
  strokeWeight(4);
  fill(0,0);
  rect(leftMargin, topMarginMidBar, boxSize * numBoxesWide, boxSize);
}

void drawNoiseColumn(int hue, int saturation, int brightness, int leftMargin) {
  for (int row = -numBoxMargin; row < numBoxMargin; ++row) {
    drawNoiseBar(hue, saturation, brightness, row, leftMargin, (row + numBoxMargin) * boxSize + topMarginColumn);
  }
}

void drawNoiseBar(int hue, int saturation, int brightness, float row, int leftMargin, float topMargin) {
    for (int col = 0; col < numBoxesWide; ++col) {
      float h = hue, s = saturation, b = brightness;
      if ( hue < 0 ) {
        float noiseValH = noise(row * step + currentRow + 50, col * step);
        h = (hueCenter - (hueRange / 2) + noiseValH * hueRange + 360) % 360;
      }
      if ( saturation < 0 ) {
        float noiseValS = noise(row * step + currentRow + 100, col * step);
        s = noiseValS * saturationRange + saturationMin;
      }
      if ( brightness < 0 ) {
        float noiseValB = noise(row * step + currentRow, col * step);
        b = noiseValB * brightRange + brightMin;
      }      
      color c = color(h, s, b);
      fill(c);
      rect(col * boxSize + leftMargin, topMargin, boxSize, boxSize);
    }
}

void drawHueRange() {
  float increment = hueRange / (numBoxesWide - 1);
  float start = (hueCenter - (hueRange / 2) + 360) % 360;
  for (int box = 0; box < numBoxesWide; ++box) {
    float hue = (start + box * increment) % 360;
    color c = color(hue, 100, 100);
    fill(c);
    rect(box * boxSize + leftMarginH, 50, boxSize, boxSize);
  }
}

void drawBrightnessRange() {
  float increment = brightRange / (numBoxesWide - 1);
  for (int box = 0; box < numBoxesWide; ++box) {
    float lightness = brightMin + box * increment;
    color c = color(0, 0, lightness);
    fill(c);
    rect(box * boxSize + leftMarginB, 50, boxSize, boxSize);
  }
}

void drawSaturationRange() {
  float increment = saturationRange / (numBoxesWide - 1);
  for (int box = 0; box < numBoxesWide; ++box) {
    float saturation = saturationMin + box * increment;
    color c = color(250, saturation, 100);
    fill(c);
    rect(box * boxSize + leftMarginS, 50, boxSize, boxSize);
  }
}
