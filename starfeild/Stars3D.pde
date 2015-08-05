
class Stars3D {

    float speed;
    float spread;
    
    float x[];
    float y[];
    float z[];
    
    public Stars3D(int numStars, float spread, float speed) {
        
        this.speed = speed;
        this.spread = spread;
        
        this.x = new float[numStars];
        this.y = new float[numStars];
        this.z = new float[numStars];
        
        for(int i = 0; i < numStars; i++) {
            
            InitStar(i);
        }
    }
    
    private void InitStar(int i) {
        
        x[i] = random(-1, 1) * this.spread;
        y[i] = random(-1, 1) * this.spread;
        z[i] = random(0, 1) * this.spread;
    }
 
    public void UpdateAndRender() {
        
        for(int i = 0; i < z.length; i++) {
            
            z[i] = z[i] - speed;
            
            if (this.z[i] <= 0) {
                
                InitStar(i);
            }
            
            float x = (this.x[i] / this.z[i]) * 200;
            float y = (this.y[i] / this.z[i]) * 200;
            
            color c = color(255);
            set((int)x + width / 2, (int)y + height / 2, c);
        }
    }   
}
