
//a single line with a trail.
LineTrail line;

int startTime;
int currentTime;

void setup() {

  startTime = millis();
  size(800, 600);
  background(66);
  //noSmooth();
  //random line start pos
  line = new LineTrail();
}

void draw() {
  
  background(66);
  stroke(255);
  line(line.p1.x, line.p1.y, line.p2.x, line.p2.y);
  
  currentTime = millis();
  int diff = currentTime - startTime;
  int i;
    
  //draw line and trails
  for (i = 0; i < line.trails.length; i++) {
    
    stroke(255,255,255,line.alpha[i] * 255);
    line(line.trails[i][0], line.trails[i][1], line.trails[i][2], line.trails[i][3]);
  }
      
  if (diff > 50) {
    
    startTime = millis();
 
    //calculate the new trail positions
    line.storeTrail();
  }
   
  //move both points that define the line
  move(line.p1); 
  move(line.p2);
}

void mousePressed() {
  
  line.p1.x = (int) random(width);
  line.p1.y = (int) random(height);  
  line.p2.x = (int) random(width);
  line.p2.y = (int) random(height);
  line.p1.randomSpeed();
  line.p1.randomSpeed(); 
}

void move(Point p) {
  
  //wall collision
  if (p.x >= width || p.x <= 0) {
    
    //p.randomSpeed();
    p.sx = -p.sx;
  }  
  
  //wall collision
  if (p.y >= height || p.y <= 0) {
    
    //p.randomSpeed();
    p.sy = -p.sy;
  }
  
  //move point based on speed
  p.x += p.sx;
  p.y += p.sy;
}
//
// This class defines a number of lines that retain the position
// of lines that came before it.
//

class LineTrail {
  
  final int LENGTH = 50; //Number of lines to draw
  
  Point p1, p2;   //two points to define a single line position
  float alpha[];  //alpha value of all lines in trails array
  int trails[][]; //array of previous line positions  
  
  LineTrail() {
    
    p1 = new Point();
    p2 = new Point();
    trails = new int[LENGTH][4];
    alpha = new float[LENGTH];
     
    setAlpha(); //alpha values of each line
  }
  
   //Interpolates each lines alpha value based on its position 
   //within the line trail
   private void setAlpha() {
     
     int i;
     
     for(i = 0; i < LENGTH; i++) {
       
       alpha[i] = (LENGTH - i) / (float) LENGTH;
     }
   }
  
  //Stores the current lines position at the top of the
  //trails array and moves each old position down one place.
  void storeTrail() {
     
    trails[0][0] = p1.x;
    trails[0][1] = p1.y;
    trails[0][2] = p2.x;
    trails[0][3] = p2.y;
       
    int i;
    
    //loops backwards through array and moves each line trail 
    //down one position. 
    for(i = trails.length - 1; i > 0; i--) {
         
      //point 1
      trails[i][0] = trails[i - 1][0]; //x position
      trails[i][1] = trails[i - 1][1]; //y position
      
      //point2
      trails[i][2] = trails[i - 1][2]; //x position
      trails[i][3] = trails[i - 1][3]; //y position
    }
  }
}
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

