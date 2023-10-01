class Cloud {
  PVector position;
  ArrayList<Drop> drops;
  boolean spawning = true;
  float w;
  float h;
  Circle[] circles;
  Circle c1;
  Circle c2;
  Circle c3;
  Circle c4;
  Circle c5;
  // Rain settings
  float rainIntensity = 10;
  // Cloud speed
  float cloudSpeed;
  color c = color(200, 200, 200);

  Cloud(PVector pos, float rainIntensity, float cloudSpeed) {
    // Rain cloud settings
    this.position = pos;
    w = 130;
    h = 20;
    this.c = color(255-rainIntensity*15);
    // Rain/drop settings
    drops = new ArrayList<Drop>();
    this.rainIntensity = constrain(rainIntensity, 0, 100)*10;
    // Constraining cloud speed
    this.cloudSpeed = constrain(cloudSpeed, 0, 10)/10;
    
    // Creating cloud
    circles = new Circle[5];
    // Red
    this.c1 = new Circle(this.position.x-w/2-random(1), this.position.y+h+3, 20+random(3), this.c);
    circles[0] = this.c1;
    // Green
    this.c2 = new Circle(this.position.x-w/4, this.position.y+h-7, 30+random(5), this.c);
    circles[1] = this.c2;
    // Blue
    this.c3 = new Circle(this.position.x+w/8, this.position.y+h-17, 40+random(6), this.c);
    circles[2] = this.c3;
    // Yellow
    this.c4 = new Circle(this.position.x+(w/6*3)-10, this.position.y+h/2, 10+random(10), this.c);
    circles[3] = this.c4;
    // Cyan
    this.c5 = new Circle(this.position.x+w/2, this.position.y+(h)+8, 3*h/4+random(5), this.c);
    circles[4] = this.c5;
  }

  void spawnDrop() {
    if (!(drops.size() >= this.rainIntensity*10)){
      Drop d = new Drop();
      d.hvelocity = cloudSpeed;
      d.position = PVector.add(this.position, new PVector(random(-65, 65), random(15, 20)));
      d.push();
      drops.add(d);
    }
  }

  void drawDrops() {
    // If drop is off screen, do not continue rendering them
    for (Drop d : drops) {
      if (d.offScreen() && spawning) {
        spawning = false;
        break;
      }
    }
    // Spawns the drop
    if (spawning) {
      spawnDrop();
    }
    // Draw
    for (Drop d : drops) {
      d.draw();
    }
  }

  void draw() {
    this.position.x += cloudSpeed;
    pushStyle();
    drawDrops();
    fill(this.c);
    stroke(this.c);
    rectMode(CENTER);
    rect(this.position.x+cloudSpeed, this.position.y+30, w, h);
    for (int i = 0; i < circles.length; i++) {
      circles[i].x += cloudSpeed;
      circles[i].draw();
      // Infinite loop
      if (this.position.x-w >= width){
        this.position.x = 0;
        circles[0] = new Circle(this.position.x-w/2-random(1), this.position.y+h+3, 20+random(3), this.c);
        circles[1] = new Circle(this.position.x-w/4, this.position.y+h-7, 30+random(5), this.c);
        circles[2] = new Circle(this.position.x+w/8, this.position.y+h-17, 40+random(6), this.c);
        circles[3] = new Circle(this.position.x+(w/6*3)-10, this.position.y+h/2, 10+random(10), this.c);
        circles[4] = new Circle(this.position.x+w/2, this.position.y+(h)+8, 3*h/4+random(5), this.c);
      }
    }
    popStyle();
  }
}

class Circle {
  float x, y, r;
  color c;

  Circle(float x, float y, float r, color c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
  }

  void draw() {
    pushStyle();
    fill(this.c);
    stroke(c);
    ellipse(x, y, r*2, r*2);
    popStyle();
  }
}
