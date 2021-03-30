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
  slotch.set_value(2); // use position from [0, int num_of_notch]
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
