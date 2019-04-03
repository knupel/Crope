/**
* CROPE BAR
* Control ROmanesco Processing Environment
* v 0.0.4
* Copyleft (c) 2019-2019
* Processing 3.5.3
* Rope library 0.5.1
* @author @stanlepunk
* @see https://github.com/StanLepunK/Crope
*/

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
 
public class Crope_Bar {
	JSONObject json;
	JFrame frame;
	JMenuBar menu_bar;
  boolean you_can_build = false;
  int id_menu_item = 0;
	public Crope_Bar(PApplet app) {
		
		if(get_renderer().equals("processing.awt.PGraphicsJava2D")) {
			you_can_build = true;
		} else {
      // com.jogamp.newt.opengl.GLWindow glw = (com.jogamp.newt.opengl.GLWindow)app.getSurface().getNative();
			// println(glw);
			printErr("Use class Crope_Bar with",get_renderer(),"is not possible. change your renderer to JAVA2D");
		}


		if(you_can_build) {
			if(get_os_family().equals("mac")) {
				System.setProperty("apple.laf.useScreenMenuBar","true");
			}
			frame = (JFrame) ((processing.awt.PSurfaceAWT.SmoothCanvas)app.getSurface().getNative()).getFrame();
			menu_bar = new JMenuBar();
			frame.setJMenuBar(menu_bar);
		}
	}

  ArrayList<C_Menu_Item> menu_item_list = new ArrayList<C_Menu_Item>();
	// public void set(String... data) {
	public void set(JSONObject json) {
		this.json = json;
		if(you_can_build) {
			menu_item_list.clear();
			build();
			set_listener();
		}
	}

	private void build() {
		String [] data = split(json.getString("menu bar"),",");
		JMenu [] menu = new JMenu [data.length];
		id_menu_item = 0;
		for(int i = 0 ; i < data.length ; i++) {
			String[] content = split(json.getString(data[i]),",");
			menu[i] = new JMenu(data[i]); // prompt
			menu_bar.add(menu[i]);
			// String[] new_arr = Arrays.copyOfRange(content, 1, content.length);
			set_menu_item(menu[i],content);
		}
	}

	private void set_menu_item(JMenu j_menu, String [] content) {
		for(int i = 0 ; i < content.length ; i++) {
			if(content[i].equals("|")) {
				j_menu.addSeparator();
			} else {
				if(content[i].endsWith("+")) {
					String prompt = content[i].substring(0,content[i].length()-1);
					String [] sub_content = json.getString(prompt).split(",");
					JMenu sub_menu_item = new JMenu(prompt); // prompt
					j_menu.add(sub_menu_item);
					//String[] new_arr = Arrays.copyOfRange(sub_content, 1, sub_content.length);
					add_sub_menu_item(sub_menu_item, sub_content);


				} else {
					id_menu_item++;
					JMenuItem menu_item = new JMenuItem(content[i]); // prompt
					j_menu.add(menu_item);
					C_Menu_Item cmi = new C_Menu_Item(content[i],id_menu_item,menu_item);
					menu_item_list.add(cmi);
				}
						
			}
		}
	}

	private void add_sub_menu_item(JMenu j_sub_menu, String [] content) {
		for(int i = 0 ; i < content.length ; i++) {
			id_menu_item++;
			// JMenuItem menu_item = new JMenuItem(content[i]);
			j_sub_menu.add(content[i]);
		}
	}



  

  /**
  * OPTION MENU
  * This part can become very very huge !!!!!
  */
	String import_image = "import image";
	String import_media = "import media";
	String import_shape = "import shape";
	String import_text = "import text";
	String import_movie = "import movie";

	String import_folder = "import folder";
	String load_file = "load";
	String load_recent_file = "load recent";
	String save_file = "save";
	String save_as_file = "save as";

