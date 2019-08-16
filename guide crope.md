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

Crope set_pos_value(vec2 pos);

Crope set_pos_value(float x, float y);

Crope set_fill_label(int c);

Crope set_fill_label(int c_in, int c_out);

Crope set_align_label(int align);

Crope set_font(PFont font);

Crope set_font(String font_name, int size);

Crope set_font_size(int font_size);

Crope set_id_midi(int id_midi);

Crope set_id(int id);

Crope set_rank(int rank);

Crope set_rollover_type(int rollover_type);

int get_dna();

ivec2 get_pos();

ivec2 get_size();

int get_rollover_type();

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

*set

Crope set_colour_in_on(int c);

Crope set_colour_out_on(int c);

Crope set_colour_in_off(int c);

Crope set_colour_out_off(int c);

void is(boolean is);

boolean is();

*get

float get();
>return value

boolean inside();

*show

void show();

void show(int kind, boolean on_off_is);

void show(PImage [] pic);

void show_label();

void show_value(float value);

void show_value();

*misc

void switch_is();
  
void offset(int x, int y);

void offset_is(boolean display_button);

void update(ivec2 cursor);

void update(int x, int y);
  
void rollover(boolean authorization);












*Knob extends Button

*constructor

Knob(vec2 pos, float size);

*set

Knob set_molette(int molette_type);

Knob set_value(float pos_norm);

Knob set_size_limit(float min, float max);

Knob set_size_molette(vec2 size);

Knob set_size_molette(float s);

Knob set_size_molette(float w, float h);

Knob set_distance_molette(float dist);

Knob set_drag(int direction);

Knob set_drag_force(float force);

Knob set_fill_molette(int c);

Knob set_fill_molette(int c_in, int c_out);
  
Knob set_stroke_molette(int c);

Knob set_stroke_molette(int c_in, int c_out);

Knob set_thickness_molette(float thickness);

Knob set_range(float min, float max);

Knob limit();

*get

float get();

*misc

void update(float x, float y);


*show

void show_structure();

void show_limit();

void show_molette();







