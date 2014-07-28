
point_3D[] cube_points = new point_3D[8];
edge[] edges = new edge[12];
triangle[] tris = new triangle[12];

float zoom = 400; //pixels
float rot_x = 1;
float rot_y = 1;
float rot_z = .5;

void setup() {
  
  //instaniate all point_3d objects in cube_points array
  cube_points[0] = new point_3D(-1.0, -1.0, -1.0);
  cube_points[1] = new point_3D(-1.0, -1.0,  1.0);
  cube_points[2] = new point_3D(-1.0,  1.0, -1.0);
  cube_points[3] = new point_3D(-1.0,  1.0,  1.0);
  cube_points[4] = new point_3D( 1.0, -1.0, -1.0);
  cube_points[5] = new point_3D( 1.0, -1.0,  1.0);
  cube_points[6] = new point_3D( 1.0,  1.0, -1.0);
  cube_points[7] = new point_3D( 1.0,  1.0,  1.0);
  
  //instaniate the array of edge objects that connect the cube_points array together
  edges[0] = new edge(0, 1);
  edges[1] = new edge(0, 2);
  edges[2] = new edge(0, 4);
  edges[3] = new edge(1, 3);
  edges[4] = new edge(1, 5);
  edges[5] = new edge(2, 3);
  edges[6] = new edge(2, 6);
  edges[7] = new edge(3, 7);
  edges[8] = new edge(4, 5);
  edges[9] = new edge(4, 6);
  edges[10] = new edge(5, 7);
  edges[11] = new edge(6, 7);
  
  //instaniate the array of trinagle objects that connect the cube_points array together
  tris[0] = new triangle(0, 2, 6);
  tris[1] = new triangle(6, 4, 0);
  tris[2] = new triangle(1, 5, 7);
  tris[3] = new triangle(7, 3, 1);
  tris[4] = new triangle(0, 4, 5);
  tris[5] = new triangle(5, 1, 0);
  tris[6] = new triangle(4, 6, 7);
  tris[7] = new triangle(7, 5, 4);
  tris[8] = new triangle(6, 2, 3);
  tris[9] = new triangle(3, 7, 6);
  tris[10] = new triangle(2, 0, 1);
  tris[11] = new triangle(1, 3, 2);
  
  size(640, 480);
  background(0);
}

void draw() {
  
  background(0);
  draw_axis();
  rotate_object();
  //draw_edges();
  draw_tris();
  
  for (int i = 0; i < cube_points.length; i++) {
    
    point_3D p = translate_vert(cube_points[i]);
    draw_point(p);
  }
}

point_3D translate_vert(point_3D p) {
  
  point_3D new_point = new point_3D(p.x, p.y, p.z);
  point_3D translation = new point_3D(0.0, 0.0, -6.0);
  
  new_point.x += translation.x;
  new_point.y += translation.y;
  new_point.z += translation.z;
  
  return new_point;
}

void mouseWheel(MouseEvent event) {
  
  float e = event.getCount();
  
  if (e > 0) {
  
    zoom += 5;
  
  } else {
    
    zoom -= 5;
  }
 
}

void mouseClicked() {
  
}

void draw_point(point_3D p) { 
  
  int p_size = 10;
    
  p.x = p.x / p.z; //perspective calculation
  p.y = p.y / p.z; //perspective calculation
  
  p.x *= zoom;
  p.y *= zoom;
  
  p.x = p.x + width / 2;
  p.y = -p.y + height / 2;
  
  noStroke();
  fill(255);
  ellipse(p.x, p.y, p_size, p_size);
}

void rotate_object() {
    
   for (int i = 0; i < cube_points.length; i++) {
   
     matrix rotation_x = new matrix();
     matrix rotation_y = new matrix();
     matrix rotation_z = new matrix();

     rotation_x.set_x_rotation_matrix(rot_x);
     rotation_y.set_y_rotation_matrix(rot_y);
     rotation_z.set_z_rotation_matrix(rot_z);
     
     matrix m = new matrix();
     m = m.matrix_matrix_multi(rotation_y, rotation_z);
     m = m.matrix_matrix_multi(m, rotation_x);
     
     point_3D p = m.vector_matrix_multi(cube_points[i]);

     cube_points[i].x = p.x;
     cube_points[i].y = p.y;
     cube_points[i].z = p.z;
  }
}

