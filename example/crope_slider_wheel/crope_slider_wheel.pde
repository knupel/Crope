/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.8.5.30
* 2016-2019
* v 0.1.0
* slider wheel
*/

int x = 50;
int y = 50;
void setup() {
  size(400,200);
  slider_setup(x,y);
}

void draw() {
  background(255);
  slider_draw();
}

Slider slider ;
void slider_setup(int x, int y) {
  slider = new Slider(vec2(x,y),vec2(200,20));
  slider.set_label("Wheel well well");
  slider.wheel(true);
}

void slider_draw() {
  slider.update(mouseX,mouseY);
  slider.show_structure();
  slider.show_molette();
  slider.show_label();
  slider.show_value();
}

void mouseWheel(MouseEvent e) {
  scroll(e);
}
