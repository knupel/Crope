import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ButtonGroup;
import javax.swing.JCheckBoxMenuItem;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JRadioButtonMenuItem;
 
public class Menu_popup extends JFrame {
	String name;
	int width;
	int height;

	public Menu_popup(String name, int width, int height) {
		this.name = name;
		this.width = width;
		this.height = height;
		setTitle(name);
		setSize(this.width,this.height);
		// Creates a menubar for a JFrame
		JMenuBar menu_bar = new JMenuBar();
		// Add the menubar to the frame
		setJMenuBar(menu_bar);
		// Define and add two drop down menu to the menubar
		JMenu import_menu = new JMenu("import");
		JMenu text_menu = new JMenu("text");
		JMenu shape_menu = new JMenu("shape");
		JMenu image_menu = new JMenu("image");
		JMenu video_menu = new JMenu("video");

		menu_bar.add(import_menu);
		menu_bar.add(text_menu);
		menu_bar.add(shape_menu);
		menu_bar.add(image_menu);
		menu_bar.add(video_menu);

		// Create and add simple menu item to one of the drop down menu
		JMenuItem new_file = new JMenuItem("Import file");
		JMenuItem new_folder = new JMenuItem("Import folder");
		JMenuItem action_exit = new JMenuItem("Exit");
		/*
		JMenuItem openAction = new JMenuItem("Open");
		JMenuItem exitAction = new JMenuItem("Exit");
		JMenuItem cutAction = new JMenuItem("Cut");
		JMenuItem copyAction = new JMenuItem("Copy");
		JMenuItem pasteAction = new JMenuItem("Paste");
		*/

		// Create and add CheckButton as a menu item to one of the drop down
		// menu
		JCheckBoxMenuItem checkAction = new JCheckBoxMenuItem("Check Action");
		// Create and add Radio Buttons as simple menu items to one of the drop
		// down menu
		JRadioButtonMenuItem radioAction1 = new JRadioButtonMenuItem("Radio Button1");
		JRadioButtonMenuItem radioAction2 = new JRadioButtonMenuItem("Radio Button2");

		// Create a ButtonGroup and add both radio Button to it. Only one radio
		// button in a ButtonGroup can be selected at a time.
		ButtonGroup bg = new ButtonGroup();
		bg.add(radioAction1);
		bg.add(radioAction2);
		import_menu.add(new_file);
		import_menu.add(new_folder);
		import_menu.addSeparator();
		import_menu.add(action_exit);

		/*
		import_menu.add(checkAction);
		import_menu.addSeparator();
		import_menu.add(exitAction);

		text_menu.add(cutAction);
		text_menu.add(copyAction);
		text_menu.add(pasteAction);
		text_menu.addSeparator();
		text_menu.add(radioAction1);
		text_menu.add(radioAction2);
		*/

		// Add a listener to the New menu item. actionPerformed() method will
		// invoked, if user triggred this menu item
		new_file.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				System.out.println("You have clicked on the new action");
			}
		});
	}

	public void draw() {
		Menu_popup me = new Menu_popup(this.name, this.width, this.height);
		me.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		me.setVisible(true);
	}   
}