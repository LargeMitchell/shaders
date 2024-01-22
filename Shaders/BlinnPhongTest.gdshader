shader_type spatial;

uniform vec3 diffuseColor : source_color;
uniform vec3 ambientColor : source_color;
uniform vec3 specColor : source_color;
uniform float shininess : hint_range(0.1, 100000.0) = 2000.0;
uniform float lightPower = 40.0;

const float screenGamma = 2.2; // Assumes the monitor is calibrated to sRGB space


void light() {
	
	float lambertian = max(dot(LIGHT, NORMAL), 0.0);
	float specular = 0.0;
	float Distance = length(LIGHT);
	float distancesqr = Distance * Distance;
	
	if (lambertian > 0.0) {
		
		vec3 halfDir = normalize(LIGHT + VIEW);
		float specAngle = max(dot(halfDir, NORMAL), 0.0);
		specular = pow(specAngle, shininess);
		
	}
	
	vec3 colorLinear = ambientColor + diffuseColor * lambertian * LIGHT_COLOR * 
	lightPower / distancesqr + specColor * specular * LIGHT_COLOR * lightPower / distancesqr;
	
	vec3 colorGammaCorrected = pow(colorLinear, vec3(1.0/screenGamma));
	
	DIFFUSE_LIGHT += colorLinear;
		
}