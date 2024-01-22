shader_type canvas_item;

uniform vec3 color1 : source_color;
uniform vec3 color2 : source_color;

void fragment() {
	vec4 color = vec4(mix(color1, color2, UV.y), 1.0);
	
	COLOR = color;
}
