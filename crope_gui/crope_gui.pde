/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
*
* color palette picker
* 2016-2020
* v 0.0.1
*/

/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.8.8.34
* 2016-2021
* v 0.1.6
* slotch
*/

int x = 30;
int y = 40 ;
void setup() {
  size(800,200);
  slotch_setup(x,y); 
}


void draw() {
  background(0);
  slotch_draw();
}

Slotch slotch;
void slotch_setup(int x, int y) {
  int num_notch = 10;
  int size_y = 20;
  // bbasic setting via construor or via method
  int len = size_y *num_notch + size_y;
  // slotch = new Slotch(vec2(x,y),vec2(len,size_y),num_notch);
  // slotch = new Slotch("Bad slotch", vec2(x,y),vec2(len,size_y),num_notch);
  slotch = new Slotch();
  slotch.pos(x,y);
  slotch.size(len,size_y);
  slotch.set_notch(num_notch);

  // other setting
  // slotch.set_value(0.5); // use normal position from [0.0, 1.0]
  slotch.set_value(0); // use position from [0, int num_of_notch]
  slotch.set_molette(ELLIPSE);
  slotch.set_rounded(20);
  println("slotch.get_type():", slotch.get_type());
}


void slotch_draw() {
  slotch.update(mouseX,mouseY);

  slotch.show_structure();
  slotch.show_molette();
  // stroke(255);
  // slotch.show_notch();
  // slotch.set_colour_notch(230);
  
  // slotch.set_aspect_notch(230,1); // What is it ????
  
  // notch is separator
  slotch.show_notch(-5,10);
  println("value",slotch.get(0));
}

/*

IN PROGRESS
Palette palette;
Palette_Selector palette_selector;
Slider slider;

int x = 30;
int y = 40 ;
void setup() {
	size(600,600);
	// colorMode (HSB, 255 );
	println(r.VERSION);
	slider_setup(x, y);
	palette_setup(x, y +40, width/2, height/2);
	palette_selector_setup(x, height -y, width/2, 50);
	// palette_setup(x, y +40, 300, 300);
}


void draw() {
	background(0);
	float hue = slider_draw();
	palette_draw(hue);
}


void slider_setup(int x, int y) {
	slider = new Slider(vec2(x,y),vec2(200,20));
	slider.set_label("color choice");
	slider.set_molette(ELLIPSE);
	slider.set_rounded(20);
	slider.set_value(0.75);
}

void palette_setup(int px, int py, int sx, int sy) {
	// palette = new Palette(vec2(x,y),radius);
	// vec2 pos = vec2(px, py);
 //  vec2 size = vec2(sx, sy);
  palette = new Palette(vec2(px,py), vec2(sx, sy));
  palette.set_stroke(r.BLANC);
}


void palette_selector_setup(int px, int py, int sx, int sy) {
	palette_selector = new Palette_Selector(px, py, sx, sy);
	palette_selector.pos_label(px, py);
	palette_selector.set_name("validate");
	palette_selector.set_fill_label(r.ROUGE);

	palette_selector.set_fill(r.NOIR);
	palette_selector.set_stroke(r.BLANC);
	palette_selector.set_thickness(1.0);
}

void palette_selector_draw() {
	palette_selector.set_color_picker(palette.get_color());
}

float slider_draw() {
	slider.update(mouseX,mouseY);
	slider.show_structure();
	slider.show_molette();
	slider.show_label();
	return slider.get(0);
}




void palette_draw(float hue) {
	palette.show(hue);
}
*/




