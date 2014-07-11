
class matrix {
  
  //3x3 matrix grid
  private float[][] m_grid = new float[3][3];
  
  public void set_y_rotation_matrix(float degrees) {
  
    float rad = radians(degrees);
    
    m_grid[0][0] = cos(rad);
    m_grid[0][1] = 0;
    m_grid[0][2] = -(sin(rad));
    
    m_grid[1][0] = 0;
    m_grid[1][1] = 1;
    m_grid[1][2] = 0;
    
    m_grid[2][0] = sin(rad);
    m_grid[2][1] = 0;
    m_grid[2][2] = cos(rad);
  }
  
  public void set_x_rotation_matrix(float degrees) {
    
    float rad = radians(degrees);
    
    m_grid[0][0] = 1;
    m_grid[0][1] = 0;
    m_grid[0][2] = 0;
    
    m_grid[1][0] = 0;
    m_grid[1][1] = cos(rad);
    m_grid[1][2] = -(sin(rad));
    
    m_grid[2][0] = 0;
    m_grid[2][1] = sin(rad);
    m_grid[2][2] = cos(rad);
  }
  
  public void set_z_rotation_matrix(float degrees) {
    
    float rad = radians(degrees);
    
    m_grid[0][0] = cos(rad);
    m_grid[0][1] = -(sin(rad));
    m_grid[0][2] = 0;
    
    m_grid[1][0] = sin(rad);
    m_grid[1][1] = cos(rad);
    m_grid[1][2] = 0;
    
    m_grid[2][0] = 0;
    m_grid[2][1] = 0;
    m_grid[2][2] = 1;
  }
  
  public float[][] get_matrix() {
    
    return m_grid;
  }
  
  public point_3D vector_matrix_multi(point_3D p) {
     
    point_3D new_point = new point_3D();
      
    new_point.x = m_grid[0][0] * p.x + m_grid[0][1] * p.y + m_grid[0][2] * p.z;
    new_point.y = m_grid[1][0] * p.x + m_grid[1][1] * p.y + m_grid[1][2] * p.z;
    new_point.z = m_grid[2][0] * p.x + m_grid[2][1] * p.y + m_grid[2][2] * p.z;
  
    return new_point;
  }
  
  public matrix matrix_matrix_multi(matrix x, matrix y) {
    
    matrix m = new matrix();
    
    for(int i = 0; i < 3; i++) {
      
         for(int j = 0; j< 3; j++) {
           
            m.m_grid[i][j] = (x.m_grid[i][0] * y.m_grid[0][j]) +
                             (x.m_grid[i][1] * y.m_grid[1][j]) +
                             (x.m_grid[i][2] * y.m_grid[2][j]);
         }
    }
    
    return m;
  }
}
