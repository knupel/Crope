/**
* CROPE BAR
* Control ROmanesco Processing Environment
* v 0.1.0
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

import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

import java.awt.event.KeyEvent;
import javax.swing.KeyStroke;
 
public class Crope_Bar {
	PApplet app;
	JSONObject json;
	JFrame frame;
	JMenuBar menu_bar;
  boolean you_can_build = false;
  int id_menu_item = 0;
  final String [] action_name = new String[500];
	public Crope_Bar(PApplet app) {
		this.app = app;

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
			String[] content = json.getJSONObject(data[i]).getString("menu").split(",");
			menu[i] = new JMenu(data[i]); // prompt
			menu_bar.add(menu[i]);
			set_menu_item(data[i],menu[i],content);
		}
	}

	private void set_menu_item(String title_prompt, JMenu j_menu, String [] content) {
		for(int i = 0 ; i < content.length ; i++) {
			if(content[i].equals("|")) {
				j_menu.addSeparator();
			} else {
				if(content[i].endsWith("+")) {
					String prompt = content[i].substring(0,content[i].length()-1);
					String [] sub_content = json.getJSONObject(title_prompt).getString(prompt).split(",");
					JMenu sub_menu_item = new JMenu(prompt); // prompt
					j_menu.add(sub_menu_item);
					add_sub_menu_item(sub_menu_item, sub_content);
				} else {
					id_menu_item++;
					// JMenuItem menu_item = new JMenuItem(content[i], KeyEvent.VK_O); // prompt
					JMenuItem menu_item = new JMenuItem(content[i]); // prompt
					// menu_item.setMnemonic(KeyEvent.VK_O); // don't work
					// menu_item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, ActionEvent.ALT_MASK)); // alt+R
					// menu_item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R,ActionEvent.CTRL_MASK)); // ^R
					// menu_item.setAccelerator(KeyStroke.getKeyStroke('r')); // R
					// menu_item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R,ActionEvent.SHIFT_MASK)); // shift + R
					// menu_item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R,ActionEvent.SHIFT_DOWN_MASK)); // shift + R // don't work
					// menu_item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, ActionEvent.SHIFT_MASK | ActionEvent.ALT_MASK)); // alt + shift + R
					// menu_item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, ActionEvent.META_MASK)); // CMD + R
					menu_item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, ActionEvent.ALT_GRAPH_MASK)); // don't work
					j_menu.add(menu_item);
					action_name[id_menu_item] = content[i];
					C_Menu_Item cmi = new C_Menu_Item(content[i],id_menu_item,menu_item);
					menu_item_list.add(cmi);
				}				
			}
		}
	}

	JMenu_item set_accelarator(String [] info) {
		if(info.length == 1) {

		} else if (info.length == 2) {

		} else if (info.length == 3) {
			
		}
	}

  private void add_sub_menu_item(JMenu j_sub_menu, String [] content) {
		for(int i = 0 ; i < content.length ; i++) {
			id_menu_item++;
			JMenuItem menu_item = new JMenuItem(content[i]); // prompt
			j_sub_menu.add(menu_item);
			action_name[id_menu_item] = content[i];
			C_Menu_Item cmi = new C_Menu_Item(content[i],id_menu_item,menu_item);
			menu_item_list.add(cmi);
		}
	}



  // SET LISTENER
	private void set_listener() {
		if(menu_item_list.size() > 0) {
			for(C_Menu_Item cmi : menu_item_list) {
        final String which_action = action_name[cmi.get_id()];
				cmi.get_menu_item().addActionListener(new ActionListener() { 
					public void actionPerformed(ActionEvent ae) {
						what_happen_in_menu(which_action, ae);
					}
		    });
			}
		}
	}




	private class C_Menu_Item {
		protected int id = 0;
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

		protected JMenuItem get_menu_item() {
			return j_menu_item;
		}
	}
  




	public void show() {
		if(you_can_build) {
			frame.setVisible(true);
		}
	}
  

  // get
	public void info_item() {
		if(menu_item_list.size() > 0) {
			// println("frameCount",frameCount);
			for(C_Menu_Item cmi : menu_item_list) {
				JMenuItem mi = cmi.get_menu_item();
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
			println("\npass all menus in differents String to method set(JSONObject)");
			println("");
			println("The menu must have a content separate by coma ','");
			println("The name of menu have a submenu need to finish by '+'");
			println("");
			println("for the separor use '|' between two comas\n");
		}
	}

	public JSONObject get_menu() {
		return json;
	}
}

