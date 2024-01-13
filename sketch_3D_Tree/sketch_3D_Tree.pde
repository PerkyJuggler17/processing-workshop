void setup() {
  size(600, 600, P3D);
  //noLoop();
}

void draw() {
  println(frameRate);
  background(200);
  
  translate(300, 450, 100);
  
  rotateY(frameCount*PI/50); //map(mouseX, 0, width, 0, TWO_PI)
  
  branch(100);
  randomSeed(1);
}

void branch(float len) {
  strokeWeight(map(len, 10, 100, 0.5, 5));
  stroke(70, 40, 20);
  
  line(0, 0, 0, 0, -len-2, 0);
  
  translate(0, -len, 0);
  
  if (len > 10) {
    float branch = random(3, 5);
    for (int i = 0; i < round(branch); i++) {
      rotateY(random(TWO_PI*5/9, TWO_PI*7/9));
      
      push();
      
      rotateZ(random(HALF_PI*2/9, HALF_PI*5/9));
      branch(len * 0.65);
      
      pop();
    }
  } else {
    float r = 220 + random(-20, 20); // for yellowish tinge (180, 120, 40)
    float g = 120 + random(-20, 20); // for pinkish tinge (220, 120, 80), (220, 120, 170)
    float b = 40 + random(-20, 20); // for greenish tinge (80, 120, 40)
    
    fill(r, g, b, 200);
    noStroke();
    
    translate(5, 0, 0);
    rotateZ(HALF_PI);
    
    beginShape();
    for(int i = 45; i < 135; i++) {
      float rad = 7;
      float x = rad * cos(PI*i/180);
      float y = rad * sin(PI*i/180);
      vertex(x, y);
    }
    for(int i = 135; i < 45; i--) {
      float rad = 7;
      float x = rad * cos(PI*i/180);
      float y = rad * sin(-PI*i/180) + 10;
      vertex(x, y);
    }
    endShape(CLOSE);
  }
}
