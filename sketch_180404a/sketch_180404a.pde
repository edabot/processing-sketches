ArrayList<Vortex> vortices;
ArrayList<Ball> balls;
int rows, cols, vorticesCount, vSize, ballCount, hMargin, vMargin, opacity, scale;
int[] sizes = {300, 250, 200, 150, 130, 110, 100, 85, 80, 72, 65, 60, 55, 50, 40, 30, 25, 20 };
int[] counts = {10, 20, 40, 60, 80, 100, 140, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900};
int[] opacities = {55, 65, 75, 85, 95, 105, 115, 125, 135, 145, 155, 165, 175, 185, 195, 205, 215, 225, 235, 245, 245, 245, 245};

void setup() {
  size(800,800, P2D);
  scale = 0;
  changeScale();
}

void draw() {
  fill(0, opacity);
  rect(0,0, width, height);
  for (Ball b : balls) {
    b.update();
    b.show();
  }
  for (Vortex v : vortices) {
    v.show();
  }
  saveFrame("output/output-####.png");

  println(scale);
  if (frameCount % 450 == 0) {
    changeScale();
  }
}

Boolean isValid(int x, int y) {
  if (x >= 0 && x < cols && y >= 0 && y < rows) {
    return true;
  } else {
    return false;
  }
}

void addNeighbors(int x, int y) {
  int index = x + y * cols;
  if (isValid(x - 1, y)) { 
    int nIndex = x - 1 + y * cols;
    vortices.get(index).add(vortices.get(nIndex));
  }
  if (isValid(x + 1, y)) { 
    int nIndex = x + 1 + y * cols;
    vortices.get(index).add(vortices.get(nIndex));
  }
  if (isValid(x, y + 1)) { 
    int nIndex = x + (y + 1) * cols;
    vortices.get(index).add(vortices.get(nIndex));
  }
  if (isValid(x, y - 1)) { 
    int nIndex = x + (y - 1) * cols;
    vortices.get(index).add(vortices.get(nIndex));
  }
}

void changeScale() {
  ballCount = counts[scale];
  opacity = opacities[scale];
  vSize = sizes[scale];
  
  rows = int(height / vSize);
  cols = int(width / vSize);
  hMargin = (width - vSize * cols) / 2;
  vMargin = (height - vSize * rows) / 2;
  vorticesCount = rows * cols;
  vortices = new ArrayList<Vortex>();
  balls = new ArrayList<Ball>();
  
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      float x = col * vSize + vSize / 2 + hMargin;
      float y = row * vSize + vSize / 2 + vMargin;
      vortices.add(new Vortex(x,y, vSize - 20 ));
    }
  }
  
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      addNeighbors(col,row);
    }
  }
  
  for (int i = 0; i < ballCount; i++) {
    int selection = int(random(vorticesCount));
    println(selection);
    balls.add(new Ball(vortices.get(selection), vSize / 2, true));
  }
  
  scale++;
}
