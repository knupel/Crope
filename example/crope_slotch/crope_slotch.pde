/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.8.3.28
* 2016-2019
* v 0.1.2
* slotch
*/





int x = 30;
int y = 40 ;
void setup() {
  size(800,200);
  slotch_setup(x,y); 
}


void draw() {
  // println("truc");
  background(0);
  slotch_draw();
}

Slotch slotch ;
void slotch_setup(int x, int y) {
  // need that to avoid the bug when the size of slider is not in adequation with molette size :(
  int num_notch = 10;
  int size_step_x = 20;
  int len = size_step_x *num_notch + size_step_x;
  slotch = new Slotch(ivec2(x,y),ivec2(len,20),num_notch);
  // slotch = new Slotch(ivec2(x,y),ivec2(200,20),9);
  // slotch = new Slotch(ivec2(x,y),ivec2(200,30),9);
  // slotch.set_notch(10);
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
