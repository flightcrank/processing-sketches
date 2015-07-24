
Vector point = new Vector(100, -100);

void setup() {
    
    size(640, 480);   
}

void draw() {
    
    background(255);
    fill(128);
    translate(width / 2, height / 2);
    ellipse(point.x, point.y, 30, 30);
}

void mouseClicked() {
    
    point.reflect();
}
