class Ball {
  
PVector center, pos;
Boolean clockwise;
float angle, radius, speed, size;
int clr, cooloff;
Vortex vortex;
  
 Ball(Vortex v, float r, Boolean cw) {
   vortex = v;
   center = new PVector(v.center.x,v.center.y);
   PVector spoke = new PVector(r,0);
   pos = new PVector(v.center.x,v.center.y).add(spoke);
   clockwise = cw;
   angle = random(0, TWO_PI);
   radius = r;
   speed  = random(.04,.1);
   size = random(20,40);
   clr = int(random(255));
   cooloff = 0;
 }
 
 
 void update() {
   if (clockwise) {
     angle += speed;
   } else {
     angle -= speed;   
   }
   PVector spoke = new PVector(radius, 0);
   spoke.rotate(angle);
   pos = new PVector(center.x, center.y).add(spoke);
   if (cooloff > 0) {
     cooloff--;
   }
   nearbyVortex();
 }
 
 void switchVortex(Vortex v) {
   center = new PVector(v.center.x, v.center.y);
   vortex = v;
   clockwise = !clockwise;
   angle += PI;
   PVector spoke = new PVector(radius, 0);
   spoke.rotate(angle);
 pos = new PVector(center.x, center.y).add(spoke);
   cooloff = 6;
 }
 
 void nearbyVortex() {
   for (Vortex v : vortex.neighbors) {
     if (dist(pos.x, pos.y, v.center.x, v.center.y) < (vSize * .5005) ) {
       if (random(10) > 6 && cooloff == 0) {
         switchVortex(v);
       }
     }
   }
}
 
 void show() {
   colorMode(HSB);
   fill(clr,255,255);
   noStroke();
   ellipse(pos.x, pos.y, size / 2, size / 2);
 }
 
}
