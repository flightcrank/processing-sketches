//
//This class defines a single point. and the speed at which
//that point can move through 2D space
//

class Point {

  int x;
  int y;
  int sx; //speed in x direction (in pixels)
  int sy; //speed in y direction (in pixels)
  
  Point() {
    
    this.x = (int)random(width);
    this.y = (int)random(height);
    sx = (int) (random(2,4));
    sy = (int) (random(2,4));
  }
    
  void randomSpeed() {
    
    //change speed in X direction
    if (sx >= 0) {
      
      sx = (int) (random(2,4));
    } else {
      
      sx = (int) (random(-4,-2));
    }
    
    //change speed in Y direction
    if (sy >= 0) {
      
      sy = (int) (random(2,4));    
    } else {
      
      sy = (int) (random(-4,-2));
    }    
    
  }
}
