import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
 
public class Crope_Bar {
	JFrame frame;
	JMenuBar menu_bar;

	public Crope_Bar(PApplet app) {
		System.setProperty("apple.laf.useScreenMenuBar", "true");
		frame = (JFrame) ((processing.awt.PSurfaceAWT.SmoothCanvas)app.getSurface().getNative()).getFrame();
		menu_bar = new JMenuBar();
		frame.setJMenuBar(menu_bar);
	}

  ArrayList<JMenuItem> menu_item_list = new ArrayList<JMenuItem>();
	void set(String... data) {
		menu_item_list.clear();
		build(data);
		set_listen();
	}

	void build(String... data) {
		JMenu [] menu = new JMenu [data.length];
		for(int i = 0 ; i < data.length ; i++) {
			println(data[i]);
			String[] content = split(data[i],",");
			menu[i] = new JMenu(content[0]);
			menu_bar.add(menu[i]);
			if(content.length > 1) {
				for(int k = 1 ; k < content.length ; k++) {
					if(content[k].equals("|")) {
						menu[i].addSeparator();
					} else {
						JMenuItem menu_item = new JMenuItem(content[k]);
						menu_item_list.add(menu_item);
						menu[i].add(menu_item);
					}
				}
			}
		}
	}
  
	void set_listen() {
		if(menu_item_list.size() > 0) {
			for(JMenuItem mi : menu_item_list) {
				mi.addActionListener(new ActionListener() { 
					public void actionPerformed(ActionEvent arg0) { 
						happen();
					}
		    });
			}
		}
	}

	void watch() {
		if(menu_item_list.size() > 0) {
			for(JMenuItem mi : menu_item_list) {
				// mi.get_something_but_what();
			}
		}

	}


	void happen() {
		println("You have clicked on menu but how use it out this line ?????, because I just can pass a static variable here :(");
	}

	void show() {
		frame.setVisible(true);
	}
  
	void info_item() {
		if(menu_item_list.size() > 0) {
			for(JMenuItem mi : menu_item_list) {
				println("getUIClassID()",mi.getUIClassID());
				println("getText()",mi.getText());
				println("getActionCommand()",mi.getActionCommand());
			}
		}
	}

	void help() {
		println("\npass all menus in differents String to method set(String... menu)");
		println("The menu must have a content separate by coma ','");
		println("the menu content represent the menu title");
		println("for the separor use '|' between two comas\n");
	}
	
 
}

