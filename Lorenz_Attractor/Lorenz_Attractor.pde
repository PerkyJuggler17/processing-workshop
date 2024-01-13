import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 8/3.0; // caution!!

float angle = PI/2;

ArrayList<PVector> points1 = new ArrayList<PVector>(); // syntax for arraylist
ArrayList<PVector> points2 = new ArrayList<PVector>(); // syntax for arraylist


PeasyCam cam;

void setup() {
  fullScreen(P3D);
  //size(1500, 900, P3D);
  colorMode(HSB);
  
  cam = new PeasyCam(this, 500);
}

void draw() {
    rotateY(angle);
    rotateZ(PI/4);
    background(0);
    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;
    
    x = x + dx;
    y = y + dy;
    z = z + dz;
    
    points1.add(new PVector(x, y, z));
    points2.add(new PVector(x, y, -z));
    
    //translate(width/2, height/2);
    stroke(255);
    scale(5);
    noFill();
    
    float hu = 0;
    beginShape();
    for (PVector v: points1) {
      stroke(hu, 255, 255);
      vertex(v.x, v.y, v.z);
      hu += 0.1;
      if (hu > 255) {
        hu = 0;
      }
    }
    endShape();
    
        beginShape();
    for (PVector v: points2) {
      stroke(hu, 255, 255);
      vertex(v.x, v.y, v.z);
      hu += 0.1;
      if (hu > 255) {
        hu = 0;
      }
    }
    endShape();
    angle += 0.01;
}
