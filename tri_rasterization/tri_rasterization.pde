
Point2D[] tri = new Point2D[3];

void setup() {
  
  for(int i = 0; i < tri.length; i++) {
  
    int x = (int)random(0, width);
    int y = (int)random(0, height);
    
    tri[i] = new Point2D(x,y);
  }
  
  tri[0].x = 3;
  tri[0].y = 3;
  tri[1].x = 2;
  tri[1].y = 6;
  tri[2].x = 5;
  tri[2].y = 7;
    
  size(640, 480);
  background(0);
}

void draw() {
  
  background(0);
  draw_axis();
  
  for(int i = 0; i < tri.length; i++) {
    
    draw_point(tri[i].x,tri[i].y);
  }
  
  fill_tri();

  stroke(255,0,0);
  line(tri[0].x, tri[0].y, tri[1].x, tri[1].y);
  line(tri[1].x, tri[1].y, tri[2].x, tri[2].y);
  line(tri[2].x, tri[2].y, tri[0].x, tri[0].y);

  textSize(14);
  text("A", tri[0].x + 10, tri[0].y);
  text("B", tri[1].x + 10, tri[1].y);
  text("C", tri[2].x + 10, tri[2].y);
}

void mouseWheel(MouseEvent event) {
   
}

void create_triangle() {
  
  for(int i = 0; i < tri.length; i++) {
    
    tri[i].x = (int)random(10, width - 10);
    tri[i].y = (int)random(10, height - 10);
  }
}

void fill_tri() {
int top = height;
    int bottom = 0;
    int top_index = -1;
    int mid_index = -1;
    int bottom_index = -1;

    //sort edges from longest to shortest in the y axis
    for(int i = 0; i < tri.length; i++) {
      
      if (tri[i].y < top) {
        
        top = tri[i].y;
        top_index = i;
      }
      
      if (tri[i].y > bottom) {
        
        bottom = tri[i].y;
        bottom_index = i;
      }
    }
    
    //calculate the middle point
    mid_index = 3 - (top_index + bottom_index);
    
    //find all starting x values for line from top point
    //to the bottom point (longest triangle edge)
    int dx = tri[bottom_index].x - tri[top_index].x;
    int dy = tri[bottom_index].y - tri[top_index].y;
    float slope = (float)dx / dy;
    
    float[] edge1 = new float[dy];//edge from top point to bottom point
    float[] edge2 = new float[dy];//other side of triangle(both edges)

    for(int i = 0; i < edge1.length; i++) {
      
      if (i == 0) {
      
        edge1[i] = tri[top_index].x + slope;
        continue;
      }
            
      edge1[i] = edge1[i - 1] + slope;      
    }
    
    //find all starting x values for line from top point
    //to the middle point
    dx = tri[mid_index].x - tri[top_index].x;
    dy = tri[mid_index].y - tri[top_index].y;
    slope = (float)dx / dy;
   
    for(int i = 0; i < dy; i++) {
      
      if (i == 0) {
      
        edge2[i] = tri[top_index].x + slope;
        continue;
      }
            
      edge2[i] = edge2[i - 1] + slope;      
    }
    
    //find all starting x values for line from midddle point
    //to the bottom point
    dx = tri[bottom_index].x - tri[mid_index].x;
    dy = tri[bottom_index].y - tri[mid_index].y;
    slope = (float)dx / dy;
    
    int start = tri[mid_index].y - tri[top_index].y;
    
    for(int i = start; i < edge2.length; i++) {
      
      if (i == 0) {
      
        edge2[i] = tri[top_index].x + slope;
        continue;
      }
            
      edge2[i] = edge2[i - 1] + slope;      
    }

    //fill the gap between the x vaules of the 2 edge arrays    
    color c = color(255);
    
    for(int i = 0; i < edge1.length; i++) {
      
      //fill from the lowest value (left) 
      //to the highest value (right)
      if (edge1[i] < edge2[i]) {
                
        for(int j = (int)edge1[i]; j < (int)edge2[i]; j++) {
          
          set(j, tri[top_index].y + i , c);
        }
        
      } else {
        
        for(int j = (int)edge2[i]; j < edge1[i]; j++) {
          
            set(j, tri[top_index].y + i, c);
        }
      }
    }
}

void mousePressed() {
    
  if (mouseButton == LEFT) {
    
    create_triangle();
    println("A x = " + tri[0].x + " A y = " + tri[0].y );
    println("B x = " + tri[1].x + " B y = " + tri[1].y);
    println("C x = " + tri[2].x + " C y = " + tri[2].y + "\n");
    
  } else if (mouseButton == RIGHT) {
     
  } 
}
void draw_point(int x, int y) { 
  
  int p_size = 7;
    
  noStroke();
  fill(255);
  ellipse(x, y, p_size, p_size);
}


void draw_axis() {

  //line colour
  stroke(128);
  
  int x = width / 2;
  int y = height / 2;
  
  //y axis line
  line(x, 0, x, height);
  
  //x axis line
  line(0, y, width, y);
}
