*CROPE – Control Romanesco Processing Environment

2015–2019

Crope is a GUI framework build for Romanesco application at the begining





*Crope


*constructor

Crope(String type);

*method


Crope pos(int x, int y);

Crope pos(ivec2 pos);
  
Crope size(int x, int y);

Crope size(ivec2 size);

void cursor(ivec2 cursor);

void cursor(int x, int y);
  
Crope set_fill(int c);

Crope set_fill(int c_in, int c_out);
  
Crope set_stroke(int c);

Crope set_stroke(int c_in, int c_out);

Crope set_thickness(float thickness);

Crope set_aspect(int f_c, int s_c, float thickness);

Crope set_aspect(int f_c_in, int f_c_out, int s_c_in,  int s_c_out, float thickness);

Crope set_rounded(float rounded);

Crope set_name(String name);

Crope set_label(String name);

Crope set_label(String name, int x, int y);

Crope set_label(String name, ivec2 pos_label);

Crope set_pos_label(ivec2 pos);

Crope set_pos_label(int x, int y);

Crope set_fill_label(int c);

Crope set_fill_label(int c_in, int c_out);

Crope set_align_label(int align);

Crope set_font(PFont font);

Crope set_font(String font_name, int size);

Crope set_font_size(int font_size);

Crope set_id_midi(int id_midi);

Crope set_id(int id);

Crope set_rank(int rank);

int get_dna();

ivec2 get_pos();

ivec2 get_size();

String get_name();

String get_label();

int get_id_midi();

int get_id();

PFont get_font();

int get_rank();

int get_birth();

String get_type();

void add_crope(Crope crope);



















*Button extends Crope


*Constructor

Button(ivec2 pos, ivec2 size);


*method

Crope set_colour_in_on(int c);

Crope set_colour_out_on(int c);

Crope set_colour_in_off(int c);

Crope set_colour_out_off(int c);


void set_is(boolean is);

boolean is();

void switch_is();
  
void offset(int x, int y);

void offset_is(boolean display_button);

void update(ivec2 cursor);

void update(int x, int y);
  
void rollover(boolean authorization);

boolean inside();

void show();

void show(int kind, boolean on_off_is);

void show(PImage [] pic);

void show_label();







