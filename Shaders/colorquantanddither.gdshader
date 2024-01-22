shader_type spatial;
render_mode unshaded;

uniform float colors : hint_range(1.0, 16.0);
uniform float dither : hint_range(0.0, 0.5);

uniform sampler2D screentex : hint_screen_texture, filter_nearest;

void vertex()
{
	POSITION = vec4(VERTEX, 1.0);
}

void fragment()
{
	vec3 color = texture(screentex, SCREEN_UV).rgb;
	
	float a = floor(mod(SCREEN_UV.x, 2.0));
	float b = floor(mod(SCREEN_UV.y, 2.0));	
	float c = mod(a + b, 2.0);
	
	ALBEDO.r = (round(color.r * colors + dither) / colors) * c;
	ALBEDO.g = (round(color.g * colors + dither) / colors) * c;
	ALBEDO.b = (round(color.b * colors + dither) / colors) * c;
	c = 1.0 - c;
	ALBEDO.r += (round(color.r * colors - dither) / colors) * c;
	ALBEDO.g += (round(color.g * colors - dither) / colors) * c;
	ALBEDO.b += (round(color.b * colors - dither) / colors) * c;
}
