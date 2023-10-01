// Rain Cloud Simulation
// (255, 255, 255)
// (0, 191, 255): background

ArrayList<Cloud> clouds = new ArrayList<Cloud>();
float numClouds;

void setup() {
  size(400, 400);
  numClouds = 10;
}

void draw() {
  background(0, 191, 255);
  if (!clouds.isEmpty()) {
    for (Cloud c: clouds){
      c.draw();
    }
  } else {
    textSize(22);
    textAlign(CENTER);
    text("CLICK TO BEGIN", width/2, height/2);
  }
}

void mousePressed() {
  float increment = width / numClouds;
  // Reset function
  // Cloud(position, rain_intensity, cloudSpeed)
  for (int i = 0; i < width; i+=increment){
    clouds.add(new Cloud(new PVector(i, random(30, 70)), 10, 10));
  }
}
