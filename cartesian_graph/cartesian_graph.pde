
float points[][] = new float[8][3];
int edge[][] = new int[12][2];

float zoom = 400.0; //pixels
float rot_y = 2.0;

void setup() {
  
  points[0][0] = -1.0;
  points[0][1] = -1.0;
  points[0][2] = -1.0;
  
  points[1][0] = -1.0;
  points[1][1] = -1.0;
  points[1][2] = 1.0;
  
  points[2][0] = -1.0;
  points[2][1] = 1.0;
  points[2][2] = -1.0;
  
  points[3][0] = -1.0;
  points[3][1] = 1.0;
  points[3][2] = 1.0;
  
  points[4][0] = 1.0;
  points[4][1] = -1.0;
  points[4][2] = -1.0;
  
  points[5][0] = 1.0;
  points[5][1] = -1.0;
  points[5][2] = 1.0;
   
  points[6][0] = 1.0;
  points[6][1] = 1.0;
  points[6][2] = -1.0;
  
  points[7][0] = 1.0;
  points[7][1] = 1.0;
  points[7][2] = 1.0;
  
  edge[0][0] = 0;
  edge[0][1] = 1;
  
  edge[1][0] = 0;
  edge[1][1] = 2;
  
  edge[2][0] = 0;
  edge[2][1] = 4;
  
  edge[3][0] = 1;
  edge[3][1] = 3;
  
  edge[4][0] = 1;
  edge[4][1] = 5;
  
  edge[5][0] = 2;
  edge[5][1] = 3;
  
  edge[6][0] = 2;
  edge[6][1] = 6;
  
  edge[7][0] = 3;
  edge[7][1] = 7;
  
  edge[8][0] = 4;
  edge[8][1] = 5;
  
  edge[9][0] = 4;
  edge[9][1] = 6;
  
  edge[10][0] = 5;
  edge[10][1] = 7;
  
  edge[11][0] = 6;
  edge[11][1] = 7;
   
  size(640, 480);
  background(0);
}

void draw() {
  
  background(0);
  draw_axis();
 
  rotate_object();
  
  for (int i = 0; i < points.length; i++) {
    
    float[] v = translate_vert(points[i]);
    draw_point(v);
  }
  
  draw_edges();
}

void rotate_object() {
    
   for (int i = 0; i < points.length; i++) {
   
     float[] v = vector_maxtrix_multi(points[i], rot_y);
     points[i][0] = v[0];
     points[i][1] = v[1];
     points[i][2] = v[2];
  }
  
}

float[] translate_vert(float[] point) {
  
  float[] trans_vert = new float[3];
  
  trans_vert[0] = point[0];
  trans_vert[1] = point[1];
  trans_vert[2] = point[2];
  
  float[] translation = new float[3];
  
  translation[0] = 0;
  translation[1] = 0;
  translation[2] = -6;

  trans_vert[0] += translation[0];
  trans_vert[1] += translation[1];
  trans_vert[2] += translation[2];
  
  return trans_vert;
  
}

void mouseWheel(MouseEvent event) {
  
  float e = event.getCount();
  
  if (e > 0) {
  
    zoom += 1;
  
  } else {
    
    zoom -= 1;
  }
 
}

void mouseClicked() {
  
  float[] p = new float[3];
  p[0] = 12;
  p[1] = 17;
  p[2] = 4;
  
  float[] v = vector_maxtrix_multi(p, 0.0);
  
  println(rot_y);

}

void draw_point(float[] p) { 
  
  int p_size = 5;
  float x = p[0];
  float y = p[1];
  float z = p[2];
  
  x = x / z; //perspective calculation
  y = y / z; //perspective calculation
  
  x *= zoom;
  y *= zoom;
  
  x = x + width / 2;
  y = -y + height / 2;
  
  noStroke();
  ellipse(x, y, p_size, p_size);
}

void draw_edges() {
  
  for(int i = 0; i < edge.length; i++) {
    
    int p1 = edge[i][0];
    int p2 = edge[i][1];
    
    float[] v1 = translate_vert(points[p1]);
    float[] v2 = translate_vert(points[p2]);
    
    float x1 = v1[0];
    float y1 = v1[1];
    float z1 = v1[2];
    
    float x2 = v2[0];
    float y2 = v2[1];
    float z2 = v2[2];
    
    x1 = x1 / z1; //perspective calculation
    y1 = y1 / z1; //perspective calculation
    
    x2 = x2 / z2; //perspective calculation
    y2 = y2 / z2; //perspective calculation
  
    x1 *= zoom;
    y1 *= zoom;
    
    x2 *= zoom;
    y2 *= zoom;
  
    x1 = x1 + width / 2;
    y1 = -y1 + height / 2;
    
    x2 = x2 + width / 2;
    y2 = -y2 + height / 2;
    
    stroke(0,200,0);
    line(x1, y1, x2, y2);
  }
  
}

float[] vector_maxtrix_multi(float[] point, float degrees) {
  
  float[] new_vector = new float[3];
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
  
  new_vector[0] = matrix[0][0] * point[0] + matrix[0][1] * point[1] + matrix[0][2] * point[2];
  new_vector[1] = matrix[1][0] * point[0] + matrix[1][1] * point[1] + matrix[1][2] * point[2];
  new_vector[2] = matrix[2][0] * point[0] + matrix[2][1] * point[1] + matrix[2][2] * point[2];
  
  return new_vector;
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
