shader_type canvas_item;

// The amount of colors you want per color channel. X is Red, Y is Green, Z is Blue. By default it is set to the 8-bit default
uniform vec3 color_resolution = vec3(8, 8, 4);

uniform sampler2D screen_tex : hint_screen_texture;

void fragment() {
	vec3 col = texture(screen_tex, UV).rgb;
	
	vec3 color_bands = floor(col * color_resolution) / (color_resolution - 1.0);
	
	COLOR.rgb = color_bands;
}
