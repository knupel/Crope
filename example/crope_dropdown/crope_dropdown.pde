/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.5.1
* 2016-2018
* v 0.1.0
* dropdown
*/

int x = 20 ;
int y = 20 ;
void setup() {
  size(400,200);
  dropdown_setup(x,y); 
}


void draw() {
	background(30);
	dropdown_draw();
}




/**
dropdown
*/
Dropdown [] dropdown;
void dropdown_setup(int x, int y) {
	String [] content_0 = {"chien","chat"};
	//String [] content_0 = {"chien","chat", "poisson rouge","hamster","rat","souris"};
	String [] content_1 = {"tigre","lynx","puma","chat","panthère","lion","guepard","chat sauvage"};
	// String [] content_1 = {"tigre","lynx", "puma","chat","panthère"};
	//String [] content_0 = {"chien","chat"};
	// String [] content_1 = {"tigre","lynx"};
	int num = 2;
	dropdown = new Dropdown[num];
	dropdown[0] = new Dropdown(ivec2(x,y),ivec2(60,20), "Menu", content_0);
	dropdown[1] = new Dropdown(ivec2(x*8,y),ivec2(60,20), "Menu", content_1);
	int num_box_display = 7;
	int rank_box_position = 2;
	for(int i = 0 ; i < dropdown.length;i++) {
		dropdown[i].wheel(true);
		dropdown[i].set_box(num_box_display, rank_box_position);	
	}
}


void dropdown_draw() {
	// slider.select(keyPressed); // by default select is mousePressed arg
	// slider.select(mousePressed, keyPressed);
	for(int i = 0 ; i < dropdown.length ;i++) {
		dropdown[i].update(mouseX,mouseY);
		dropdown[i].show();
		int x = dropdown[i].get_pos().x + dropdown[i].get_header_text_pos().x;
		int y = dropdown[i].get_pos().y + dropdown[i].get_size().y + dropdown[i].get_header_text_pos().y;
		dropdown[i].show_selection(x,y);
	}
	
	/*
	println("highlighted",dropdown.get_highlighted());
	println("selected",dropdown.get_selected());
	*/
}





/**
Processing and Rope event
*/
void mouseWheel(MouseEvent e) {
	scroll(e);
}



