
Object ship = new Object();
bullet b = new bullet();

void setup() {
    
    size(640, 480); 
}

void draw() {
    
    background(255);
    fill(128);
    line(width /2, 0, width /2, height);
    line(0, height / 2, width, height / 2);
    
    translate(width / 2, height / 2);
    
    if (keyPressed) {

        if (key == CODED) {
        
            if (keyCode == LEFT) {
                
                for(int i = 0; i <  ship.object.length; i++) {

                    ship.object[i].rotate(3);
                    ship.world[i] = ship.world[i].addv(ship.object[i], ship.location);
                }
            }
            
             if (keyCode == RIGHT) {
                
                for(int i = 0; i <  ship.object.length; i++) {

                    ship.object[i].rotate(-3);
                    ship.world[i] = ship.world[i].addv(ship.object[i], ship.location);
                }
            }
        
            if (keyCode == UP) {
            
                //create a force that will act as rockets for ship. 
                //point in same direction as the nose of the ship is pointing
                Vector rockets = new Vector(ship.object[0].x , ship.object[0].y);
                rockets.normalise();
                rockets.multi(0.033);
                ship.applyForce(rockets);               
            }
        }
    }
    
    ship.update();
    b.update();
    b.display();
}

void keyPressed() {
    
    if (key == ' ') {
        
        Vector bullet_vel = new Vector(ship.object[0].x , ship.object[0].y);
        bullet_vel.normalise();
        bullet_vel.multi(3);
        
        
        b.location.x = ship.world[0].x;
        b.location.y = ship.world[0].y;
        b.velocity.x = bullet_vel.x;
        b.velocity.y = bullet_vel.y;
        println(b.alive);
        b.alive = true;
        println(b.alive);   
        
    }
}

void mouseClicked() {       
                
}
