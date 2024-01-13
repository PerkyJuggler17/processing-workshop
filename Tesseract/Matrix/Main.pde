float angle = 0;

P4Vector[] points = new P4Vector[16];

void settings()
{
  //size(800, 600, P3D);
  fullScreen(P3D);

  points[0] = new P4Vector(-1, -1, -1, 1);
  points[1] = new P4Vector(1, -1, -1, 1);
  points[2] = new P4Vector(1, 1, -1, 1);
  points[3] = new P4Vector(-1, 1, -1, 1);
  points[4] = new P4Vector(-1, -1, 1, 1);
  points[5] = new P4Vector(1, -1, 1, 1);
  points[6] = new P4Vector(1, 1, 1, 1);
  points[7] = new P4Vector(-1, 1, 1, 1);
  points[8] = new P4Vector(-1, -1, -1, -1);
  points[9] = new P4Vector(1, -1, -1, -1);
  points[10] = new P4Vector(1, 1, -1, -1);
  points[11] = new P4Vector(-1, 1, -1, -1);
  points[12] = new P4Vector(-1, -1, 1, -1);
  points[13] = new P4Vector(1, -1, 1, -1);
  points[14] = new P4Vector(1, 1, 1, -1);
  points[15] = new P4Vector(-1, 1, 1, -1);
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  //rotateX(-PI/2);

  PVector[] projected3d = new PVector[16];

  for (int i = 0; i < points.length; i++)
  {
    P4Vector v = points[i];
    stroke(255);
    strokeWeight(16);
    noFill();
    
    float[][] rotationXY =
    {
      {cos(angle), -sin(angle), 0, 0}, 
      {sin(angle), cos(angle), 0, 0}, 
      {0, 0, 1, 0}, 
      {0, 0, 0, 1}
    };
    
    float[][] rotationYZ =
    {
      {1, 0, 0, 0},
      {0, cos(angle), -sin(angle), 0}, 
      {0, sin(angle), cos(angle), 0}, 
      {0, 0, 0, 1}
    };
    
    float[][] rotationXZ =
    {
      {cos(angle), 0, -sin(angle), 0},
      {0, 1, 0, 0}, 
      {sin(angle), 0, cos(angle), 0}, 
      {0, 0, 0, 1}
    };
    
    float[][] rotationXW =
    {
      {cos(angle), 0, 0, -sin(angle)},
      {0, 1, 0, 0},
      {0, 0, 1, 0},
      {sin(angle), 0, 0, cos(angle)}, 
    };
    
    float[][] rotationZW =
    {
      {1, 0, 0, 0},
      {0, 1, 0, 0},
      {0, 0, cos(angle), -sin(angle)},
      {0, 0, sin(angle), cos(angle)}, 
    };
    
    P4Vector rotated = matmul4(rotationXY, v);
    rotated = matmul4(rotationZW, rotated);
    rotated = matmul4(rotationXZ, rotated);


    float distance = 2;
    float w = 1 / (distance - rotated.w);

    float[][] projection =
      {
      {w, 0, 0, 0}, 
      {0, w, 0, 0}, 
      {0, 0, w, 0}
    };

    PVector projected = matmul(projection, rotated);
    projected.mult(100);
    projected3d[i] = projected;

    point(projected.x, projected.y, projected.z);
  }

  // Connecting
  for (int i = 0; i < 4; i++)
  {
    connect(0, i, ((i+1) % 4), projected3d);
    connect(0, i+4, ((i+1) % 4) + 4, projected3d);
    connect(0, i, i+4, projected3d);
  }

  for (int i = 0; i < 4; i++)
  {
    connect(8, i, ((i+1) % 4), projected3d);
    connect(8, i+4, ((i+1) % 4) + 4, projected3d);
    connect(8, i, i+4, projected3d);
  }

  for (int i = 0; i < 8; i++)
  {
    connect(0, i, i+8, projected3d);
  }

  angle += 0.01;
}

void connect(int offset, int i, int j, PVector[] points)
{
  PVector a = points[i + offset];
  PVector b = points[j + offset];
  strokeWeight(1);
  stroke(255);
  line(a.x, a.y, a.z, b.x, b.y, b.z);
}