	private void set_listener() {
		if(menu_item_list.size() > 0) {
			// for(JMenuItem mi : menu_item_list) {
			for(C_Menu_Item cmi : menu_item_list) {
				// println("setting",cmi.get_name(),cmi.get_id());
				if(cmi.get_name().toLowerCase().equals(import_image)) {
					cmi.get_menu().addActionListener(new ActionListener() { 
						public void actionPerformed(ActionEvent ae) {
							select_input("image");
							println("action event:",import_image);
						}
			    });
				} else if(cmi.get_name().toLowerCase().equals(import_media)) {
					cmi.get_menu().addActionListener(new ActionListener() { 
						public void actionPerformed(ActionEvent ae) {
							select_input("media");
							println("action event:",import_image);
						}
			    });
				} else if(cmi.get_name().toLowerCase().equals(import_shape)) {
					cmi.get_menu().addActionListener(new ActionListener() { 
						public void actionPerformed(ActionEvent ae) {
							select_input("shape");
							println("action event:",import_shape);
						}
			    });
				} else if(cmi.get_name().toLowerCase().equals(import_text)) {
					cmi.get_menu().addActionListener(new ActionListener() { 
						public void actionPerformed(ActionEvent ae) {
							select_input("text");
							println("action event:",import_text);
						}
			    });
				} else if(cmi.get_name().toLowerCase().equals(import_movie)) {
					cmi.get_menu().addActionListener(new ActionListener() { 
						public void actionPerformed(ActionEvent ae) {
							select_input("movie");
							println("action event:",import_movie);
						}
			    });
				} else if(cmi.get_name().toLowerCase().equals(import_folder)) {
					cmi.get_menu().addActionListener(new ActionListener() { 
						public void actionPerformed(ActionEvent ae) {
							select_folder();
							println("action event:",import_folder);
						}
			    });
				} else if(cmi.get_name().toLowerCase().equals(load_file)) {
					cmi.get_menu().addActionListener(new ActionListener() { 
						public void actionPerformed(ActionEvent ae) { 
							select_input("load");
							println("action event:",load_file);
						}
			    });
				} else if(cmi.get_name().toLowerCase().equals(load_recent_file)) {
					cmi.get_menu().addActionListener(new ActionListener() { 
						public void actionPerformed(ActionEvent ae) {
							select_input("load");
							println("action event:",load_recent_file);
						}
			    });
				} else if(cmi.get_name().toLowerCase().equals(save_file)) {
					cmi.get_menu().addActionListener(new ActionListener() { 
						public void actionPerformed(ActionEvent ae) { 
							println("action event:",save_file);
						}
			    });
				} else if(cmi.get_name().toLowerCase().equals(save_as_file)) {
					cmi.get_menu().addActionListener(new ActionListener() { 
						public void actionPerformed(ActionEvent ae) { 
							println("action event:",save_as_file);
						}
			    });
				} else {
					cmi.get_menu().addActionListener(new ActionListener() { 
						public void actionPerformed(ActionEvent ae) { 
							println("action event: unknow action, check catalogue action > void name.action_event()");
						}
			    });;
				}
			}
		}
	}

 
	public void action_event() {
		if(you_can_build) {
			println(import_image, import_media, import_shape, import_text, import_movie,
				import_folder,
				load_file, load_recent_file,
				save_file, save_as_file);
		}
	}




	private class C_Menu_Item {
		protected int id;
		protected String name;
		protected JMenuItem j_menu_item;
		C_Menu_Item(String name, int id, JMenuItem j_menu_item) {
			this.name = name;
			this.id = id;
			this.j_menu_item = j_menu_item;
		}

		protected String get_name() {
			return name;
		}

		protected int get_id() {
			return id;
		}

		protected JMenuItem get_menu() {
			return j_menu_item;
		}
	}
  





	public void watch() {
		if(you_can_build && menu_item_list.size() > 0) {
			/*
			for(JMenuItem mi : menu_item_list) {
				// mi.get_something_but_what();
			}
			*/
		}

	}




	public void show() {
		if(you_can_build) {
			frame.setVisible(true);
		}
	}
  
	public void info_item() {
		if(menu_item_list.size() > 0) {
			// println("frameCount",frameCount);
			for(C_Menu_Item cmi : menu_item_list) {
				JMenuItem mi = cmi.get_menu();
			//for(JMenuItem mi : menu_item_list) {
				// println("getUIClassID()",mi.getUIClassID());
				//println("getText()",mi.getText());
				// println("getActionCommand()",mi.getActionCommand());
				// println("getAction()",mi.getAction());
				// println("getAction()");
				// printArray(mi.getActionListeners());
			}
		}
	}

	public void help() {
		if(you_can_build) {
			println("\npass all menus in differents String to method set(String... menu)");
			println("");
			println("The menu must have a content separate by coma ','");
			println("The sub menu must have a content separate by coma '%'");
			println("the first element of the menu or sub menu array represent the menu prompt");
			println("");
			println("for the separor use '|' between two comas\n");
		}
	}
}

