/**
* GUI CROPE
* Processing 3.5.3
* Rope Library 0.5.1
* 2016-2019
* v 0.3.0
* 
* Make your Menu bar
* 
*/
Crope_Bar cb;

void setup() {
	size(100,100);
	// menu_bar_load();
	menu_bar_write();
	cb.help();
}

void draw() {
}

void keyPressed() {
	// to update menu, you need to catch the JSONObject of your Menu and update the content of this one.
	cb.get_menu().getJSONObject("file").setString("load recent","new_path/item.psd,other_path/with_a new super file.jpg,un fichier de patate.jpg");
	build_menu_bar(cb.get_menu());
}

void menu_bar_load() {
	JSONObject menu_bar = loadJSONObject("menu.json");
	build_menu_bar(menu_bar);
}


void menu_bar_write() {
	JSONObject menu_bar = new JSONObject();
	write_menu(menu_bar);
	build_menu_bar(menu_bar);
	saveJSONObject(cb.get_menu(), "data/menu_bar_tree.json");
}

void write_menu(JSONObject menu_bar) {
		// WARNING keep "menu bar" it's the key to build the Crope_Bar, is waiting
	menu_bar.setString("menu bar", "about,file,import,help"); // set the title of the menu

	JSONObject about_ = new JSONObject();
	about_.setString("menu", "information,version");

	JSONObject file_ = new JSONObject();
	file_.setString("menu", "load>o>cmd,load recent+,|,save>s>cmd,save as>s>cmd>shift,save as a copy>s>cmd>shift>alt");
  // here there is "+" a the end of recent that indicate there is a submenu
  file_.setString("load recent", "blaubird.rope,youngtimer.rope"); // set the submenu and dynamic menu
 
 	JSONObject import_ = new JSONObject();
	import_.setString("menu", "import media>i>cmd,import image,import video,import sound,import text,import shape,|,import folder");

	JSONObject help_ = new JSONObject();
	help_.setString("menu", "controler!?,prescene?,scene?");
  
  // pass each JSONObject, must be the same than "menu bar" setting
	menu_bar.setJSONObject("about", about_);
	menu_bar.setJSONObject("file", file_);
	menu_bar.setJSONObject("import", import_);
	menu_bar.setJSONObject("help", help_);

}
 

void build_menu_bar(JSONObject content) {
	cb = new Crope_Bar(this);
	cb.set(content);
	cb.show();
}
