shader_type spatial;

//uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

uniform vec3 albedo : source_color = vec3(1.0, 1.0, 1.0);
uniform sampler2D tex;

uniform int cuts : hint_range(0, 10, 1) = 1;
uniform float wrap : hint_range(0.0, 2.0) = 1.0;
uniform bool use_attenuation = true;


varying vec3 vertex_pos;
varying vec3 normal;

//if applied to fullscreen quad uncomment 
//void vertex() {
//	POSITION = vec4(VERTEX, 1.0);
//}

void vertex() {
	vertex_pos = VERTEX;
	normal = NORMAL;
}

void fragment() {
	ALBEDO = albedo * texture(tex, UV).rgb;
}

void light() {
	float attenuation = 1.0;
	
	if (use_attenuation == true){
		attenuation = ATTENUATION;
	}
	//float attenuation = 1.0;
	
	float NdotL = dot(NORMAL, LIGHT);
	float diffuse_amount = NdotL + (attenuation - 1.0) + (1.0 - wrap);
	diffuse_amount *= 1.0;
	float cuts_inv = 1.0 / float(cuts);
	
	float diffuse_stepped = clamp(diffuse_amount + mod(1.0 - diffuse_amount, cuts_inv), 0.0, 1.0);
	
	vec3 diffuse = ALBEDO.rgb * LIGHT_COLOR / PI;
	
	diffuse *= diffuse_stepped;
	
	DIFFUSE_LIGHT = max(DIFFUSE_LIGHT, diffuse);
	
}
