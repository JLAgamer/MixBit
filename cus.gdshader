shader_type canvas_item;

uniform vec4 shirt_placeholder:source_color;
uniform vec4 shirt_color:source_color;
uniform vec4 eyes_placeholder:source_color;
uniform vec4 eyes_color:source_color;
uniform vec4 eyebrows_placeholder:source_color;
uniform vec4 eyebrows_color:source_color;

void fragment() {
    vec4 current_pixel = texture(TEXTURE, UV);

    if (current_pixel == shirt_placeholder)
        COLOR = shirt_color;
    else if (current_pixel == eyes_placeholder)
		COLOR = eyes_color;
	else if (current_pixel == eyebrows_placeholder)
		COLOR = eyebrows_color;
	else
		COLOR = current_pixel;
}