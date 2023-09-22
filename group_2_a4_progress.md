# General Project Proposal
Our project will be broken up into three "layers": foreground, midground, and background. In the foreground, we plan on having a car that moves on the road (translation). In the midground, we will have randomly generated clouds that move across the skyand will rain for a set period of time randomly. In the background, we will implement a run that rises and sets with a background to represent change from day and night. We plan on the animation to be able to run indefinitely.

# Descriptions of objects
## Foreground (Tarun)

{insert stuff here}
## Midground (Jeffrey)
The art for randomly generated clouds is still up in the air but it will be semi-adapted off the following code: https://github.com/simon-tiger/rain/tree/master/RainCloud. I'm considering adding random lightning strikes or changing cloud shapes but still unsure about how to implement those two. The clouds will translate over the screen from right to left (same direction as the sun). 

## Background (Yawer)
{insert stuff here}

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