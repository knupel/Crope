/**
* CROPE DROPDOWN 
* v 0.3.2
* 2018-2019
* method to know is dropdown is active or not
* Add dropdown must use when the dropdown is build.
*/

boolean dropdown_is() {
  boolean locked = false ;
  for(Crope crope : get_crope()) {
    if(crope != null) {
      if(crope instanceof Dropdown) {
        Dropdown dd = (Dropdown) crope;
        if(dd.locked_is()) {
          locked = true;
          break;
        }
      }
    }   
  } 
  return locked;
}


/**
* DROPDOWN class
* v 2.7.2
* 2014-2019
*/
public class Dropdown extends Crope {
  // protected boolean selected_type;
  //Slider dropdown
  private Slider slider_dd;
  private vec2 size_box;
  // font
  private PFont font_box;
  //dropdown
  private int line = 0;
  private String content[];

  private boolean locked;
  private boolean slider;
  // private boolean inside_box;
  // color
  private int colour_structure = r.GRAY[4];

  private int colour_box_in = r.GRAY[12];
  private int colour_box_out = r.GRAY[18];

  private int colour_header_in = r.GRAY[12];
  private int colour_header_out = r.GRAY[18]; 

  private int colour_header_text_in = r.GRAY[4];
  private int colour_header_text_out = r.GRAY[8];

  private int colour_box_text_in = r.GRAY[4];
  private int colour_box_text_out = r.GRAY[8];


  private vec2 pos_header_text;
  private vec2 pos_box_text;

  private float pos_ref_x, pos_ref_y ;
  private vec2 change_pos;
  // private float factorPos; // use to calculate the margin between the box
  // box
  private float height_box;
  private int num_box = 9;

  private int start = 0 ;
  private int end = 1 ;
  private int offset_slider = 0 ; //for the slider update
  private float missing ;

  private int box_starting_rank_position = 1;

  private boolean wheel_is = false;

  /**
  CONSTRUCTOR
  */
  public Dropdown(vec2 pos, vec2 size, String name, String [] content) {
    super("Dropdown");
    int size_header_text = int(size.y *.6);
    this.font = createFont("defaultFont",size_header_text);
    int size_content_text = int(size.y *.6);
    this.font_box = createFont("defaultFont",size_content_text);
    this.name = name; 
    this.pos = pos.copy();
    pos_ref_x = pos.x();
    pos_ref_y = pos.y();
    this.size = size.copy(); // header size

    set_box(content.length);
    set_content(content);
    set_box_height(size.y);
    
    int offset_text_x = 2 ;
    float offset_text_header_y = (size.y - size_header_text)/2;
    set_header_text_pos(offset_text_x,size.y -offset_text_header_y);
    float offset_text_content_y = (size_box.y - size_content_text)/2;
    set_box_text_pos(offset_text_x,size_box.y - offset_text_content_y); 
    event = mousePressed;
  }


  public Dropdown set_header_text_pos(vec2 pos) {
    set_header_text_pos(pos.x(), pos.y());
    return this;
  }

  public Dropdown set_header_text_pos(float x, float y) {
    if(pos_header_text == null) {
      this.pos_header_text = new vec2(x,y);
    } else {
      this.pos_header_text.set(x,y);
    }
    return this;
  }


  public Dropdown set_box_text_pos(vec2 pos) {
    set_box_text_pos(pos.x(), pos.y());
    return this;
  }

  public Dropdown set_box_text_pos(float x, float y) {
    if(pos_box_text == null) {
      this.pos_box_text = new vec2(x,y);
    } else {
      this.pos_box_text.set(x,y);
    }
    return this;
  }



  public Dropdown set_colour(R_Colour rc) {
    this.colour_structure = rc.get(0)[0];

    this.colour_header_in = rc.get(0)[1];
    this.colour_header_out = rc.get(0)[2];

    this.colour_header_text_in = rc.get(0)[3];
    this.colour_header_text_out = rc.get(0)[4];

    this.colour_box_in = rc.get(0)[5];
    this.colour_box_out = rc.get(0)[6]; 

    this.colour_box_text_in = rc.get(0)[7];
    this.colour_box_text_out = rc.get(0)[8];
    return this;
  }



  public Dropdown set_box(int num_box) {
    set_box(num_box, this.box_starting_rank_position);
    return this;
  }

  public Dropdown set_box(int num_box, int rank) {
    this.num_box = num_box;
    this.box_starting_rank_position = rank;
    if(content != null && num_box != content.length) {
      set_num_box_rendering(true);
    }
    return this;
  }

