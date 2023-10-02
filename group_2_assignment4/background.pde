class sun_moon {
    PShape SunGroup; // circle + triangles rotating
    PShape SunBody;
    PShape SunTriangles;
    PShape Moon;
    float SunAngle = 0;
    float x;
    float y;
    color bg_day = color(150, 220, 255);
    color bg_night = color(0, 0, 50);
    color bg_sunrise = color(220, 150, 200);
    float time;

    color sunC = color(255, 255, 0);
    color moonC = color(246, 241, 213);

    boolean day = true;

    sun_moon() {
        SunGroup = createShape(GROUP);

        SunBody = createShape(ELLIPSE, 0, 0, 80, 80);

        SunGroup.addChild(SunBody);
        SunBody.setFill(sunC);

        Moon = createShape(ELLIPSE, 0, 0, 60, 60);
        Moon.setFill(moonC);
        Moon.setStroke(moonC);
    }

    void triangle(float v1, float v2, float v3, float v4, float v5, float v6) {
        // add triangles to sun body
        PShape a;
        a = createShape();
        a.setFill(sunC);
        a.beginShape(TRIANGLES);
        a.noStroke();
        a.vertex(v1, v2);
        a.vertex(v3, v4);
        a.vertex(v5, v6);
        a.endShape(CLOSE);

        for (int i=0; i<18; i++) {
            pushMatrix();
            a.rotate(radians(20));
            shape(a);
            SunBody.addChild(a);
            popMatrix();
        }
    }

    void display() {
        if (day) {
            // display sun
            pushMatrix();
            translate(x, y);
            shape(SunGroup);
            pushMatrix();
            rotate(SunAngle);
            triangle(0, 0, 0, 40, 35, 40);

            popMatrix();
            popMatrix();
        } else {
            //display moon
            pushMatrix();
            
            translate(x, y);
            shape(Moon);
            popMatrix();
        }
    }
    void move_across_sky() {
        bg_cycle();
        time = (frameCount/800.0) %1;
        // move sun/moon along bezier arc
        x = bezierPoint(-100, 0, width, width+100, time);
        y = bezierPoint(height/2-100, -50, -50, height/2-100, time);

        if (time%1 == 0) {
            x = -80;
            day = !day; // switch between day/night
        }
    }
    void bg_cycle() {
        color interA;
        if (!day) {
            //night cycle
            if (time > 0.5) {
                interA = lerpColor(bg_sunrise, bg_night, abs(1-time));
            } else {
                interA = lerpColor(bg_sunrise, bg_night, abs(time));
            }
        } else {
            //day cycle
            if (time > 0.5) {
                interA = lerpColor(bg_sunrise, bg_day, abs(1-time));
            } else {
                interA = lerpColor(bg_sunrise, bg_day, abs(time));
            }
        }
        background(interA);
    }
}
