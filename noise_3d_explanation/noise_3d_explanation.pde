  float step = .1;
  float stepRamp = .01;
  
  int startIndex = 0;
  int range = 2000;
  float currentRow = 0.0;

  int numBoxes = 20;
  int boxSize = 30;
  int columnWidth = numBoxes * boxSize;
  
  int gap = 500;
  int spread = range * gap;
  int origin = 1000 - (range - 1) * gap;

  int leftMargin = 300;
  int topMargin = 200;

  int zIndex = 10;
  int zSpeed = 10;
  float topZ = 0.0;
  float nextZ;
  
  float rotation = PI/3;
  int cameraZ = 0;
  int countdown = 100;

void setup() {
  size(1920, 1080, P3D);   
}

void draw() {
  zIndex += zSpeed;
  --countdown;
  background(0);
  stroke(0);
  strokeWeight(1);


  int count = 0;
  if (rotation > 0 && countdown < 0) {
    rotation -= .01;
    cameraZ -= 10;
  }  
  if (rotation <= 0 && zSpeed < 50) {
    zSpeed += 1;
  }
  translate(0,0,cameraZ);
  rotateY(rotation);

if ( rotation > 0 ) {
  
  for (int i = 0; i < range; ++i) {
    int location =  gap * i + zIndex + origin;
    if (location < 1000 && location > 1000 - gap * 20){
     pushMatrix();
     translate(columnWidth/2,0, location);
     drawNoiseColumn(i * step);
     popMatrix();
      count++;
    }
    if (location > 1000 && location < 1000 + gap){
      topZ = i * step;
    }
    println(count);
  }
  
} else {
  topZ += stepRamp;
  if (stepRamp < step) {
    stepRamp += .0002;
  }
}
 
     pushMatrix();
     translate(columnWidth/2,0, 1000);
     drawNoiseColumn(topZ);
     popMatrix();

  delay(20);
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
