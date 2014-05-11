//
// This class defines a number of lines that retain the position
// of lines that came before it.
//

class LineTrail {
  
  final int LENGTH = 50; //Number of lines to draw
  
  Point p1, p2;   //two points to define a single line position
  float alpha[];  //alpha value of all lines in trails array
  int trails[][]; //array of previous line positions  
  
  LineTrail() {
    
    p1 = new Point();
    p2 = new Point();
    trails = new int[LENGTH][4];
    alpha = new float[LENGTH];
     
    setAlpha(); //alpha values of each line
  }
  
   //Interpolates each lines alpha value based on its position 
   //within the line trail
   private void setAlpha() {
     
     int i;
     
     for(i = 0; i < LENGTH; i++) {
       
       alpha[i] = (LENGTH - i) / (float) LENGTH;
     }
   }
  
  //Stores the current lines position at the top of the
  //trails array and moves each old position down one place.
  void storeTrail() {
     
    trails[0][0] = p1.x;
    trails[0][1] = p1.y;
    trails[0][2] = p2.x;
    trails[0][3] = p2.y;
       
    int i;
    
    //loops backwards through array and moves each line trail 
    //down one position. 
    for(i = trails.length - 1; i > 0; i--) {
         
      //point 1
      trails[i][0] = trails[i - 1][0]; //x position
      trails[i][1] = trails[i - 1][1]; //y position
      
      //point2
      trails[i][2] = trails[i - 1][2]; //x position
      trails[i][3] = trails[i - 1][3]; //y position
    }
  }
}
