void setup() {
  size(600, 700, P3D);
  noiseDetail(2);
  //frameRate(30);
}

void draw() {
  //background(250, 239, 155);
  //background(100, 150, 100);
    background(0);

  
  translate(width/2, height/2, -400);
  rotateX(PI/3);
  //rotateZ(PI/180*frameCount/4);
  //rotateX(map(cos(PI/180*frameCount/4), -1, 1, PI/180*30, -PI/180*30));
  //rotateY(map(sin(PI/180*frameCount/4), -1, 1, -PI/180*30, PI/180*30));
  noStroke();
  
  //directionalLight(255, 255, 255, 0, 0, -1);
  //directionalLight(255, 255, 255, 0, 0, -1);
  
  int w = 5;
  float start = frameCount / (float) 100;
  println(frameRate, start);
  
  float xoff = 0;
  for (int x = -width/2; x <= width/2; x += w) {
    float yoff = 0;
    for (int y = -height/2; y <= height/2; y += w) {
      float h = map(noise(xoff + start, yoff + start), 0, 1, -100, 100);
      float r = map(x, -width/2, width/2, 0, 255);
      float g = map(y, -height/2, height/2, 0, 255);
      float b = map(h, -100, 100, 0, 255);
      
      push();
      fill(r, g, b);
      translate(x, y, h);
      box(w);
      pop();
      yoff += 0.02;
    }
    xoff += 0.02;
  }
}
