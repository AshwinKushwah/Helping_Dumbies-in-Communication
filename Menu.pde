class Manu{
  Buttons b1,b2,b3;
   Manu(){
      b1 = new Buttons("Train",20,height/10);
      b2 = new Buttons("Recognize",(width/5)+(width/6),height/10);
      b3 = new Buttons("result",3*(width/4),height/10);
   }
   
   void showButtons(){
      b1.drawButton();
      b2.drawButton();
      b3.drawButton();
   }
   
   int choice(Capture video, PImage prev){
     video.loadPixels();
     prev.loadPixels();
     float worldRecord = 150; 

/*
  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;
*/

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height/4; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      color trackColor = prev.pixels[loc];
      
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float bl1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float bl2 = blue(trackColor);
      
      // Using euclidean distance to compare colors
      float d = dist(r1, g1, bl1, r2, g2, bl2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d > worldRecord) {
        //checking the area of difference
        if((b1.bX <= x && b1.bX+100 >= x) && (b1.bY <= y && b1.bY+60 >= y)){
          fill(255,0,0);
          rect(b1.bX,b1.bY,b1.bW,b1.bH);
          return 1;
         //So the state is b1.str;
         }else if(b2.bX <= x && b2.bX+170 >= x && b2.bY <= y && b2.bY+60 >= y){
            fill(0,255,0);
          rect(b2.bX,b2.bY,b2.bW,b2.bH);
           return 2;
         //So the state is b2.str;
         }else if(b3.bX <= x && b3.bX+100 >= x && b3.bY <= y && b3.bY+60 >= y){
           fill(255,0,255);
          rect(b3.bX,b3.bY,b3.bW,b3.bH);
           return 3;
         //So the state is b3.str;
       }
 
      }
      
    }
   }
    return 0;  
  }
}