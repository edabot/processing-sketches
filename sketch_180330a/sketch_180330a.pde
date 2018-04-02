int zoom;

void setup() {
  size(640, 360, P3D);
  zoom = 0;
  
  
}

void draw() {
    background(0);

    translate(width/2, height/2, -1000);
    zoom++;
    stroke(255);
    rotateX(PI/2);
    rotateZ(-PI/6);
    noFill();

  beginShape();
  vertex(-100, -100, -100 + zoom);
  vertex( 100, -100, -100 + zoom);
  vertex( 100, -100, -100 + zoom);



  endShape();
}
