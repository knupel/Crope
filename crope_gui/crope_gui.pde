
  int x = 20 ;
  int y = 20 ;
void setup() {
  size(400,200);
  slider_setup(x,y);
  slotch_setup(x,y);


}


void draw() {
	background(0);
  

  //slider_draw();
	slotch_draw();



	


	

	stroke(255,0,0);
	line(x,0,x,height);
	line(x+(slider.get_size().x/2),0,x+(slider.get_size().x/2),height);
	line(x+slider.get_size().x,0,x+slider.get_size().x,height);
	line(0,y,width,y);
}





/**
slider notch
*/
Slotch slotch ;
void slotch_setup(int x, int y) {
	slotch = new Slotch(iVec2(x,y),iVec2(200,20));
  slotch.set_molette(ELLIPSE);
  slotch.set_rounded(20);
  slotch.set_notch(20);
}


void slotch_draw() {
	slotch.update();

	slotch.show_structure();
	slotch.show_molette();
	// stroke(255);
	// slotch.show_notch();
	slotch.set_colour_notch(230);
	slotch.show_notch(-5,10);

}




/**
slider
*/
Slider slider ;
void slider_setup(int x, int y) {
	slider = new Slider(iVec2(x,y),iVec2(200,20));
  slider.set_molette(ELLIPSE);
  slider.set_rounded(20);
}


void slider_draw() {
	// slider.select(keyPressed); // by default select is mousePressed arg
	// slider.select(mousePressed, keyPressed);
	slider.update();
	slider.show_structure();
	slider.show_molette();
}



