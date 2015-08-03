
class Object {

    Vector[] object = new Vector[3];
    Vector[] world = new Vector[3];
    Vector location = new Vector(0,0);
    Vector velocity = new Vector(0,0);
    Vector accel = new Vector(0, 0);

    public Object() {
    
        object[0] = new Vector(0, 50);
        object[1] = new Vector(-25, -25);
        object[2] = new Vector(25, -25);
    
        world[0] = new Vector(0,50);
        world[1] = new Vector(-25, -25);
        world[2] = new Vector(25, -25);
    }
    
    void update() {
        

        velocity.limit(2);
        location.add(velocity);
        
        for(int i = 0; i <  ship.world.length; i++) {
                    
            //translates point location into world space
            world[i] = object[0].addv(object[i], ship.location);
        }
    }
    
    public void applyForce(Vector force) {
        
        Vector f = new Vector(force.x, force.y);

        //f.divi(mass);
        velocity.add(f);
        
        println("roc.x = " + f.x +" roc.y = "  + f.y);
        println("acc.x = " + accel.x +" acc.y = "  + accel.y);
        println();
    }

}
