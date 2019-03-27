/**
* GUI CROPE
* Processing 3.5.3
* Rope Library 0.5.1
* 2016-2018
* v 0.2.0
* 
* Name
* 
*/
Crope_Bar cb;

void setup() {
	size(100,100);
	cb = new Crope_Bar(this);
	cb.help();
	cb.set("about","file,load,load recent,|,save,save as","import,file,folder","help,controler,prescene,scene");
	cb.show();
	//cb.watch();
	// cb.info_item();
}

void draw() {
	// println(cb.armed_is());
	// cb.info_item();

}