  public Dropdown set_box_rank(int rank) {
    this.box_starting_rank_position = rank;
    return this;
  }

  public Dropdown set_box_height(float h) {
    this.height_box = h;
    if(size_box == null) {
      size_box = new vec2(longest_String_pixel(font_box,this.content), this.height_box);
    } else {
      size_box.set(new vec2(longest_String_pixel(font_box,this.content), this.height_box));
    }
    return this;
  }

  public Dropdown set_box_width(int w) {
    size_box.set(w,size_box.y);
    return this;
  }



  public Dropdown set_box_font(String font_name, int size) {
    this.font_box = createFont(font_name,size);
    return this;
  }
  
  public Dropdown set_box_font(PFont font) {
    this.font_box = font;
    return this;
  }

  // content
  public Dropdown set_content(String [] content) {
    boolean new_slider = false ;
    if(this.content == null || this.content.length != content.length) {
      new_slider = true ;
    }
   
    this.content = content;
    set_num_box_rendering(new_slider);
    return this;
  }


  public Dropdown set_name(String name) {
    this.name = name;
    return this;
  }


  private Dropdown set_num_box_rendering(boolean new_slider_is) {
    end = num_box;
    if (content != null) {
      if (end > content.length) {
        end = content.length;
      }
      missing = content.length -end;
      if (content.length > end) {
        slider = true; 
      } else {
        slider = false;
      }
    }

    if (slider && (slider_dd == null || new_slider_is)) {
      build_slider();
    }
    return this;
  }

  





  // get
  private int get_select_line() {
    float content_size_y = ((content.length+1) *size.y()) +pos.y();
    // very quick bug fix, for the case there is only two item in thelist
    if(content.length == 2) {
      content_size_y = ((content.length+2) *size.y()) +pos.y();
    }
    if(cursor.x() >= pos.x() 
      && cursor.x() <= pos.x() +size_box.x() 
      && cursor.y() >= pos.y() && cursor.y() <= content_size_y) {
      //choice the line
      int line = floor((cursor.y() - (pos.y() +size.y())) / size.y()) +offset_slider;
      line -= (box_starting_rank_position -1);
      return line;
    } else {
      return -1; 
    }
  }

  //return which line of dropdown is selected
  int current_line ;
  public int get_selection() {
    float size_temp_y = size_box.y *num_box;
    vec2 temp_size = new vec2(size_box.x, (int)size_temp_y);
    vec2 temp_pos = pos.copy();
    temp_pos.y += (box_starting_rank_position *height_box);
    boolean inside_open_box = inside(temp_pos,temp_size,RECT);
    if(!inside_open_box) {
      line = current_line;
    }
    if(!locked && inside_open_box) {
      if(line >= 0 && line < content.length) {
        current_line = line ;     
      } else {
        printErr("class Dropdown - method get_selected()\nthe line", line, "don't match with any content, the method keep the last content");
      }
    } 
    return current_line;
  }

  //return which line of dropdown is highlighted
  public int get_highlight() {
    return line ;
  }

  public String get_name() {
    return this.name;
  }

  public String [] get_content() {
    return content;
  }

  public int get_num_box() {
    return num_box;
  }

  public PFont get_font_box() {
    return font_box;
  }

  public vec2 get_header_text_pos() {
    return pos_header_text;
  }

  public vec2 get_content_text_pos() {
    return pos_box_text;
  }

  public boolean locked_is() {
    return locked;
  }












  // show
  public void show() {
    show_header();
    show_header_text();
    show_box();
  }

  private void show_selection(float x, float y) {
    if (inside(RECT)) {
      fill(colour_header_text_in); 
    } else {
      fill(colour_header_text_out);
    }
    textFont(font);
    int index = get_selection();
    if(get_selection() >= get_content().length) {
      index = 0;
    }
    if(get_content().length > 0 && get_content()[index] != null) {
      text(get_content()[index],x,y);
    } else {
      text("empty",x,y);
    }
  }
  
  public void show_header() {
    noStroke();
    if (inside(RECT)) {
      fill(colour_header_in); 
    } else {
      fill(colour_header_out);
    }
    rect(pos(),size());
  }

  public void show_header_text(String name) {
    if(name != null) {
      if (inside(RECT)) {
        fill(colour_header_text_in); 
      } else {
        fill(colour_header_text_out);
      }
      textFont(font);
      text(name, pos.x() +pos_header_text.x(), pos.y() +pos_header_text.y());
    }
  }

