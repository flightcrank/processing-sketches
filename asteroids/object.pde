
class Object {

    Vector[] object = new Vector[3];
    Vector[] world = new Vector[3];
    Vector location = new Vector(0,0);

    public Object() {
    
        object[0] = new Vector(0, 100);
        object[1] = new Vector(-100, -100);
        object[2] = new Vector(100, -100);
    
        world[0] = new Vector(0,100);
        world[1] = new Vector(-100, -100);
        world[2] = new Vector(100, -100);
    }

}
