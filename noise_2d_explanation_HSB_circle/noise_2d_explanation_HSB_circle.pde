float xIndex = 0.0;
float step = .2;
int topMargin1 = 100;
int leftMargin1 = 100;
int topMargin2 = 500;
int leftMargin2 = 700;
int leftMargin3 = 1300;
int leftMargin4 = 1000;
int leftMargin5 = 1300;
float currentRow = 0.0;
int colorCenter = 200;
int colorRange = 300;
int LEDCount = 32;
int xCoords[] = new int[LEDCount];
int yCoords[] = new int[LEDCount];
float angle = TWO_PI / LEDCount;
int radius = round(LEDCount / PI);
int diameter = 2 * radius + 1;
float boxSize = 500 / diameter;
float zIndex = 0;
float zStep = .03;

void setup()
{
  size(1920, 1080);
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < LEDCount; ++i)
  {
    xCoords[i] = round((cos(angle * i)+ 1) * radius );
    yCoords[i] = round((sin(angle * i) + 1)* radius );
  }
}
void draw()
{
  zIndex += zStep;
  colorCenter = (colorCenter + 1) % 360;
  background(0);
  stroke(0);
  strokeWeight(1);

  //light
  for (int row = 0; row < diameter; ++row)
  {
    for (int col = 0; col < diameter; ++col)
    {
      float noiseVal = noise(col * step, row * step, zIndex);
      fill(0, 0, noiseVal * 100);
      rect(col * boxSize + leftMargin1, row * boxSize + topMargin1, boxSize, boxSize);
    }
  }
  for (int i = 0; i < LEDCount; ++i) {
    float noiseVal = noise(xCoords[i] * step, yCoords[i] * step, zIndex);
    fill(0, 0, noiseVal * 100);
    rect(xCoords[i] * boxSize + leftMargin1, yCoords[i] * boxSize + topMargin1, boxSize, boxSize);
  }
  //hue
  for (int row = 0; row < diameter; ++row)
  {
    for (int col = 0; col < diameter; ++col)
    {
      float noiseVal = noise(col * step, row * step + 50, zIndex);
      float hue = (colorCenter - (colorRange / 2) + noiseVal * colorRange + 360) % 360;
      color c = color(hue, 100, 100);
      fill(c);
      rect(col * boxSize + leftMargin2, row * boxSize + topMargin1, boxSize, boxSize);
    }
  }
  // //saturation
  for (int row = 0; row < diameter; ++row)
  {
    for (int col = 0; col < diameter; ++col)
    {
      float noiseVal = noise(col * step, row * step + 100, zIndex);
      color c = color(colorCenter, 100 * noiseVal, 100);
      fill(c);
      rect(col * boxSize + leftMargin3, row * boxSize + topMargin1, boxSize, boxSize);
    }
  }
  
  delay(50);
}
