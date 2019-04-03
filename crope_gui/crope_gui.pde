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

	JSONObject json = new JSONObject();

  json.setInt("id", 0);
  json.setString("menu bar", "about,file,import,help");
  
  json.setString("about", "information,version");
  json.setString("file", "load,load recent+,|,save,save as");
  json.setString("load recent", "blaubird.rope,youngtimer.rope");
  
  json.setString("import", "media,image,video,sound,text,shape,|,folder");
  
  json.setString("help", "controler,prescene,scene");
/*
	build_menu_bar( "about",
									"file,load,load recent%blaubird.rope%youngtimer.rope,|,save,save as",
									"import,import image,import movie",
									"help,controler,prescene,scene");
									*/

	build_menu_bar(json);
	//cb.watch();
	// cb.info_item();
	cb.help();
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












