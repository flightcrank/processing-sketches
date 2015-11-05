
Player ship = new Player();
Bullet[] bullets = new Bullet[6];

void setup() {
    
    size(640, 480);
    
    for (int i = 0; i < bullets.length; i++) {
        
        bullets[i] = new Bullet();
    }
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
                
                for(int i = 0; i <  ship.verts.length; i++) {

                    //rotate verts in object space
                    ship.verts[i].rotate(3);
                    
                    //translate into world space
                    ship.world[i] = ship.world[i].addv(ship.verts[i], ship.location);
                }
            }
            
             if (keyCode == RIGHT) {
                
                for(int i = 0; i <  ship.verts.length; i++) {
                    
                    //rotate verts in object space
                    ship.verts[i].rotate(-3);
                    
                    //translate into world space
                    ship.world[i] = ship.world[i].addv(ship.verts[i], ship.location);
                }
            }
        
            if (keyCode == UP) {
            
                //create a force that will act as rockets for ship. 
                //point in same direction as the nose of the ship is pointing
                Vector rockets = new Vector(ship.verts[0].x , ship.verts[0].y);
                rockets.normalise();
                rockets.multi(0.055);
                ship.applyForce(rockets);               
            }
        }
    }
    
    ship.update();
    ship.bounds();
    
    for (int i = 0; i < bullets.length; i++) {
        
        bullets[i].update();
        bullets[i].bounds();
    }
}

void keyPressed() {
    
    if (key == ' ') {
        
        for (int i = 0; i < bullets.length; i++) {
            
            if (bullets[i].alive == false) {
                
                bullets[i].location.x = ship.world[0].x;
                bullets[i].location.y = -ship.world[0].y;
                
                Vector bullet_velocity = new Vector(ship.verts[0].x, ship.verts[0].y);
                bullet_velocity.normalise();
                bullet_velocity.multi(4);
                
                bullets[i].velocity.x = bullet_velocity.x;
                bullets[i].velocity.y = -bullet_velocity.y;
                bullets[i].alive = true;
                break;
            }
        }
    }
}

void mouseClicked() {       
    
    println("loc.x = " + ship.location.x + " loc.y = " + ship.location.y);
    println("vel.x = " + ship.velocity.x + " vel.y = " + ship.velocity.y);
    println();

}
