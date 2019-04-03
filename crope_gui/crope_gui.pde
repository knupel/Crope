/**
* GUI CROPE
* Processing 3.5.3
* Rope Library 0.5.1
* 2016-2019
* v 0.2.0
* 
* Name
* 
*/
Crope_Bar cb;

void setup() {
	// size(100,100);
	size(100,100);
	JSONObject menu_bar = new JSONObject();
	// WARNING keep "menu bar" it's the key to build the Crope_Bar, is waiting
	menu_bar.setString("menu bar", "about,file,import,help"); // set the title of the menu

	JSONObject about_ = new JSONObject();
	about_.setString("menu", "information,version");

	JSONObject file_ = new JSONObject();
	file_.setString("menu", "load,load recent+,|,save,save as");
  // here there is "+" a the end of recent that indicate there is a submenu
  file_.setString("load recent", "blaubird.rope,youngtimer.rope"); // set the submenu
  file_.setString("save","callback_type_save");
  file_.setString("save as","prompt,callback_type_save_as,file_name,extension");
 
 	JSONObject import_ = new JSONObject();
	import_.setString("menu", "media,image,video,sound,text,shape,|,folder");

	JSONObject help_ = new JSONObject();
	help_.setString("menu", "controler,prescene,scene");
  
  // pass each JSONObject, must be the same than "menu bar" setting
	menu_bar.setJSONObject("about", about_);
	menu_bar.setJSONObject("file", file_);
	menu_bar.setJSONObject("import", import_);
	menu_bar.setJSONObject("help", help_);

  build_menu_bar(menu_bar);


	//cb.watch();
	// cb.info_item();
	// cb.help();
	// cb.print_listener();

	saveJSONObject(cb.get_menu(), "data/menu_bar_tree.json");
}

void draw() {
	cb.info_item();
	if(input("image") != null) println(input("image"));
}

void keyPressed() {
	// build_menu_bar("Mais que se passe-t-il?");

}


void build_menu_bar(JSONObject content) {
// void build_menu_bar(String... content) {
	cb = new Crope_Bar(this);
	cb.set(content);
	// cb.set("file,load,save,save as");
	/*
	cb.set("about",
				"file,load,load recent,|,save,save as",
				"import,import image,import movie",
				"help,controler,prescene,scene");
				*/
	cb.show();
}


void callback_type_save() {
	println("save the current file");
}

void callback_type_save_as(File selection) {
	println(selection.getAbsolutePath());
}












