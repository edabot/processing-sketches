  float xIndex = 0.0;
  float step = .1;
  int boxSize = 20;
  int numBoxes = 40;
  int topMargin, leftMargin;
  int numbers[];
  float zIndex = 0.0;
  
void setup() {
  size(1920, 1080); 
  topMargin = (height - boxSize * numBoxes ) / 2;
  leftMargin = (width - boxSize * numBoxes ) / 2;
}
void draw() {
  zIndex += .005;

  int numbers[] = new int[20];
  for (int i = 0; i < 20; ++i) {
    numbers[i] = 0;
  }
  background(0);
    rectMode(CORNER);  // Set rectMode to CORNERS

  for (int row = 0; row < numBoxes; ++row) {
    for (int col = 0; col < numBoxes; ++col) {
      float noiseVal = noise(row * step, col * step, zIndex);
      int numCounter = floor(noiseVal * 20);
      numbers[numCounter] = numbers[numCounter] + 1;
      //fill(noiseVal * 255);
      fill(111);
      noFill();
      rect(row * boxSize + leftMargin, col * boxSize + topMargin, boxSize, boxSize);
      
      //fill(255);
      //text(noiseVal, row * boxSize + leftMargin, (col+1) * boxSize + topMargin);

      stroke(55);
      fill(noiseVal * 255);
      rect(row * boxSize + leftMargin, col * boxSize + topMargin, boxSize, boxSize);
    }
  }
      fill(100);
  rectMode(CORNERS);  // Set rectMode to CORNERS

  for ( int i = 0; i < 20; ++i) {
    fill(100);
    rect(10 + 10*i, 900, 20 + 10*i, 900 - (numbers[i] * 1.5) );
    fill(i * 255 / 20);
    rect(10 + 10*i, 920, 20 + 10*i, 910 );
  };
}
