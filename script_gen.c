#include <stdio.h>
#include <stdlib.h>

#define FRAMES 100

int main(){
  double
    x,y,z,vx,vy,vz,ax,ay,az;

  int radius = 50;

  x = 0;
  y = 250;
  z = 0;
  
  vx = 5;
  vy = 15;
  vz = 0;

  ax = 0;
  ay = -1;
  az = 0;

  int frame;

  for(frame = 0; frame < FRAMES; frame++){
    printf("sphere\n%lf %lf %lf %d\n",
	   x,y,z,radius);
    printf("save\nframes/frame%02d.png\nclear\n",frame);
    x += vx;
    y += vy;
    z += vz;

    vx += ax;
    vy += ay;
    vz += az;

    if(y < 50) vy *= -1;
  }
  
  printf("quit\n");
  return 0;
}
