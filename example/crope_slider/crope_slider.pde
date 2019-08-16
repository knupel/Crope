/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.8.5.30
* 2016-2019
* v 0.1.3
* slider classic
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
  slider.set_label("Paye ton slide");
  slider.set_molette(ELLIPSE);
  slider.set_rounded(20);
  slider.set_value(0.75);
  // slider.set_pos_label(0,-5);
  // slider.set_pos_value(slider.size.x(),-5);
}


void slider_draw() {
  // by default select is mousePressed arg
  slider.select(keyPressed); 
  // slider.select(mousePressed);
  slider.keep_selection(keyPressed);
  
  println("select",slider.select_is());
  println("used",slider.used_is());
  println("value",slider.get(0));

  slider.update(mouseX,mouseY);

  slider.show_structure();
  slider.show_molette();
  slider.show_label(); 

  if(keyPressed) {
    // add array value display under the label, useful when the slider value has mapped
    float new_value = 100 * slider.get(0);
    slider.show_value(new_value);
  } else {
    // display the normal array value return by the slider
    slider.show_value(); 
  }
}
  
