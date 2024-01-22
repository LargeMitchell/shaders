shader_type spatial;
render_mode unshaded;

uniform vec3 outline_color : source_color = vec3(0.0, 0.0, 0.0);
uniform sampler2D noise;
uniform vec2 noise_direction = vec2(1.0, 0.0);
uniform float scroll_multiplier = 0.2;
uniform float noise_visibility_threshold : hint_range(0.0, 1.0) = 0.5;
uniform bool use_noise_visibility = false;

void fragment() {
	vec4 noise_texture = texture(noise, UV + noise_direction * TIME * scroll_multiplier);
	
	ALBEDO = outline_color;
	if (use_noise_visibility == true){
		ALPHA = step(noise_texture.r, noise_visibility_threshold);
	}
	else{
		ALPHA = 1.0;
	}

}
