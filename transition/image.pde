
PImage create_image(int w, int h, color c) {
  
  PImage img = createImage(w, h, ARGB);
  
  for(int x = 0; x < w; x++) {
      
      for(int y = 0; y < h; y++) {
          
          img.set(x, y, c);          
      }
  }
  
  return img;
}




