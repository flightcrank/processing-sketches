
class vertex {
  
  public point_3D local;
  public point_3D world;
  public point_3D screen;
  
  public vertex() {
      
      this.local = new point_3D();
      this.world = new point_3D();
      this.screen = new point_3D();
  }
  
  public vertex(float x, float y, float z) {
      
      this.local = new point_3D(x, y, z);
  }
}
