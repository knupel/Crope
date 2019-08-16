*constructor

Slider();
  
Slider(vec2 pos, vec2 size);

Slider(String type, vec2 pos, vec2 size);

*set

Slider set_value(float... pos_norm);

Slider set_molette_num(int num);

Slider set_molette(int type);

Slider set_size_molette(vec2 size);

Slider set_size_molette(float x, float y);

Slider set_pos_molette();

Slider set_pos_molette(int index);

Slider set_pos_molette(vec2... pos_mol);

Slider set_pos_molette(int index, float x, float y);

Slider set_fill_molette(int c);

Slider set_fill_molette(int c_in, int c_out);
  
Slider set_stroke_molette(int c);

Slider set_stroke_molette(int c_in, int c_out);

Slider set_thickness_molette(float thickness);


*get

float [] get();

float get(int index);

float get_min_norm();

float get_max_norm();
  
vec2 get_min_pos();

vec2 get_max_pos();

vec2 [] get_molette_pos();

vec2 get_molette_pos(int index);

vec2 get_molette_size(int index);

boolean molette_used_is();

boolean molette_used_is(int index);

boolean molette_inside_is();

boolean molette_inside_is(int index);

boolean select_is();

boolean select_is(int index);

boolean used_is();

boolean used_is(int index);

*show

void show_structure();

void show_molette();
  
void show_label();

void show_value() ;

void show_value(float... value);


*misc

void update(float x, float y);
  
boolean inside_molette_is(int index);

boolean inside_molette_rect();

boolean inside_molette_rect(int index);
  
boolean inside_molette_ellipse();

boolean inside_molette_ellipse(int index);

void update_midi(int... value);

void update_midi(int index, int value);

void keep_selection(boolean state);

void select(boolean authorization);
>useful to change of type of boolean selection, by default is mousePressed

void select(boolean authorization_1, boolean authorization_2);

boolean select(boolean locked_method, boolean result, boolean authorization);

boolean select(int index, boolean locked_method, boolean result, boolean authorization);