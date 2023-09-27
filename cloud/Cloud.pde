class Cloud{
  PVector position;
  ArrayList<Droplet> drops;
  float rain = 0;
  float w;
  float h;
  Circle[] circles;
  
  // Base instance
  Cloud(PVector pos){
    w = 130;
    h = 20;
    position = pos;
    drops = new ArrayList<Droplet>();
    // Default circles from simon-tiger
    circles[0] = new Circle(position.x-w/2, position.y+h+3, 20);
    circles[1] = new Circle(position.x-w/4, position.y+h-7, 30);
    circles[2] = new Circle(position.x+w/8, position.y+h-17, 40);
    circles[3] = new Circle(position.x+(w/6*3)-10, position.y+h/2, 10);
    circles[4] = new Circle(position.x+w/2, position.y+(h/3*3)+8, h/4*3);
  }
  
  // Customized instance with randomness
  Cloud(PVector pos, float w, float h){
    position = pos;
    // Circles with randomized radius adapted from simon-tiger
    circles[0] = new Circle(position.x-w/2, position.y+h+3, 20+random(3));
    circles[1] = new Circle(position.x-w/4, position.y+h-7, 30+random(5));
    circles[2] = new Circle(position.x+w/8, position.y+h-17, 40+random(6));
    circles[3] = new Circle(position.x+(w/6*3)-10, position.y+h/2, 10+random(10));
    circles[4] = new Circle(position.x+w/2, position.y+(h/3*3)+8, h/4*3+random(6));
  }
}
