  float step = .1;
  
  int startIndex = 0;
  int range = 20;
  float currentRow = 0.0;

  int numBoxes = 20;
  int boxSize = 30;
  int columnWidth = numBoxes * boxSize;
  
  int gap = 500;

  int leftMargin = 300;
  int topMargin = 200;

  int zIndex = 10;
  int zSpeed = 10;
  
  float rotation = PI/3;

void setup() {
  size(1920, 1080, P3D);   
}

void draw() {
  zIndex += zSpeed;
  background(0);
  stroke(0);
  strokeWeight(1);
  rotateY(rotation);

  translate(columnWidth/2,0, -6000 + zIndex);
  int   count = 0;
  if (rotation > 0) {
    
  rotation -= .01;
  }
  for (int i = startIndex; i < startIndex + range; ++i) {
      translate(0,0,gap);

    int location = -6000 + gap * i + zIndex;
    if (location < 1000 && location > -2500){
    drawNoiseColumn(i * step);
    count++;
    }
    println(count);
  }
  
  delay(50);
}  

void drawNoiseColumn(float z) {
    
  for (int row = 0; row < numBoxes; ++row) {
    for (int col = 0; col < numBoxes; ++col) {
      float noiseValB = noise(row * step + currentRow, col * step, z);
      fill(noiseValB * 255);
      rect(col * boxSize + leftMargin, row * boxSize + topMargin, boxSize, boxSize);
    }  
  }

}
