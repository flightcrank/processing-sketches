
point_3D[] cube_points = new point_3D[8];
edge[] edges = new edge[12];

float zoom = 400; //pixels
float rot_y = 2.0;

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

  size(640, 480);
  background(0);
}

void draw() {
  
  background(0);
  draw_axis();
 
  rotate_object();
  
  for (int i = 0; i < cube_points.length; i++) {
    
    point_3D p = translate_vert(cube_points[i]);
    draw_point(p);
  }
  
  draw_edges();
}

point_3D translate_vert(point_3D p) {
  
  point_3D new_point = new point_3D(p.x, p.y, p.z);
  point_3D translation = new point_3D(0.0, 0.0, -4.0);
  
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
  
  int p_size = 5;
    
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
   
     point_3D p = vector_maxtrix_multi(cube_points[i], rot_y);
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

point_3D vector_maxtrix_multi(point_3D p, float degrees) {
  
  point_3D new_point = new point_3D();
  float[][] matrix = new float[3][3];
  
  float rad = radians(degrees);
  
  matrix[0][0] = cos(rad);
  matrix[0][1] = 0;
  matrix[0][2] = -(sin(rad));
  
  matrix[1][0] = 0;
  matrix[1][1] = 1;
  matrix[1][2] = 0;
  
  matrix[2][0] = sin(rad);
  matrix[2][1] = 0;
  matrix[2][2] = cos(rad);
  
  new_point.x = matrix[0][0] * p.x + matrix[0][1] * p.y + matrix[0][2] * p.z;
  new_point.y = matrix[1][0] * p.x + matrix[1][1] * p.y + matrix[1][2] * p.z;
  new_point.z = matrix[2][0] * p.x + matrix[2][1] * p.y + matrix[2][2] * p.z;
  
  return new_point;
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
