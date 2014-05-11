
int w = 640;
int h = 480;
PImage tex;

void setup() {

  size(w,h);
  background(0);//black
  tex = createTex(66,66);
}

void draw() {
  
 int x_offset = tex.width / 2;
 float y_offset = tex.height * 0.3;
 int count = 0;  
 
 //loop down y-axis in increments the size of the y offset amount
 for(int y = 0; y < h + y_offset; y += y_offset) {
   
   //every 2nd horizontal row calculate x offset amount
   if (count % 2 == 1) {
     
     x_offset = tex.width / 2;
     
   } else {
     
    x_offset = 0; 
   }
   
   //loop over x-axis, in increments the width of the texture
   for(int x = 0; x < w; x += tex.width) {
     
     image(tex, x - x_offset, y - y_offset);
   }
   
   //keep count of which row we are on
   count++;
 }
}
