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
	// WARNING wait "file" for "save", "save as", "load recent", load
	menu_bar.setString("menu bar", "about,file,import,help"); // set the title of the menu

	JSONObject about_ = new JSONObject();
	about_.setString("menu", "information,version");

	JSONObject file_ = new JSONObject();
	file_.setString("menu", "load,load recent+,|,save,save as");
  // here there is "+" a the end of recent that indicate there is a submenu
  file_.setString("load recent", "blaubird.rope,youngtimer.rope"); // set the submenu and dynamic menu
  file_.setString("save","callback_type_save");
  file_.setString("save as","prompt,callback_type_save_as,file_name,extension");
 
 	JSONObject import_ = new JSONObject();
	import_.setString("menu", "import media,import image,import video,import sound,import text,import shape,|,import folder");

	JSONObject help_ = new JSONObject();
	help_.setString("menu", "controler,prescene,scene");
  
  // pass each JSONObject, must be the same than "menu bar" setting
	menu_bar.setJSONObject("about", about_);
	menu_bar.setJSONObject("file", file_);
	menu_bar.setJSONObject("import", import_);
	menu_bar.setJSONObject("help", help_);

  build_menu_bar(menu_bar);

	// cb.info_item();
	// cb.help();
	// cb.print_listener();

	saveJSONObject(cb.get_menu(), "data/menu_bar_tree.json");
}

void draw() {
	cb.info_item();
	if(input() != null) println("input()",input());
	if(input("image") != null) println("input(\"image\")",input("image"));
	if(input("load") != null) println("input(\"load\")",input("load"));
}

void keyPressed() {
	// to update menu, you need to catch the JSONObject of your Menu and update the content of this one.
	cb.get_menu().getJSONObject("file").setString("load recent","new_path/item.psd");
	build_menu_bar(cb.get_menu());

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
/*
void save() {
	println("Je me sauve vite fait, mal fait");
}


void save_as(File file) {
	println("Je me sauve lentement, mais surement",file);
}
*/













