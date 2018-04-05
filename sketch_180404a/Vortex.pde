class Vortex {
  PVector center;
  ArrayList<Vortex> neighbors;
  float size;
  
  Vortex(float x, float y, float s) {
    center = new PVector(x,y);
    neighbors = new ArrayList<Vortex>();
    size = s;
  }
  
  void add(Vortex n) {
    neighbors.add(n);
  }
  
  void show() {
   fill(40);
   ellipse(center.x, center.y, size / 2,size /2);
  }
  
}
