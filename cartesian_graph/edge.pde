
//define an edge that connects two points together
//by storing two index's to an array of points
class edge {

  //index of point_3d objects 
  public int p1_index; 
  public int p2_index;
  
  edge(int index_1, int index_2) {
    
    this.p1_index = index_1;
    this.p2_index = index_2;  
  }
}