  public void show_header_text() {
    show_header_text(this.name);
  }


  public void show_box() {
    if(locked) {
      int step = box_starting_rank_position;
      //give the position in list of Item with the position from the slider's molette
      if (slider) {
        offset_slider = round(map(slider_dd.get(0),0,1,0,missing));
      }
      set_box_width(longest_String_pixel(font_box,this.content));
 
      for (int i = start +offset_slider ; i < end +offset_slider ; i++) {  
        if(i < 0) {
          i = 0;
        }

        if(i >= content.length) {
          i = content.length -1;
        }
        
        float pos_temp_y = pos.y() + (size_box.y() *step);
        vec2 temp_pos = new vec2(pos.x(), pos_temp_y);
        boolean inside = inside(temp_pos,size,RECT);
        render_box(temp_pos,content[i],step,inside);
        step++;

        // slider, if necessary show slider
        if(slider) {
          float x = pos.x() -slider_dd.size().x();
          float y = pos.y() +(height_box *box_starting_rank_position);
          slider_dd.pos(x,y);
          slider_dd.update(cursor.x(),cursor.y());
          slider_dd.show_structure();
          slider_dd.show_molette();
        }
      }
    }
  }





  // misc
  public void update(int x,int y) {
    cursor(x,y);
    event = mousePressed;
    open_dropdown();
  }


  private void open_dropdown() {
    boolean inside = inside(RECT);
    if (inside) {
      if(event) {
        locked = true;
      }
    } else if(!inside && event && slider_dd == null) {
      locked = false;
    } else if(!inside && event && slider_dd != null && !slider_dd.inside(RECT)) {
      locked = false;
    }
    if(locked) {
      int result_line = get_select_line();
      if (result_line > -1) {
        line = result_line; 
      }
    }
  }


  private void render_box(vec2 pos, String content, int step, boolean inside) {
    if(content != null) {
    // box part
      noStroke() ;  
      if (inside) {
        fill(colour_box_in); 
      } else {
        fill(colour_box_out);
      }
      int min = 60 ;
      int max = 300 ;
      if (size_box.x < min ) {
        size_box.x = min; 
      } else if(size_box.x > max ) {
        size_box.x = max;
      }
      rect(vec2(pos),vec2(size_box)); 
      // text part
      if (inside(RECT)) {
        fill(colour_box_text_in); 
      } else {
        fill(colour_box_text_out);
      }
      textFont(font_box);
      float x = pos.x +pos_box_text.x;
      float y = pos.y +height_box -(ceil(height_box*.2));
      text(content,x,y);
    }
  }


  public void wheel(boolean wheel_is) {
    this.wheel_is = wheel_is;
  }



  public void offset(int x, int y) {
    pos.set(pos_ref_x, pos_ref_y);
    ivec2 temp = ivec2(x,y);
    pos.add(temp);
    build_slider();
  }

  public void offset(ivec2 offset) {
    offset(offset.x, offset.y);
  }


  private void build_slider() {
    vec2 size_slider = new vec2(round(height_box *.5), round((end *height_box) -pos.z));
    float x = pos.x() -size_slider.x();
    float y = pos.y() +(height_box *box_starting_rank_position);
    vec2 pos_slider = new vec2(x,y);
  
    float ratio = float(content.length) / float(end -1);
    
    vec2 size_molette = new vec2(size_slider.x(), round(size_slider.y() /ratio));
    
    boolean keep_pos_mol_is = false;
    int index = 0 ; // so catch the first molette of the index ;
    float pos_mol_y = 0;
    if(slider_dd != null) {
      pos_mol_y = slider_dd.get_molette_pos(index).y();
      keep_pos_mol_is = true ;
    }

    if(slider_dd == null) {
      slider_dd = new Slider("Slider Dropdown",pos_slider, size_slider);
    } else {
      slider_dd.pos(pos_slider);
      slider_dd.size(size_slider);
      slider_dd.set_pos_molette();
    }
    slider_dd.set_size_molette(size_molette);
    if(keep_pos_mol_is) {
      float pos_mol_x = slider_dd.get_molette_pos(index).x();
      slider_dd.set_pos_molette(index,pos_mol_x,pos_mol_y);
    }
    slider_dd.set_molette(RECT);
    slider_dd.set_fill(colour_structure);
    slider_dd.set_fill_molette(colour_box_in,colour_box_out);
    slider_dd.wheel(wheel_is);
  }

}

