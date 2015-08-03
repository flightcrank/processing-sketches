
class bullet {

    Vector location;
    Vector velocity;
    boolean alive;
        
    public bullet() {
        
        location = new Vector(0,0);
        velocity = new Vector(0,0);
        alive = false;
    }
    
    void update() {

        location.add(velocity);
    }
    
    void bounds() {
        
        if (location.x < 0 || location.x > width) {
            
            alive = false;
        }
    }
    
    void display() {
        
        if (this.alive == true) {
            
            ellipse(location.x, -location.y, 5, 5);
        }
    }
}
