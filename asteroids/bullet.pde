
class Bullet {

    Vector location = new Vector(0,0);
    Vector velocity = new Vector(0,0);
    boolean alive;

    public Bullet() {
    
        this.alive = false;
    }
    
    void update() {

        velocity.limit(10);
        location.add(velocity);
        
        //draw bullet
        if (this.alive == true) {
        
            ellipse(location.x, location.y, 2.5, 2.5);
        }
    }
        
    public void bounds() {
    
        if (location.x < -width / 2 || location.x > width / 2) {

            this.alive = false;
        }
            
        if (location.y < -height / 2 || location.y > height / 2) {

        this.alive = false;
            }
    }
    
    public void collision(Bullet blt) {
    
    }
}
