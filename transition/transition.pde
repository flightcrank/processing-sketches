
int w = 640;
int h = 480;
PImage img_1, img_2, alpha;
int current = 0;
int column = 0;

void setup() {

  size(w,h);
  background(0);//black
  
  color c1 = color(255, 0, 0);//red
  color c2 = color(0, 0, 255);//blue
  color c3 = color(0, 0, 0);//black
  
  img_1 = create_image(w, h, c1);
  img_2 = create_image(w, h, c2);
  alpha = create_image(w, h, c3);
}

void draw() {
    
    int diff = millis() - current;
    
    if (diff >= 10) {
        
        current = millis();
        
        for (int y = 0; y < h; y++) {
            
                alpha.set(column, y, color(255,255,255));
         }
         
         column++;
     }
     
    //loop through each pixel of the alpha channel
    for (int x = 0; x < w; x++) {
        
        for (int y = 0; y < h; y++) {
                
           color pix = alpha.get(x,y);
           
           //for every white pixel
           if (pix == color(255,255,255)) {
               
               set(x, y, img_2.get(x,y));
           
           } else {
               
               set(x,y, img_1.get(x,y));
           }          
        }
    }
}


