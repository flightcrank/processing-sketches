
int w = 640;
int h = 480;
PImage tex;

void setup() {

  size(w,h);
  background(0);//black
  tex = createTex(256,256);
}

void draw() {

  image(tex,0,0);

}
