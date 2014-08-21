
int w = 640;
int h = 480;

Grid plane = new Grid(400, 400, 20, 20);

void setup() {
    
    size(w,h);
}

void draw() {
    
    background(0);
    plane.draw_grid(40,40);
    
}

void mousePressed() {

    if (mouseButton == LEFT) {
        
        plane.calculate_cell(mouseX, mouseY);
    } 
      
    if (mouseButton == RIGHT) {
        
    }
}
