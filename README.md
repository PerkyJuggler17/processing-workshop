# processing-workshop
Here I dumped everything that I talked about in the Processing Workshop organised by The Turing Club IISERM.

# Welcome to Processing !!

## If you want to know more about the theories,

- [Attractor](https://en.wikipedia.org/wiki/Attractor#:~:text=In%20the%20mathematical%20field%20of,close%20even%20if%20slightly%20disturbed.)
- [Multiscroll Attractor](https://en.wikipedia.org/wiki/Multiscroll_attractor)
- [Strange Attractors](https://www.dynamicmath.xyz/strange-attractors/)
- [Lorenz System](https://en.wikipedia.org/wiki/Lorenz_system)
- You should know about [Clifford attractors](https://rf.mokslasplius.lt/clifford-attractor/) and try to simulate them.

## Other links I used,

- Documentation of [P3D](https://processing.org/tutorials/p3d), [PVectors](https://processing.org/reference/PVector.html) and [peasycam](https://mrfeinberg.com/peasycam/)
- What is [Delta Time](https://en.wikipedia.org/wiki/Delta_timing)
- Delta Time based [Animations](https://www.viget.com/articles/time-based-animation/)
- [HSB](https://kdoore.gitbook.io/cs1335-java-and-processing/getting-started/hsb_color_mode) Colour Mode

## Examples I used,

- [Flow Field Exp.1](https://openprocessing.org/sketch/1639225)
- [Colourful Turbulance](https://openprocessing.org/sketch/1943093)
- [Pattern produced by trace of particle](https://openprocessing.org/sketch/725100)
- [Attractors](https://openprocessing.org/sketch/1914679)
- [Lorenz Attractor](https://openprocessing.org/sketch/1970239)
- [Lorenz Attractor](https://openprocessing.org/sketch/1416179)(the p5.js sketch is different.)
- [Lorenz Attractor](https://openprocessing.org/sketch/952090)(another one with the same name !!)
- [Attractors 5](https://openprocessing.org/sketch/903024)
- [Attractors 3](https://openprocessing.org/sketch/903017)
- [Attractors hotpoints](https://openprocessing.org/sketch/657129)
- [Mandelbrot Set Attractors](https://openprocessing.org/sketch/77478)(In case you want to know about [Mandelbrot Set](https://en.wikipedia.org/wiki/Mandelbrot_set))
- [Clifford Attractors](https://openprocessing.org/sketch/1752165)

## Don't Mind !! Some Extra Links

- [Learn Processing from Daniel Shiffman](https://www.youtube.com/@TheCodingTrain/search?query=processing%20tutorial)
- [The Nature of Code explained with processing](https://www.youtube.com/playlist?list=PLRqwX-V7Uu6aFlwukCmDf0-1-uSR7mklK)
- Explore the [The Coding Train](https://www.youtube.com/@TheCodingTrain) youtube channel for a lot of exciting stuff.

## Some other projects with P3D

- [3D Terran](sketch_3D_Terran)
- [Tesseract](Tesseract)
- [3D Tree](sketch_3D_Tree)
---
## Enough talking !! Let's code Butterfly Effect !!

- ### [Video by Daniel Shiffman](https://www.youtube.com/watch?v=f0lkz2gSsIk) from where I took this code.
- ### The complete code is [here](Lorenz_Attractor).
### Workflow

- Make a canvas with black background.
```float x = 0.01;
float y = 0;
float z = 0;

void setup() {
    size(1500, 900);
    background(0);
}

void draw() {

}
```

- Implementing the differential equations.
- Adding dx, dy, dz as increments.
- Talk about the time steps dt. (why so small !!)
```
float x = 0.01;
float y = 0;
float z = 0;

void setup() {
    size(1500, 900);
    background(0);
}

void draw() {
    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;
}
```

- adding the increments with the actual value.
```
float x = 0.01;
float y = 0;
float z = 0;

void setup() {
    size(1500, 900);
    background(0);
}

void draw() {
    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;
}
```

- Adding the constants of the differential equation.
- And putting their values specified for the lorenz attractor.
```float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

void setup() {
    size(1500, 900);
    background(0);
}

void draw() {
    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    println(x, y, z); // quick check.
}
```

- Translate to the center of the window. `translate(width/2, height/2);`
- Draw the points to check if it is working.
```float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

void setup() {
    size(1500, 900);
    background(0);
}

void draw() {
    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    translate(width/2, height/2);
    stroke(255);
    point(x, y);
}
```

- Now let's work in 3D !! `size(1500, 900, P3D);`
```
float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

void setup() {
    size(1500, 900, P3D);
    background(0);
}

void draw() {
    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    translate(width/2, height/2);
    stroke(255);
    point(x, y, z);
}
```

- Can't see much of it. We have to scale up.
```float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

void setup() {
    size(1500, 900, P3D);
    background(0);
}

void draw() {
    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    translate(width/2, height/2);
    scale(5);
    stroke(255);
    point(x, y, z);
}
```

- I am drawing single point per frame. But how do I see multiple points !! Look !! the background is 0 mentioned in setup. So nothing is getting erased. if we put it in draw. we will see a single point.
```float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

void setup() {
    size(1500, 900, P3D);
}

void draw() {
    background(0);

    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    translate(width/2, height/2);
    scale(5);
    stroke(255);
    point(x, y, z);
}
```

- But this won't work much. Because we are not storing the points of our figure to further work with.
- Lets do that !! Introduce Array !!
```float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

ArrayList<PVector> points = new ArrayList<PVector>(); // syntax for arraylist

void setup() {
    size(1500, 900, P3D);
}

void draw() {
    background(0);

    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    translate(width/2, height/2);
    scale(5);
    stroke(255);
    point(x, y, z);
}
```

- This is an array without specifying the the length in prior. Analogous to a 'List' in python. Flexibly Sized.
- We have more sophisticated (faster) versions like C or C++.
```int[] anyArray = new int[5]; // 1d arrays

float[][] m = new float[4][1]; // 2d arrays
m[0][0] = v.x;
m[1][0] = v.y;
m[2][0] = v.z;
m[3][0] = v.w;
```

- We are going to add the points in the array as PVectors. (What the heck is this now !!)
- [PVector](https://processing.org/reference/PVector.html) is an object to define vectors in Processing. It is a regular vector that we understand in physics. The advantage is they have all the vector operations built in in processing.
```float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

ArrayList<PVector> points = new ArrayList<PVector>(); // syntax for arraylist

void setup() {
    size(1500, 900, P3D);
}

void draw() {
    background(0);

    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    points.add(new PVector(x, y, z));

    translate(width/2, height/2);
    scale(5);
    stroke(255);
    point(x, y, z);
}
```

- We can draw all the points again with a for loop.
```float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

ArrayList<PVector> points = new ArrayList<PVector>(); // syntax for arraylist

void setup() {
    size(1500, 900, P3D);
}

void draw() {
    background(0);

    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    points.add(new PVector(x, y, z));

    translate(width/2, height/2);
    scale(5);
    stroke(255);

    for (PVector v : points) { // called enhanced loop in java
        point(v.x, v.y, v.z);
    }
}
```

- Let's connect all the points with a line. (Making our own shape) `beginShape()`, `endShape()`, `vertex`.
```float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

ArrayList<PVector> points = new ArrayList<PVector>(); // syntax for arraylist

void setup() {
    size(1500, 900, P3D);
}

void draw() {
    background(0);

    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    points.add(new PVector(x, y, z));

    translate(width/2, height/2);
    scale(5);
    stroke(255);

    beginShape();
    for (PVector v : points) { // called enhanced loop in java
        vertex(v.x, v.y, v.z);
    }
    endShape();
}
```

- Opps !! we have to do `noFill();`
```float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

ArrayList<PVector> points = new ArrayList<PVector>(); // syntax for arraylist

void setup() {
    size(1500, 900, P3D);
}

void draw() {
    background(0);

    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    points.add(new PVector(x, y, z));

    translate(width/2, height/2);
    scale(5);
    stroke(255);
    noFill();

    beginShape();
    for (PVector v : points) { // called enhanced loop in java
        vertex(v.x, v.y, v.z);
    }
    endShape();
}
```

- Lets make it colourful. Introduction to `colorMode(HSB)`. Hue, saturation, Brightness.
```float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

ArrayList<PVector> points = new ArrayList<PVector>(); // syntax for arraylist

void setup() {
    size(1500, 900, P3D);
    colorMode(HSB);
}

void draw() {
    background(0);

    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    points.add(new PVector(x, y, z));

    translate(width/2, height/2);
    scale(5);
    stroke(255);
    noFill();

    float hu = 0;
    beginShape();
    for (PVector v : points) { // called enhanced loop in java
        stroke(hu, 255, 255);
        vertex(v.x, v.y, v.z);
        hu += 0.1;
        if (hu > 255) { // resetting it to 0
            hu = 0;
        }
    }
    endShape();
}
```

- Introduce [peasycam](https://mrfeinberg.com/peasycam/) for easy mouse rotation.
```import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

ArrayList<PVector> points = new ArrayList<PVector>(); // syntax for arraylist

PeasyCam cam; // declaring the camera object

void setup() {
    size(1500, 900, P3D);
    colorMode(HSB);
    cam = new PeasyCam(this, 500);
}

void draw() {
    background(0);

    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;

    x = x + dx;
    y = y + dy;
    z = z + dz;

    points.add(new PVector(x, y, z));

    // translate(width/2, height/2); // do not translate. Because it takes origin at the center of the screen.
    scale(5);
    stroke(255);
    noFill();

    float hu = 0;
    beginShape();
    for (PVector v : points) { // called enhanced loop in java
        stroke(hu, 255, 255);
        vertex(v.x, v.y, v.z);
        hu += 0.1;
        if (hu > 255) { // resetting it to 0
            hu = 0;
        }
    }
    endShape();
}
```

- But its not looking like a butterfly yet. Lets make it that way.
```import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

ArrayList<PVector> points1 = new ArrayList<PVector>(); // syntax for arraylist
ArrayList<PVector> points2 = new ArrayList<PVector>(); // syntax for arraylist


PeasyCam cam; // declaring the camera object

void setup() {
    size(1500, 900, P3D);
    colorMode(HSB);
    cam = new PeasyCam(this, 500);
}

void draw() {
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

    // translate(width/2, height/2); // do not translate. Because it takes origin at the center of the screen.
    scale(5);
    stroke(255);
    noFill();

    float hu = 0;
    beginShape();
    for (PVector v : points1) { // called enhanced loop in java
        stroke(hu, 255, 255);
        vertex(v.x, v.y, v.z);
        hu += 0.1;
        if (hu > 255) { // resetting it to 0
            hu = 0;
        }
    }
    endShape();

    beginShape();
    for (PVector v : points2) { // called enhanced loop in java
        stroke(hu, 255, 255);
        vertex(v.x, v.y, v.z);
        hu += 0.1;
        if (hu > 255) { // resetting it to 0
            hu = 0;
        }
    }
    endShape();
}
```

- Rotate properly to align.
- Fullscreen.
```import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = (float) 8/3; // caution!!

ArrayList<PVector> points1 = new ArrayList<PVector>(); // syntax for arraylist
ArrayList<PVector> points2 = new ArrayList<PVector>(); // syntax for arraylist


PeasyCam cam; // declaring the camera object

void setup() {
    // size(1500, 900, P3D);
    fullScreen(P3D);
    colorMode(HSB);
    cam = new PeasyCam(this, 500);
}

void draw() {
    rotateY(PI/2);
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

    // translate(width/2, height/2); // do not translate. Because it takes origin at the center of the screen.
    scale(5);
    stroke(255);
    noFill();

    float hu = 0;
    beginShape();
    for (PVector v : points1) { // called enhanced loop in java
        stroke(hu, 255, 255);
        vertex(v.x, v.y, v.z);
        hu += 0.1;
        if (hu > 255) { // resetting it to 0
            hu = 0;
        }
    }
    endShape();

    beginShape();
    for (PVector v : points2) { // called enhanced loop in java
        stroke(hu, 255, 255);
        vertex(v.x, v.y, v.z);
        hu += 0.1;
        if (hu > 255) { // resetting it to 0
            hu = 0;
        }
    }
    endShape();
}
```

## Enjoy the view !

![](Lorenz_Attractor/Untitled.gif)

Feel free to [contact me](somatamojit@gamil.com) regarding anything :').
