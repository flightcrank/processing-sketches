
class mesh {

    public ArrayList<vertex> vert = new ArrayList<vertex>();
    public ArrayList<edge> edges = new ArrayList<edge>();
    public ArrayList<triangle> tris = new ArrayList<triangle>();
  
    public mesh() {
        
        //instaniate all point_3d objects in verts array
        vert.add(new vertex(-1.0, -1.0, -1.0));
        vert.add(new vertex(-1.0, -1.0,  1.0));
        vert.add(new vertex(-1.0,  1.0, -1.0));
        vert.add(new vertex(-1.0,  1.0,  1.0)); 
        vert.add(new vertex(1.0, -1.0, -1.0));      
        vert.add(new vertex(1.0, -1.0,  1.0));  
        vert.add(new vertex(1.0,  1.0, -1.0));   
        vert.add(new vertex(1.0,  1.0,  1.0));
        
        //instaniate the array of edge objects that connect the verts array together
        edges.add(new edge(0, 1));
        edges.add(new edge(0, 2));
        edges.add(new edge(0, 4));
        edges.add(new edge(1, 3));
        edges.add(new edge(1, 5));
        edges.add(new edge(2, 3));
        edges.add(new edge(2, 6));
        edges.add(new edge(3, 7));
        edges.add(new edge(4, 5));
        edges.add(new edge(4, 6));
        edges.add(new edge(5, 7));
        edges.add(new edge(6, 7));
        
        //instaniate the array of trinagle objects that connect the verts array together
        tris.add(new triangle(0, 2, 6));
        tris.add(new triangle(6, 4, 0));
        tris.add(new triangle(1, 5, 7));
        tris.add(new triangle(7, 3, 1));
        tris.add(new triangle(0, 4, 5));
        tris.add(new triangle(5, 1, 0));
        tris.add(new triangle(4, 6, 7));
        tris.add(new triangle(7, 5, 4));
        tris.add(new triangle(6, 2, 3));
        tris.add(new triangle(3, 7, 6));
        tris.add(new triangle(2, 0, 1));
        tris.add(new triangle(1, 3, 2));
    }
  
    public mesh(String filename) {

        println("loading mesh: " + filename);

        BufferedReader reader;  
        String line;

        reader = createReader(filename); 
        
        while(true) {
          
            try {
        
                line = reader.readLine();
        
            } catch (IOException e) {
        
                e.printStackTrace();
                line = null;
            }
          
            // Stop reading because of an error or file is empty
            if (line == null) {
          
                break;
        
            } else {
        
                String[] pieces = split(line, " ");

                if (pieces[0].equals("v")) {

                    float x = float(pieces[1]);
                    float y = float(pieces[2]);
                    float z = float(pieces[3]);
                    
                    vert.add(new vertex(x, y, z));
                }
                
                if (pieces[0].equals("f")) {
                    
                    //vertex index's of connected points that form a triangle
                    int i1 = int(pieces[1]);
                    int i2 = int(pieces[2]);
                    int i3 = int(pieces[3]);
                                        
                    tris.add(new triangle(i1 - 1, i2 - 1, i3 - 1));
                }       
            }
        }
    }
    
    void print_list() {
        
        println("---------");
        
        for(int i = 0; i < tris.size(); i++) {
            
            println(tris.get(i).p1_index + " " + tris.get(i).p2_index + " " + tris.get(i).p3_index);
        }
    }
}
