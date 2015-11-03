
class Player {

    Vector[] verts = new Vector[3];
    Vector[] world = new Vector[3];
    Vector location = new Vector(0,0);
    Vector velocity = new Vector(0,0);

    public Player() {
    
        verts[0] = new Vector(0, 50/2);
        verts[1] = new Vector(-25/2, -25/2);
        verts[2] = new Vector(25/2, -25/2);
    
        world[0] = new Vector(0, 0);
        world[1] = new Vector(0, 0);
        world[2] = new Vector(0, 0);
    }
    
    void update() {

        velocity.limit(2);
        location.add(velocity);
        
        for(int i = 0; i <  world.length; i++) {
                    
            //translates point location into world space
            world[i] = verts[0].addv(verts[i], location);
        }
        
        line(world[0].x, -world[0].y, world[1].x, -world[1].y);
        line(world[1].x, -world[1].y, world[2].x, -world[2].y);
        line(world[2].x, -world[2].y, world[0].x, -world[0].y);
    }
    
    public void applyForce(Vector force) {
        
        Vector f = new Vector(force.x, force.y);

        //f.divi(mass);
        velocity.add(f);
    }
    
    public void bounds() {
    
    }
}
