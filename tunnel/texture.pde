
PImage createTex(int w, int h) {
  
  PImage img = createImage(w, h, ARGB);
  
  //check each pixel (double loop)
  for(int i = 0; i < w; i++) {
 
    for(int j = 0; j < h; j++) {
      
      int value = i ^ j;
      color c = color(value,value,value);
      
      img.set(i, j, c);
    }
  }

  return img;
}
