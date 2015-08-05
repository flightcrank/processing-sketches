
Stars3D stars;

void setup() {

    size(640, 480);
    stars = new Stars3D(4096, 64, .20);    
}

void draw() {
    
    background(0);
    stars.UpdateAndRender();
}