void draw_edges() {
  
  for(int i = 0; i < edges.length; i++) {
    
    int p1_i = edges[i].p1_index;
    int p2_i = edges[i].p2_index;
    
    point_3D p1 = translate_vert(cube_points[p1_i]);
    point_3D p2 = translate_vert(cube_points[p2_i]);
        
    p1.x = p1.x / p1.z; //perspective calculation
    p1.y = p1.y / p1.z; //perspective calculation
    
    p2.x = p2.x / p2.z; //perspective calculation
    p2.y = p2.y / p2.z; //perspective calculation

    p1.x *= zoom;
    p1.y *= zoom;
    
    p2.x *= zoom;
    p2.y *= zoom;
    
    p1.x = p1.x + width / 2;
    p1.y = -p1.y + height / 2;
    
    p2.x = p2.x + width / 2;
    p2.y = -p2.y + height / 2;
        
    stroke(0,200,0);
    line(p1.x, p1.y, p2.x, p2.y);
  }
}

void draw_tris() {
  
  for(int i = 0; i < tris.length; i++) {
    
    int p1_i = tris[i].p1_index;
    int p2_i = tris[i].p2_index;
    int p3_i = tris[i].p3_index;
    
    point_3D p1 = translate_vert(cube_points[p1_i]);
    point_3D p2 = translate_vert(cube_points[p2_i]);
    point_3D p3 = translate_vert(cube_points[p3_i]);
        
    p1.x = p1.x / p1.z; //perspective calculation
    p1.y = p1.y / p1.z; //perspective calculation
    
    p2.x = p2.x / p2.z; //perspective calculation
    p2.y = p2.y / p2.z; //perspective calculation
    
    p3.x = p3.x / p3.z; //perspective calculation
    p3.y = p3.y / p3.z; //perspective calculation

    p1.x *= zoom;
    p1.y *= zoom;
    
    p2.x *= zoom;
    p2.y *= zoom;
    
    p3.x *= zoom;
    p3.y *= zoom;
    
    p1.x = p1.x + width / 2;
    p1.y = -p1.y + height / 2;
    
    p2.x = p2.x + width / 2;
    p2.y = -p2.y + height / 2;
    
    p3.x = p3.x + width / 2;
    p3.y = -p3.y + height / 2;
        
    fill_tri(p1, p2 ,p3);
        
    stroke(0,200,0);
    line(p1.x, p1.y, p2.x, p2.y);
    line(p2.x, p2.y, p3.x, p3.y);
    line(p3.x, p3.y, p1.x, p1.y);
  }
}

void fill_tri(point_3D p1, point_3D p2, point_3D p3) {
  
    point_3D[] tri = new point_3D[3];
    
    tri[0] = p1;
    tri[1] = p2;
    tri[2] = p3;
  
    int top = height;
    int bottom = 0;
    int top_index = -1;
    int mid_index = -1;
    int bottom_index = -1;
    
    //sort edges from longest to shortest in the y axis
    for(int i = 0; i < tri.length; i++) {
      
      if (tri[i].y < top) {
        
        top = (int)tri[i].y;
        top_index = i;
      }
      
      if (tri[i].y > bottom) {
        
        bottom = (int)tri[i].y;
        bottom_index = i;
      }
    }
    
    //calculate the middle point
    mid_index = 3 - (top_index + bottom_index);
    
    //find all starting x values for line from top point
    //to the bottom point (longest triangle edge)
    int dx = (int)tri[bottom_index].x - (int)tri[top_index].x;
    int dy = (int)tri[bottom_index].y - (int)tri[top_index].y;
    float slope = (float)dx / dy;
    
    float[] edge1 = new float[dy];//edge from top point to bottom point
    float[] edge2 = new float[dy];//other side of triangle(both edges)
    
    //fill all of edge 1 which is the top point to the bottom point
    for(int i = 0; i < edge1.length; i++) {
    
      if (i == 0) {
      
        edge1[i] = tri[top_index].x + slope;
        continue;
      }
            
      edge1[i] = edge1[i - 1] + slope;      
    }
    
    //find all starting x values for line from top point
    //to the middle point
    dx = (int)tri[mid_index].x - (int)tri[top_index].x;
    dy = (int)tri[mid_index].y - (int)tri[top_index].y;
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
    dx = (int)tri[bottom_index].x - (int)tri[mid_index].x;
    dy = (int)tri[bottom_index].y - (int)tri[mid_index].y;
    slope = (float)dx / dy;
    
    int start = (int)tri[mid_index].y - (int)tri[top_index].y;
    
    for(int i = start; i < edge2.length; i++) {
      
      if (i == 0) {
        
        edge2[i] = tri[mid_index].x + slope;
        continue;
      }
      
      edge2[i] = edge2[i - 1] + slope;  
    }
    
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
