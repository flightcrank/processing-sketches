
Vector point = new Vector(100, 50);

void setup() {
    
    size(640, 480);   
}

void draw() {
    
    background(255);
    fill(128);
    line(width /2, 0, width /2, height);
    line(0, height / 2, width, height / 2);
    
    translate(width / 2, height / 2);
    point.rotate(30);
    ellipse(point.x, -point.y, 30, 30);
}

void mouseClicked() {
    
    point.rotate(30);
}
