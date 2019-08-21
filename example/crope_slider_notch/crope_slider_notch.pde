/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.8.5.30
* 2016-2019
* v 0.1.4
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

Slotch slotch ;
void slotch_setup(int x, int y) {
  int num_notch = 10;
  int size_y = 20;
  // option 1
  int len = size_y *num_notch + size_y;
  slotch = new Slotch(vec2(x,y),vec2(len,size_y),num_notch);

  // option 2
  // slotch.set_notch(6); // buggy
  slotch.set_value(.5);
  slotch.set_molette(ELLIPSE);
  slotch.set_rounded(20);
}


void slotch_draw() {
  slotch.update(mouseX,mouseY);

  slotch.show_structure();
  slotch.show_molette();
  // stroke(255);
  // slotch.show_notch();
  // slotch.set_colour_notch(230);
  slotch.set_aspect_notch(230,1);
  slotch.show_notch(-5,10);
  println("value",slotch.get(0));
}
