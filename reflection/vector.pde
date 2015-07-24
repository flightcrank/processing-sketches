
class Vector {

    float x;
    float y;

    public Vector(float x, float y) {
        
        this.x = x;
        this.y = y;
    }
    
    //adds a vector (v) to this current vector
    public void add(Vector v) {
    
        this.x = this.x + v.x;
        this.y = this.y + v.y;
    }
    
    public Vector addv(Vector a, Vector b) {
    
        Vector v = new Vector(a.x + b.x, a.y + b.y);
        
        return v;   
    }
    
    //subtracts a vector (v) from this current vector
    public void sub(Vector v) {
        
        this.x = this.x - v.x;
        this.y = this.y - v.y;
    }
    
    public Vector subv(Vector a, Vector b) {
    
        Vector v = new Vector(a.x - b.x, a.y - b.y);
        
        return v;   
    }
    
    //multiply current vector by a number (n)
    public void multi(float n) {
        
        this.x = this.x * n;
        this.y = this.y * n;
    }
    
    //divide current vector by a number (n)
    public void divi(float n) {
        
        this.x = this.x / n;
        this.y = this.y / n;
    }
    
    //calculate magnitude of current vector
    public float mag() {
        
        float c2 = pow(this.x, 2) + pow(this.y, 2); 
        
        return sqrt(c2);
    }
    
    public void normalise() {
    
        float m = mag();
        divi(m);
    }
    
    public void limit(float max) {
           
        if (this.mag() > max) {
        
            float ratio = max / this.mag();
            this.x = this.x * ratio;
            this.y = this.y * ratio; 
        }
    }
    
    public void reflect() {
    
        int[][] matrix = {{-1, 0},
                          { 0, 1}};
    
        this.x = matrix[0][0] * this.x + matrix[0][1] * this.y;
        this.y = matrix[1][0] * this.x + matrix[1][1] * this.y;

    }
}
