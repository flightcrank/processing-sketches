
class mesh {

    public edge[] edges = new edge[12];
    triangle[] tris = new triangle[12];
    public ArrayList<vertex> vert = new ArrayList<vertex>();
  
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
        
        //instaniate the array of trinagle objects that connect the verts array together
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
                  
                    println(pieces[1] + " " + pieces[2] + " " + pieces[3]);
                    
                    float x = float(pieces[1]);
                    float y = float(pieces[2]);
                    float z = float(pieces[3]);
                    
                    vert.add(new vertex(x, y, z));
                }
            }
        }
    }
    
    void print_list() {
        
        println("---------");
        
        for(int i = 0; i < vert.size(); i++) {
            
            println("x = " + vert.get(i).local.x + " y = " + vert.get(i).local.y + " z = " + vert.get(i).local.z);
        }
    }
}
