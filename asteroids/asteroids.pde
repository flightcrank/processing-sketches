
Object ship = new Object();

void setup() {
    
    size(640, 480); 
}

void draw() {
    
    background(255);
    fill(128);
    line(width /2, 0, width /2, height);
    line(0, height / 2, width, height / 2);
    
    translate(width / 2, height / 2);
    
    line(ship.world[0].x, -ship.world[0].y, ship.world[1].x, -ship.world[1].y);
    line(ship.world[1].x, -ship.world[1].y, ship.world[2].x, -ship.world[2].y);
    line(ship.world[2].x, -ship.world[2].y, ship.world[0].x, -ship.world[0].y);
    
    for(int i = 0; i <  ship.world.length; i++) {
        
        ellipse(ship.world[i].x, -ship.world[i].y, 10, 10);
    }
}

void keyPressed() {

    if (key == CODED) {
        
        if (keyCode == LEFT) {
            
            for(int i = 0; i <  ship.object.length; i++) {

                ship.object[i].rotate(1);
                ship.world[i] = ship.world[i].addv(ship.object[i], ship.location);
            }
        }
        
        if (keyCode == RIGHT) {
            
            for(int i = 0; i <  ship.object.length; i++) {

                ship.object[i].rotate(-1);
                ship.world[i] = ship.world[i].addv(ship.object[i], ship.location);
            }
        }
        
        if (keyCode == UP) {
            
            Vector move = new Vector(0,0);
            move = ship.object[0];
            move.normalize();
            ship.location.add(move); 
            
            for(int i = 0; i <  ship.world.length; i++) {

                ship.world[i] = ship.object[0].addv(ship.object[i], ship.location);
            }
        }
        
        if (keyCode == DOWN) {
            
            Vector move = new Vector(0,-1);
            ship.location.add(move); 
            
            for(int i = 0; i <  ship.world.length; i++) {

                ship.world[i] = ship.object[0].addv(ship.object[i], ship.location);
            }
        }
    }
}

void mouseClicked() {
    
}
