
//defines a point in 3d cartesian space
class point_3D {
  
  public float x;
  public float y;
  public float z;
  
  //default constructor
  point_3D() {
   
    this.x = 0.0;
    this.y = 0.0;
    this.z = 0.0; 
  }
  
  point_3D(float x, float y, float z) {
    
    this.x = x;
    this.y = y;
    this.z = z;
  }
}
