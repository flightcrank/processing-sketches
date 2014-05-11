import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ball extends PApplet {

//ball x and y location is set to a random number. Which is
//between the screen width(640) and height (480)
int x = (int) random(640);
int y = (int) random(480);

//sx and sy is the speed the ball moves in x and y direction.
//eg sx = 2; move 2 pixels on the x access each frame.
int sx = 2;
int sy = 2;

//set up screen size and colours
public void setup() {
  
  size(640, 480);
  fill(255,255,255);
} 

//draw ball to the screen and then move the ball co-ords
//to a new x and y position, based on the speed (sy and sy)
public void draw() {
  
  background(0,0,0);
  ellipse(x,y,50,50); //the ball
  moveBall();
}

public void moveBall() {
  
  //if the ball is at the edge of the screen on the x axis
  //change the ball speed to the opposite direction
  if (x >= 640 || x <= 0) {
    
    sx = -sx;
  }  
  
  //if the ball is at the edge of the screen on the y axis
  //change the ball speed to the opposite direction
  if (y >= 480 || y <= 0) {
    
    sy = -sy;
  }
  
  //move the ball along the x and y axis based on its speed value
  x = x + sx;
  y = y + sy;
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "ball" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
