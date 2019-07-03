/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.8.3.29
* 2016-2019
* v 0.1.0
* slider
*/

int x = 20 ;
int y = 20 ;
void setup() {
  size(400,200);
  slider_setup(x,y);
}

void draw() {
	background(0);
	slider_draw();
}


/**
SLIDER CLASSIC
*/
Slider slider ;
void slider_setup(int x, int y) {
	slider = new Slider(ivec2(x,y),ivec2(200,20));
  slider.set_molette(ELLIPSE);
  slider.set_rounded(20);
  slider.set_molette_num(1);
  //slider.set_molette_pos_norm(.25);
  // slider.wheel(true);
}


void slider_draw() {
	// slider.select(keyPressed); // by default select is mousePressed arg
	slider.keep_selection(keyPressed);
	slider.select(mousePressed);
	// println("select",slider.select_is(), frameCount);
	println("used",slider.used_is(), frameCount);
	slider.update(mouseX,mouseY);
	slider.show_structure();
	slider.show_molette();

	slider.show_label(); 

	slider.show_value(1.2); // add array value display under the label, useful when the slider value has mapped
	slider.show_value(); // display the normal array value return by the slider
}
