int cols, rows;
int scl = 20;
int w = 1400;
int h = 1000;
float yoff = 0;
float poff = .2;
float poff2 = .2;
float zmult = 150;
int cstart;
  
void setup () {
  size(900,900, P3D);

  cols = w / scl;
  rows = h /scl;

}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  int c = cstart;
  int sb = 0;
  for(int y = 0; y <rows; y++) {
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++) {
      float z1 = noise(x * poff,y *poff2+ yoff) * zmult;
      float z2 = noise(x*poff,(y + 1)*poff2 + yoff) * zmult;
      stroke(sb);
      colorMode(HSB);
      fill(c, sb,sb);
       vertex(x*scl, y*scl, z1);
       vertex(x*scl, (y + 1)*scl, z2);
     //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
    if (c > 5) { 
      c -= 5;
    } else {
      c = 255;
    }
    if (sb <= 249){
      sb += 6;
    }
  }
  cstart = (cstart + 3) % 255;
  yoff -= .01;
  //saveFrame("output/output-####.png");

}
