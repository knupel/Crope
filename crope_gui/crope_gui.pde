/**
* GUI CROPE EXAMPLE

* dependancies
* Processing 3.5.3
* Rope Library 0.8.5.30
* 2016-2019
* v 0.1.3
*/




/**
* Turn button
*/
int x = 60;
int y = 60 ;
void setup() {
  size(160,160);
  set_turn_button(x,y); 
}


void draw() {
	background(125);
	draw_turn_button();
}

Butturn butturn ;
void set_turn_button(int x, int y) {
	butturn = new Butturn(vec2(x,y),50);
	butturn.set_is(true);
	butturn.set_colour_in_on(r.GREEN);
	butturn.set_colour_out_on(r.SAPIN);
	butturn.set_colour_in_off(r.RED);
	butturn.set_colour_out_off(r.BLOOD);
	// button.set_aspect_on_off(r.GREEN,r.SAPIN,r.RED,r.BLOOD);
	butturn.set_pos_label(0,20);
	butturn.set_label("Turn me please");
}


void draw_turn_button() {
	butturn.update(mouseX,mouseY);
	butturn.rollover(true);

	butturn.show_label();
	butturn.show();
	//buturn.show(ELLIPSE,true);
	//button.show(RECT,true);

	println(butturn.is());
}


void mousePressed() {
	if(butturn.inside()) {
		butturn.switch_is();
	}
}

void mouseReleased() {
	if(butturn.inside()) {
		butturn.switch_is();
	}
}
