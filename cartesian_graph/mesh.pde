
class mesh {

  public vertex[] verts = new vertex[8];
  public edge[] edges = new edge[12];
  triangle[] tris = new triangle[12];
  
  public mesh() {
  
    //instaniate the array of edge objects that connect the verts array together
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
  }
  
  private void create_verts() {
    
    //instaniate all point_3d objects in verts array
    verts[0].local = new point_3D(-1.0, -1.0, -1.0);
    verts[1].local = new point_3D(-1.0, -1.0,  1.0);
    verts[2].local = new point_3D(-1.0,  1.0, -1.0);
    verts[3].local = new point_3D(-1.0,  1.0,  1.0);
    verts[4].local = new point_3D( 1.0, -1.0, -1.0);
    verts[5].local = new point_3D( 1.0, -1.0,  1.0);
    verts[6].local = new point_3D( 1.0,  1.0, -1.0);
    verts[7].local = new point_3D( 1.0,  1.0,  1.0);
  }
}
