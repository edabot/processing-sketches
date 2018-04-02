class Target {
  PVector center;
  float thickness;
  Target(float x, float y, float s) {
   center = new PVector(x,y);
   thickness = s / 9;
   }
 
 void show() {
   noStroke();
      fill(255);
   ellipse(center.x, center.y, 9 * thickness, 9 * thickness);
   fill(0);
   ellipse(center.x, center.y, 7 * thickness, 7 * thickness);
   fill(255);
   ellipse(center.x, center.y, 5 * thickness, 5 * thickness);
   fill(0);
   ellipse(center.x, center.y, 3 * thickness, 3 * thickness);
   fill(255);
   ellipse(center.x, center.y, thickness, thickness);
      
 }
}
