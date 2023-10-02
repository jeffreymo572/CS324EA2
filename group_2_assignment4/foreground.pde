class Car1 {
  PShape carGroup;
  PShape carBody;
  PShape wheelsGroup;
  PShape wheel1;
  PShape wheel2;
  PShape windows1;
  PShape windows2;
  float x;
  float y;
  color carColor;
  float wheel1Angle = 0;
  float wheel2Angle = 0;
  PShape wheel3;
  PShape wheel4;

  Car1() {
    carGroup = createShape(GROUP);
    carBody = createShape(); // Create car body
    carBody.beginShape();
    carBody.vertex(-45, -10);
    carBody.vertex(-25, -10);
    carBody.vertex(-25, -30);
    carBody.vertex(-25, -30);
    carBody.vertex(20, -30);
    carBody.vertex(20, -10);
    carBody.vertex(35, -10);
    carBody.vertex(55, 10);
    carBody.vertex(-55, 10);
    carBody.endShape(CLOSE);
    carGroup.addChild(carBody);
    randomizeColor();
    fill(0);

    wheelsGroup = createShape(GROUP); // Create the wheels
    wheel1 = createShape(ELLIPSE, -20, 10, 20, 20);
    wheelsGroup.addChild(wheel1);
    wheel2 = createShape(ELLIPSE, 20, 10, 20, 20);
    wheelsGroup.addChild(wheel2);

    windows1 = createShape(RECT, -20, -25, 15, 15); // Create the windows
    windows1.setFill(color(0));
    carGroup.addChild(windows1);
    windows2 = createShape(RECT, 0, -25, 15, 15);
    windows2.setFill(color(0));
    carGroup.addChild(windows2);
    fill(255);
    carGroup.addChild(wheelsGroup);
    y = height / 2 + 100;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    shape(carGroup); // Draw the car body and windows

    pushMatrix();
    translate(-20, 10);
    rotate(wheel1Angle);
    for (int i = 0; i < 6; i++) { // Create a rotating pattern of larger ellipses
      float angle = radians(i * 60);
      float X1 = cos(angle) * 10;
      float Y1 = sin(angle) * 10;
      fill(255);
      ellipse(X1, Y1, 5, 5);
    }
    popMatrix();

    pushMatrix();
    translate(20, 10);
    rotate(wheel2Angle);
    for (int i = 0; i < 6; i++) {
      float angle = radians(i * 60);
      float X2 = cos(angle) * 10;
      float Y2 = sin(angle) * 10;
      fill(255);
      ellipse(X2, Y2, 5, 5);
    }
    popMatrix();

    popMatrix();
  }

  void move(float speed) {
    x += speed;
    if (x > width + 50) {
      x = -50;
      randomizeColor();
    }
  }

  void randomizeColor() {
    carColor = color(random(150, 255), random(150, 255), random(150, 255));
    carBody.setFill(carColor);
  }
}
