
PImage createTex(int w, int h) {
  
  PImage img = createImage(w, h, ARGB);
  
  color c = color(0,0,255);
  color c2 = color(0,100,255);

  //check each pixel (double loop)
  for(int i = 0; i < w; i++) {
      
      //length for side a
      int a = abs(i - w / 2);
      
    for(int j = 0; j < h; j++) {
      
      //length for side b
      int b = abs(j - h / 2);
      
      //length of side c (hypotenuse == distance to center)
      float distance = sqrt(a * a + b * b);
      
      //limit distance the circles will draw too.
      if (distance < w / 2 + 1) {
        
        //create concentric circles
        if (distance % 10 < 4) {
       
          img.set(i, j, c);
        
        //gaps inbetween circles
        } else {
          
          img.set(i, j, c2);
        }
      }
    } 
  }
  
  return img;
}
