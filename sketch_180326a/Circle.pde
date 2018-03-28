class Circle{
  float x;
  float y;
  float r;
  boolean growing = true;
  int color;

  Circle(float x_, float y_) {
    x = x_;
    y = y_;
    r = 2;
    color = int(random(360));
  }
  
  void grow() {
    if (growing) {
      r+= .5;
    }
  }
  
  boolean edges() {
    return (x + r > width || x - r < 0 || y + r > height || y - r < 0);
  }
  
  void show() {
    colorMode(HSB);
    stroke(color);
    strokeWeight(2);
    noFill();
    ellipse(x,y, r*2, r*2);
  }
}
