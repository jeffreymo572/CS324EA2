class Droplet{
  PVector position;
  float velocity;
  float gravity;
  Droplet originalState;
  
  Droplet() {
    position = new PVector();
    velocity = 0;
    gravity = 0.3;
  }
  
  boolean offScreen() {
    if (position.y > height) {
      return true;
    }
    
    return false;
  }
  
  void push() {
    originalState = new Droplet();
    originalState.position = position.copy();
    originalState.velocity = velocity;
  }
  
  void update() {
    position.y += velocity;
    velocity += gravity;
    if (originalState != null && position.y > height) {
      position = originalState.position.copy();
      velocity = originalState.velocity;
    }
  }
  
  void draw() {
    update();
    
    PVector p = position.copy();
    pushStyle();
    stroke(255);
    line(p.x, p.y, p.x, p.y-10);
    popStyle();
  }
}
