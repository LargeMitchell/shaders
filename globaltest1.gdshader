shader_type canvas_item;

global uniform float monochrome_intensity;

void fragment() {
	COLOR.rgb = mix(vec3(0.0,0.0,0.0), vec3(1.0,1.0,1.0), monochrome_intensity);
}

