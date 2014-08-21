
class Grid {
    public int w; //total width of grid
    public int h; //total height of grid
    public int size_x; //number of cells in each colum
    public int size_y; //number of cells in each row
    public int cell_x; //size each cells width
    public int cell_y; //size each cells height
    public int start_x; //grid starting point
    public int start_y; //grid starting point
    public int[][] grid;
    
    public Grid(int w, int h, int size_x, int size_y) {
        
        this.w = w;
        this.h = h;
        this.size_x = size_x;
        this.size_y = size_y;
        this.cell_y = h / size_y;
        this.cell_x = w / size_x;
        this.start_x = 0;
        this.start_y = 0;
        this.grid = new int[size_x][size_y];
    }
    
    public void calculate_cell(int x, int y) {
    
        //calculate if within the grids X boundrys
        if(x > start_x && x < (start_x + w)) {
            
            //calculate if within the grids Y boundrys
            if(y > start_y && y < (start_y + h)) {
                
                int x_index = (x - start_x) / cell_x;
                int y_index = (y - start_y) / cell_y;
                
                this.grid[x_index][y_index] = 1;
                
            }            
        }  
    }
        
    public void draw_grid(int x, int y) {
        
        //change grid starting co-ords from default values
        this.start_x = x;
        this.start_y = y;
        
        for(int i = 0; i < size_y; i++) {
            
            for(int j = 0; j < size_x; j++) {
     
                if (grid[j][i] == 1) {
                    
                    int pos_x = j * cell_x + start_x;
                    int pos_y = i * cell_y + start_x;
                    
                    rect(pos_x, pos_y, cell_x, cell_y); 
                }
            }
        }

        stroke(255);
       
        //horizontal
        for(int i = 0; i <= this.size_y; i++) {

            line(x, this.cell_y * i + y, x + this.w, this.cell_y * i + y);
        }
        
        //vertical
        for(int i = 0; i <= this.size_x; i++) {

            line(this.cell_x * i + x, y, this.cell_x * i + x, y + this.h);
        }
    }
}
