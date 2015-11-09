
class Asteroid {

    Vector[] verts = new Vector[10];
    Vector[] world = new Vector[10];
    Vector location = new Vector(0,0);
    Vector velocity = new Vector(0,0);
    float cx = 0;
    float cy = 0;
    float radius = 30;

    public Asteroid() {
    
        verts[0] = new Vector(.00, .04);
        verts[1] = new Vector(.02, .03);
        verts[2] = new Vector(.02, .01);
        verts[3] = new Vector(.04, .00);
        verts[4] = new Vector(.03, -.02);
        verts[5] = new Vector(.01, -.02);
        verts[6] = new Vector(.00, -.03);
        verts[7] = new Vector(-.02, -.02);
        verts[8] = new Vector(-.04, .00);
        verts[9] = new Vector(-.03, .03);
        
        location.x = random(-320, 320);
        location.y = random(-320, 320);
        
        velocity.x = random(-.0, .0);
        velocity.y = random(-.0 , .0);
        
        //scale the object in object space to make larger on screen
        for(int i = 0; i < verts.length; i ++) {
            
            verts[i].multi(888);
            world[i] = new Vector(0, 0);
        }
    }
    
    void update() {

        velocity.limit(2.5);
        location.add(velocity);
        
        cx = 0;
        cy = 0;
        
        //calculate center point of asteroid
        for (int i = 0; i < world.length; i++) {
            
            cx += world[i].x;
            cy += world[i].y;
        }
        
        cx /= world.length;
        cy /= world.length;

    
        for(int i = 0; i < world.length; i++) {
                    
            //translates point location into world space
            world[i] = verts[0].addv(verts[i], location);
            
            //rotate all points
            verts[i].rotate(.5);
        }
        
        ellipse(cx, -cy, 2,2);
//        noFill();
//        ellipse(cx, -cy, radius, radius);
//        fill(128);
        line(world[0].x, -world[0].y, world[1].x, -world[1].y);
        line(world[1].x, -world[1].y, world[2].x, -world[2].y);        
        line(world[2].x, -world[2].y, world[3].x, -world[3].y);
        line(world[3].x, -world[3].y, world[4].x, -world[4].y);
        line(world[4].x, -world[4].y, world[5].x, -world[5].y);
        line(world[5].x, -world[5].y, world[6].x, -world[6].y);
        line(world[6].x, -world[6].y, world[7].x, -world[7].y);
        line(world[7].x, -world[7].y, world[8].x, -world[8].y);
        line(world[8].x, -world[8].y, world[9].x, -world[9].y);
        line(world[9].x, -world[9].y, world[0].x, -world[0].y);

    }
    
    public void applyForce(Vector force) {
        
        Vector f = new Vector(force.x, force.y);

        //f.divi(mass);
        velocity.add(f);
    }
    
    public void bounds() {

        if (cx < -width / 2) {
            
            location.x = width / 2;
        }
        
        if (cx > width / 2) {
            
            location.x  = -width / 2;
        }
        
        if (cy < -height / 2) {
            
            location.y = height / 2;
        }
        
        if (cy > height / 2) {
            
            location.y = -height / 2;
        }
    }
    
    public void collision(Player ship) {
        
        float sum = this.radius + ship.radius;
        
        float a = pow(this.cx - ship.cx, 2); 
        float b = pow(this.cy - ship.cy, 2);
        float distance = sqrt(a + b);
        
        if (distance < sum) {
            
            println("ship collision detected");
        }
    }
    
    public void collision(Bullet[] blt) {
        
        for (int i = 0; i < blt.length; i++) {
        
            float a = pow(this.cx - blt[i].location.x, 2); 
            float b = pow(this.cy - -blt[i].location.y, 2);
            float distance = sqrt(a + b);
            println("distance " + distance);
            if (distance < this.radius) {
            
                println("bullet collision detected");
                blt.alive = false;
            }
        }
    }
}
