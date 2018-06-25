
  int x = 20 ;
  int y = 20 ;
void setup() {
  size(400,200);
  slider_setup(x,y);
  slider_double_setup(x,y);
  slotch_setup(x,y);
  dropdown_setup(x,y);


}


void draw() {
	background(0);
  
  slider_draw();
 // slider_double_draw();
	// slotch_draw();
	// dropdown_draw();

	stroke(255,0,0);
	line(x,0,x,height);
	line(x+(slider.get_size().x/2),0,x+(slider.get_size().x/2),height);
	line(x+slider.get_size().x,0,x+slider.get_size().x,height);
	line(0,y,width,y);
}





/**
slider
*/
Slider slider ;
void slider_setup(int x, int y) {
	slider = new Slider(iVec2(x,y),iVec2(200,20));
  slider.set_molette(ELLIPSE);
  slider.set_rounded(20);
  slider.set_molette_pos_norm(.25);
  slider.wheel(true);
}


void slider_draw() {
	// slider.select(keyPressed); // by default select is mousePressed arg
	slider.select(mousePressed, keyPressed);
	// slider.select(false);
	slider.update(mouseX,mouseY);
	slider.show_structure();
	slider.show_molette();
}


Slider slider_double ;
void slider_double_setup(int x, int y) {
	slider_double = new Slider(iVec2(x,y),iVec2(200,20));
  slider_double.set_molette(ELLIPSE);
  slider_double.set_rounded(20);
  slider_double.set_molette_pos_norm(.25,.5,.75);
}


void slider_double_draw() {
	// slider_double.select(keyPressed); // by default select is mousePressed arg
	// slider_double.select(mousePressed, keyPressed);
	slider_double.update(mouseX,mouseY);
	slider_double.show_structure();
	slider_double.show_molette();
}
















/**
dropdown
*/
Dropdown [] dropdown;
void dropdown_setup(int x, int y) {
	String [] content_0 = {"chien","chat", "poisson rouge","hamster","rat","souris"};
	String [] content_1 = {"tigre","lynx", "puma","chat","panthère","loup","ours"};
	dropdown = new Dropdown[2];
	dropdown[0] = new Dropdown(iVec2(x,y),iVec2(60,20), "Menu", content_0);
	dropdown[1] = new Dropdown(iVec2(x*8,y),iVec2(60,20), "Menu", content_1);
	int num_box_display = 4 ;
	int rank_box_position = 2;
	for(int i = 0 ; i < dropdown.length;i++) {
		dropdown[i].wheel(true);
		dropdown[i].set_box(num_box_display, rank_box_position);	
	}
	add_dropdown(dropdown);
}


void dropdown_draw() {
	// slider.select(keyPressed); // by default select is mousePressed arg
	// slider.select(mousePressed, keyPressed);
	for(int i = 0 ; i < dropdown.length ;i++) {
		dropdown[i].update(mouseX,mouseY);
		dropdown[i].show();
		int x = dropdown[i].get_pos().x + dropdown[i].get_header_text_pos().x ;
		int y = dropdown[i].get_pos().y + dropdown[i].get_size().y + dropdown[i].get_header_text_pos().y;
		dropdown[i].show_selection(x,y);
	}
	
	
	/*
	println("highlighted",dropdown.get_highlighted());
	println("selected",dropdown.get_selected());
	*/
}


















/**
slider notch
*/
Slotch slotch ;
void slotch_setup(int x, int y) {
	slotch = new Slotch(iVec2(x,y),iVec2(60,20));
	/*
  slotch.set_molette(ELLIPSE);
  slotch.set_rounded(20);
  */
  slotch.set_notch(5).set_molette(ELLIPSE).set_rounded(20);
  //slotch.set_molette(ELLIPSE).set_rounded(20).set_notch(5);
  //slotch.set_notch(5);
}


void slotch_draw() {
	slotch.update(mouseX,mouseY);

	slotch.show_structure();
	slotch.show_molette();
	// stroke(255);
	// slotch.show_notch();
	// slotch.set_colour_notch(230);
	slotch.set_aspect_notch(230,.5);
	slotch.show_notch(-5,10);
}












/**
Processing and Rope event
*/
void mouseWheel(MouseEvent e) {
	scroll(e);
}



