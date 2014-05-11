
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
