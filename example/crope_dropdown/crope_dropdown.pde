/**
* GUI CROPE EXAMPLE
* Processing 3.5.3
* Rope Library 0.8.3.29
* 2016-2019
* v 0.1.1
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
	int rank_box_position = 1;

  dropdown[0].wheel(true);
  dropdown[0].set_box(num_box_display, rank_box_position);
  
  rank_box_position = 2;
  dropdown[1].wheel(true);
  dropdown[1].set_box(num_box_display, rank_box_position);

}


void dropdown_draw() {
  dropdown[0].update(mouseX,mouseY);
  dropdown[0].show();
  int x = dropdown[0].get_pos().x + dropdown[0].get_header_text_pos().x;
  int y = dropdown[0].get_pos().y + dropdown[0].get_size().y + dropdown[0].get_header_text_pos().y;
  // dropdown[0].show_selection(x,y);
  
  
  dropdown[1].update(mouseX,mouseY);
  dropdown[1].show();
  x = dropdown[1].get_pos().x + dropdown[1].get_header_text_pos().x;
  y = dropdown[1].get_pos().y + dropdown[1].get_size().y + dropdown[1].get_header_text_pos().y;
  dropdown[1].show_selection(x,y);
}





/**
Processing and Rope event
*/
void mouseWheel(MouseEvent e) {
	scroll(e);
}
