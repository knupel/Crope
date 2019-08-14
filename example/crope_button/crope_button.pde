/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.8.3.28
* 2016-2019
* v 0.1.3
*/




/**
* Simple button
*/
int x = 60;
int y = 60 ;
void setup() {
  size(160,160);
  button_simple_setup(x,y); 
}


void draw() {
	background(125);
	button_simple_draw();
}

Button button ;
void button_simple_setup(int x, int y) {
	button = new Button(vec2(x,y),vec2(50));
	button.set_is(true);
	button.set_colour_in_on(r.GREEN);
	button.set_colour_out_on(r.SAPIN);
	button.set_colour_in_off(r.RED);
	button.set_colour_out_off(r.BLOOD);
	// button.set_aspect_on_off(r.GREEN,r.SAPIN,r.RED,r.BLOOD);
	button.set_pos_label(20,20);
	button.set_label("Hello World");
}


void button_simple_draw() {
	button.update(mouseX,mouseY);
	button.rollover(true);

	button.show_label();
	
	button.show(ELLIPSE,true);
	//button.show(RECT,true);

	println(button.is());
}


void mousePressed() {
	if(button.inside()) {
		button.switch_is();
	}
}
