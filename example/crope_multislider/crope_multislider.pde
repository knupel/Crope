/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.5.1
* 2016-2018
* v 0.1.0
* multi slider
*
*/

int x = 20 ;
int y = 20 ;
void setup() {
  size(400,200);
  multi_slider_setup(x,y);
}

void draw() {
	background(0);
  multi_slider_draw();
}





/**
SLIDER MULTI
*/
Slider multi_slider ;
void multi_slider_setup(int x, int y) {
	multi_slider = new Slider(ivec2(x,y),ivec2(200,20));
	// multi_slider.set_molette(ELLIPSE);
	multi_slider.set_molette_num(3);
	multi_slider.size_molette(5,40);
  multi_slider.set_rounded(20);

  // choice the num of molette, the position is set automaticly
  // multi_slider.set_molette_pos_norm(.25,.5,.75); // choice the molette position the the num is autmatcly increment.
  println(multi_slider.get_rank());
}

void multi_slider_draw() {
	// multi_slider.select(keyPressed); // by default select is mousePressed arg
	// multi_slider.select(mousePressed, keyPressed);
	
	multi_slider.update(mouseX,mouseY);
	// multi_slider.select(true);
	multi_slider.show_structure();
	multi_slider.show_molette();
	
}





/**
Processing and Rope event
*/
void mouseWheel(MouseEvent e) {
	scroll(e);
}



