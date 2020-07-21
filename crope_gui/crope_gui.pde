/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
*
* color palette picker
* 2016-2020
* v 0.0.1
*/



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




