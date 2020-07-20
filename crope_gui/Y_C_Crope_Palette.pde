/**
* PALETTE
* v 0.0.1
* 2020-2020
*/
class Palette extends Crope {
  vec2 target_pos;
  int density = 0;
  int color_mode = HSB;
  
  color newColor, currentColor, colorWrite;
  boolean inside, locked, validate;
  
  Palette (vec2 pos, vec2 size) {
  	super("Palette");
  	// this.color_mode = color_mode;
    this.pos(pos); 
    this.size(size);
    this.target_pos = vec2(size.x() * 0.5 + pos.x(), size.y() * 0.5 + pos.y());
    currentColor = color(g.colorModeX * 0.5, g.colorModeY * 0.5, g.colorModeZ * 0.5);
  }
  
  void show(float hue) {
    int px = round(this.pos.x());
    int py = round(this.pos.y());
    int sx = round(this.size.x());
    int sy = round(this.size.y());

    // float max_x = this.size.x();
    // float max_y = this.size.y();

		float step_x = 1.0 / this.size.x();
		float step_y = 1.0 / this.size.y();
		println(step_x,step_y);
		// float step_x = 1.0;
		// float step_y = 1.0;

   //  if(g.colorMode != HSB) {
    	// colorMode(HSB,g.colorModeX);
   //  }
   colorMode(HSB,1);

    // hue *= g.colorModeX;
		for (float x = 0 ; x < 1.0 ; x += step_x) {
			for (float y = 0 ; y < 1.0 ; y += step_y) {
        int c = color(hue, x ,y);
        set(int(x * size.x() + px), int(y * size.y() + py), c);
      }
    }
    pipette();
  }
  
  
  // Pipette
  void pipette() {
    checkPipette(); // look if the pipette are in the area or not
    returnNewColor(); // give the value of new color selected by pipette
    
    strokeWeight(1) ;
    colorWrite(newColor);
    stroke(colorWrite);
    fill(newColor);
    ellipseMode(CENTER);
    ellipse(target_pos.x(), target_pos.y(), 40, 40);
  }
  
  void checkPipette() {
    if(		mouseX < this.size.x() + this.pos.x() && mouseX > this.pos.x() 
    	&& 	mouseY < this.size.y() + this.pos.y() && mouseY > this.pos.y() 
			&&	mousePressed) {
          this.target_pos.x(mouseX);
          this.target_pos.y(mouseY);
    }
  }
  
  //board color
  // new color
  void newColor(PVector posNC, PVector sizeNC) {
    strokeWeight(1);
    stroke(185);
    fill(newColor);
    rect(posNC.x, posNC.y, sizeNC.x, sizeNC.y);
    
    colorWrite(newColor);
    fill(colorWrite);
    String newHexColor = hex(newColor) ;
    println(newHexColor) ;
    text(newHexColor , posNC.x +5 , posNC.y +5 +(sizeNC.y /2.0) );
  }
  // current color
  void currentColor(PVector posCC, PVector sizeCC) {
    strokeWeight(1);
    stroke (185);
    fill(currentColor);
    rect(posCC.x, posCC.y, sizeCC.x, sizeCC.y ) ;
    
    colorWrite(currentColor) ;
    fill(colorWrite) ;
    String currentHexColor = hex(currentColor) ;
    println(currentHexColor) ;
    text( currentHexColor , posCC.x +5 , posCC.y +5 +(sizeCC.y /2.0) );
  }
  
  /////////////////////////////////
  //button
  void buttonValidate (vec2 posB, vec2 sizeB, color buttonIN, color buttonOUT, color buttonBorderIN, color buttonBorderOUT, int buttonThickness, int typeOfButton, String title, color colorTitle) {
    if ( mouseX < sizeB.x + posB.x && mouseX > posB.x && mouseY < sizeB.y + posB.y && mouseY > posB.y) {
      inside = true ;
      fill(buttonIN) ;
    } else {
      inside = false ;
      fill (buttonOUT) ;
    }
    if(mousePressed && inside)    locked = true ;
    if(!mousePressed)             locked = false ;
    
    if(locked) currentColor = newColor ;
    
    if ( typeOfButton < 1 || typeOfButton > 2 ) rect(posB.x, posB.y, sizeB.x, sizeB.y ) ;
    
    if ( typeOfButton == 1  ) rect(posB.x, posB.y, sizeB.x, sizeB.y ) ;
    if ( typeOfButton == 2  ) { 
      ellipseMode(CORNER) ;
      ellipse(posB.x, posB.y, sizeB.x, sizeB.y);
    }
    fill(colorTitle) ;
    text (title, posB.x +5, posB.y +5 +(sizeB.y /2.0) ) ;
  }
  
  ///RETURN/////////////
  color colorWrite(color colorRef)
  {
    if( brightness( colorRef ) < 170 ) {
      colorWrite = color(185) ;
    } else {
      colorWrite = color(10) ;
    }
    return colorWrite ;
  }
  /////////
  color returnNewColor() {
    newColor = get(round(target_pos.x()), round(target_pos.y()) ) ;
    return newColor ;
  }
   
}