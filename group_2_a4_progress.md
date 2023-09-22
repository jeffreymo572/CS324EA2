# General Project Proposal
Our project will be broken up into three "layers": foreground, midground, and background. In the foreground, we plan on having a car that moves on the road (translation). In the midground, we will have randomly generated clouds that move across the sky and will rain for a set period of time randomly. In the background, we will implement a sun that rises and sets with a background to represent change from day and night. We plan on the animation to be able to run indefinitely.

# Descriptions of objects
## Foreground (Tarun)

{insert stuff here}
## Midground (Jeffrey)
The art for randomly generated clouds is still up in the air but it will be semi-adapted off the following code: https://github.com/simon-tiger/rain/tree/master/RainCloud. I'm considering adding random lightning strikes or changing cloud shapes but still unsure about how to implement those two. The clouds will translate over the screen from right to left (same direction as the sun). 

## Background (Yawer)
The background will have a day-night cycle with a sun and moon translating in an arc across the sky. The sun will have triangles around the main body that will rotate. I'm considering adding a slow changing background from sky-blue to dark-blue during the cycle, rather than just a sudden switch between the two. Further considerations will be adding stars, comets, etc. to the night sky. The sun/moon will have a 

# Classes

## Cloud
The cloud class will have the following parameters: 

```python
pos (PVector): x,y of the center of the cloud
speed(float, default=1): How many pixels per frame the center of the clouds will move
lightning (float, default=0): How often lightning will strike
rainFreq (float, default=0): How often the rain will fall
rain (float, default=0): How much rain will fall
```
During the startup of the program, Cloud will be called `cloudy(int)` number of times which will populate the sky with `cloudy` number of clouds. Like in `simon-tiger`'s code, each cloud will be composed of various overlapping circles. However, in my code the number of circles will vary (using arrayList instead of array[5]) and the sizes of each circle will be randomized to create a variety of clouds. The size of clouds will not be parameter. Instead, it will use the `randomGaussian` function with the center and variance depending on the width and height of the window (to be deteremined). Each cloud will be a semi-unique gray depending on the `randomGaussian` function of Processing with a range based on `lightning` and `rainFreq` (e.g., `color c = constrain((lightning+rainFreq)*10, 0, 255)`). 

## Sun/Moon
The Sun/Moon class will have the following parameters:

```python
pos (PVector): x,y center of the circle
speed (float, default = 1): How fast the object is moving per frame (how many pixels)
size (float): how large is the circle 
radius_of_motion (float): the radius of the arc that the sun/moon will travel on
start_loc (float, default = 0): The starting location of the object
```
This object will be set on a pre-determined path. I am planning to implement 4 alternating suns and moons that are 90 apart and only one or two (max) objects will be displayed. The rest will still be stored and moving, but will be outside of the window, until they get to frame. For translation, I will use the pos, speed, radius_of_motion and start_loc to implament it. I will also use the triangle method to create a triangle that I will put on the edge of the sun at equal intervals and they will be rotating around the main body of the sun. This will be done internally and will not have user input.



