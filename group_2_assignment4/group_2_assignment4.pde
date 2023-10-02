sun_moon mySun;

Car1 myCar;
float roadY; // Y-coordinate of the road
float dashLength = 20; // Length of each dash
float dashGap = 10;   // Gap between dashes

void setup() {
    size(400, 400);
    mySun = new sun_moon();
    myCar = new Car1();
    roadY = height / 2 + 50;  // Set the road's Y-coordinate
}

void draw() {
    mySun.move_across_sky();
    mySun.SunAngle += 0.02;
    mySun.display();
    
  // Draw the road
  fill(100); // Set the road color
  rect(0, roadY, width, 100);

  // Draw dashed yellow lines on the road
  stroke(255, 255, 0); // Yellow color
  strokeWeight(3); // Line thickness
  float x = 0;
  while (x < width) {
    line(x, roadY + 50, x + dashLength, roadY + 50); // Adjust the Y-coordinate as needed
    x += dashLength + dashGap;
  }
  stroke(100);
  myCar.move(2);
  myCar.wheel1Angle += 0.05;
  myCar.wheel2Angle += 0.05;
  myCar.display();
}
