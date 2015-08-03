
class Object {

    Vector[] object = new Vector[3];
    Vector[] world = new Vector[3];
    Vector location = new Vector(0,0);
    Vector velocity = new Vector(0,0);

    public Object() {
    
        object[0] = new Vector(0, 50/2);
        object[1] = new Vector(-25/2, -25/2);
        object[2] = new Vector(25/2, -25/2);
    
        world[0] = new Vector(0,50/2);
        world[1] = new Vector(-25/2, -25/2);
        world[2] = new Vector(25/2, -25/2);
    }
    
    void update() {

        velocity.limit(2);
        location.add(velocity);
        
        for(int i = 0; i <  ship.world.length; i++) {
                    
            //translates point location into world space
            world[i] = object[0].addv(object[i], ship.location);
        }
        
        line(ship.world[0].x, -ship.world[0].y, ship.world[1].x, -ship.world[1].y);
        line(ship.world[1].x, -ship.world[1].y, ship.world[2].x, -ship.world[2].y);
        line(ship.world[2].x, -ship.world[2].y, ship.world[0].x, -ship.world[0].y);
    
//        for(int i = 0; i <  ship.world.length; i++) {
//        
//            ellipse(ship.world[i].x, -ship.world[i].y, 10, 10);
//        }
    }
    
    public void applyForce(Vector force) {
        
        Vector f = new Vector(force.x, force.y);

        //f.divi(mass);
        velocity.add(f);
    }
}
