
//screen width and height
int width = 640;
int height = 480;

int frame_count = 0;
long start_time = millis();
long elapsed_time = 0;

float[][] zbuffer = new float[height][width];
mesh cube = new mesh("suz.obj");

float zoom = -400; //pixels
float rot_x = 1;
float rot_y = 1;
float rot_z = .5;

void setup() {
  
  size(width, height);
  background(0);

  //inisilise zbuffer
  for(int i = 0; i < zbuffer.length; i++) {
    
    for(int j = 0; j < zbuffer[i].length; j++) {
    
        zbuffer[i][j] = -1000;
    }
  }
}

void draw() {
  
    frame_count++;
   
    long current_time = millis();
    
    //fps counter
    if (current_time - start_time >= 1000) {
        
        println("fps = " + frame_count);
        start_time = millis();
        frame_count = 0;
    }
    
    //reset zbuffer
    for(int i = 0; i < zbuffer.length; i++) {
    
        for(int j = 0; j < zbuffer[i].length; j++) {
        
            zbuffer[i][j] = -1000;
        }
    }
  
  background(0);
  draw_axis();
  
  //calculate rotaion in local space before translation
  rotate_object(cube);
  
  //calculate world and screen co-ords for all verts
  for (int i = 0; i < cube.vert.size(); i++) {
    
    cube.vert.get(i).world = translate_vert(cube.vert.get(i).local);
    cube.vert.get(i).screen = project_vert(cube.vert.get(i).world);
  }
  
  //draw_points();
  draw_tris();
  //draw_edges();
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
        
        if (zoom == 0) {
            
            zoom = 5;
        }
      
    } else {
    
        zoom -= 5;
        
        if (zoom == 0) {
            
            zoom = -5;
        }
    }
    
    
 
}

void mousePressed() {

    if (mouseButton == LEFT) {
    
        //println(verts.length);
    } 
      
    if (mouseButton == RIGHT) {
        
        cube.print_list();
    }
}

point_3D project_vert(point_3D p) {

    point_3D proj = new point_3D();
      
    proj.x = p.x / p.z; //perspective calculation
    proj.y = p.y / p.z; //perspective calculation
      
    proj.x = proj.x * zoom;
    proj.y = proj.y * zoom;
      
    proj.x = proj.x + width / 2;
    proj.y = -proj.y + height / 2;
      
    return proj;
}

void draw_points() { 
  
    int p_size = 10;
       
    noStroke();
    fill(0, 128, 0);
      
    for (int i = 0; i < cube.vert.size(); i++) {
      
        ellipse(cube.vert.get(i).screen.x, cube.vert.get(i).screen.y, p_size, p_size);
    }
}

void rotate_object(mesh obj) {
    
    for (int i = 0; i < cube.vert.size(); i++) {
    
        matrix rotation_x = new matrix();
        matrix rotation_y = new matrix();
        matrix rotation_z = new matrix();
        
        rotation_x.set_x_rotation_matrix(rot_x);
        rotation_y.set_y_rotation_matrix(rot_y);
        rotation_z.set_z_rotation_matrix(rot_z);
         
        matrix m = new matrix();
        m = m.matrix_matrix_multi(rotation_y, rotation_z);
        m = m.matrix_matrix_multi(m, rotation_x);
         
        point_3D p = m.vector_matrix_multi(obj.vert.get(i).local);
         
        obj.vert.get(i).local = p;
    }
}

void draw_edges() {
  
  stroke(0,200,0);
  
  for(int i = 0; i < cube.edges.size(); i++) {
    
    int p1 = cube.edges.get(i).p1_index;
    int p2 = cube.edges.get(i).p2_index;
    
    line(cube.vert.get(p1).screen.x, cube.vert.get(p1).screen.y, cube.vert.get(p2).screen.x, cube.vert.get(p2).screen.y);
  }
}

void draw_tris() {
  
    stroke(0,200,0);
      
    for(int i = 0; i < cube.tris.size(); i++) {
    
        int p1 = cube.tris.get(i).p1_index;
        int p2 = cube.tris.get(i).p2_index;
        int p3 = cube.tris.get(i).p3_index;
        
        //averge z value of whole triangle
        float z_avg = (cube.vert.get(p1).world.z + cube.vert.get(p2).world.z + cube.vert.get(p3).world.z) / 3;
           
        fill_tri(cube.vert.get(p1).screen, cube.vert.get(p2).screen ,cube.vert.get(p3).screen, cube.tris.get(i).c, z_avg);
        
//        line(cube.vert.get(p1).screen.x, cube.vert.get(p1).screen.y, cube.vert.get(p2).screen.x, cube.vert.get(p2).screen.y);
//        line(cube.vert.get(p2).screen.x, cube.vert.get(p2).screen.y, cube.vert.get(p3).screen.x, cube.vert.get(p3).screen.y);
//        line(cube.vert.get(p3).screen.x, cube.vert.get(p3).screen.y, cube.vert.get(p1).screen.x, cube.vert.get(p1).screen.y);
    }
}

void fill_tri(point_3D p1, point_3D p2, point_3D p3, color c, float z) {
  
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

    //fill the gap between the x vaules of the 2 edge arrays    
    for(int i = 0; i < edge1.length; i++) {
      
        //fill from the lowest value (left) 
        //to the highest value (right)
        if (edge1[i] < edge2[i]) {

            for(int j = (int)edge1[i]; j < (int)edge2[i]; j++) {         
              
                int x = j;
                int y = (int)tri[top_index].y + i;
              
                if (z > zbuffer[y][x]) {
                
                    zbuffer[y][x] = z;
                    set(x, y ,c);            
                }
            }
    
        } else {
    
            for(int j = (int)edge2[i]; j < edge1[i]; j++) {
            
                int x = j;
                int y = (int)tri[top_index].y + i;
                
                if (z > zbuffer[y][x]) {
                
                    zbuffer[y][x] = z;
                    set(x, y ,c);            
                }
            }
        }
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
