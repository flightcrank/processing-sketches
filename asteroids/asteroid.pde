
class Asteroid {

    Vector[] verts = new Vector[10];
    Vector[] world = new Vector[10];
    Vector location = new Vector(0,0);
    Vector velocity = new Vector(0,0);

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
        
        velocity.x = random(-1.5, 1.5);
        velocity.y = random(-1.5, 1.5);
        
        for(int i = 0; i < verts.length; i ++) {
            
            verts[i].multi(888);
            world[i] = new Vector(0, 0);
        }
    }
    
    void update() {

        velocity.limit(2.5);
        location.add(velocity);

        for(int i = 0; i < world.length; i++) {
                    
            //translates point location into world space
            world[i] = verts[0].addv(verts[i], location);
            
            //rotate all points
            verts[i].rotate(.5);
        }
        
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
        
        //center point of asteroid
        float cx = 0;
        float cy = 0;
        
        for (int i = 0 ; i < world.length; i++) {
            
            cx += world[i].x;
            cy += world[i].y;
        }
        
        cx /= world.length;
        cy /= world.length;
        
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

}
