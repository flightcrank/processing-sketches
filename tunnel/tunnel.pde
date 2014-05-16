//screen dimentions
int w = 256;
int h = 256;

//image texture
PImage tex;

//lookup tables
int[][] angle = new int[w][h];
int[][] distance = new int[w][h];

void setup() {

  size(w,h);
  background(0);//black
  tex = createTex(256,256);
}

//fill distance look up table
void calculateDistance() {
}

//fill angle look up table
void calculateAngle() {
}

void draw() {

  image(tex,0,0);

}
