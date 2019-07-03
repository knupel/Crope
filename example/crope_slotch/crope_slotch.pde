/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.8.3.28
* 2016-2019
* v 0.1.1
* slotch
*/

int x = 20 ;
int y = 20 ;
void setup() {
  size(400,200);
  slotch_setup(x,y); 
}


void draw() {
  background(0);
  slotch_draw();
}


/**
slider notch
*/
Slotch slotch ;
void slotch_setup(int x, int y) {
  slotch = new Slotch(ivec2(x,y),ivec2(200,20),9);
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

  println(slotch.get(0));
  //println(slotch.get_notch());
}
