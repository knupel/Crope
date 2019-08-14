/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.8.3.29
* 2016-2019
* v 0.1.0
* slider adjustable
*/



int x = 20 ;
int y = 20 ;
void setup() {
  size(400,200); 
  slider_adjustable_setup(x,y); 
}

/**
* adjute the min and max of your slider by click and move 
* the handle of the average line that you see in the middle of the slider
*/
void draw() {
	background(0);
	slider_adjustable_draw();
}




/**
ADJUTABLE
*/
Sladj sladj ;
void slider_adjustable_setup(int x, int y) {
	sladj = new Sladj(vec2(x,y),vec2(200,20));
  sladj.set_molette(ELLIPSE);
  sladj.set_rounded(20);
  sladj.set_molette_pos_norm(.25);
  // slider.wheel(true);
}


void slider_adjustable_draw() {
	// sladj.select(keyPressed); // by default select is mousePressed arg
	// sladj.select(mousePressed, keyPressed);
	sladj.select(true);
	sladj.update(mouseX,mouseY);
	if(!sladj.inside_max() && !sladj.locked_max_is()) {
    sladj.inside_min();
    sladj.select_min(keyPressed);
    sladj.update_min();
  }
  // max molette
  if(!sladj.inside_min() && !sladj.locked_min_is()) {
    sladj.inside_max();
    sladj.select_max(keyPressed);
    sladj.update_max();
  }
  sladj.update_min_max();

	sladj.show_structure();
	sladj.show_adj();
	sladj.show_molette();
}
