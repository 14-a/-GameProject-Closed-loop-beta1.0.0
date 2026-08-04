shader_type spatial;

uniform sampler2D Text;

uniform float scale = 1.0;
uniform vec2 offect;

varying vec3 a;
varying vec3 b;

void vertex() {
	a = NORMAL;
	b = VERTEX;
	//if (abs(a.x) == 1.0) ALBEDO = texture(Text,VERTEX.xy/10.0).xyz;
	// Called for every vertex the material is visible on.
}

void fragment() {
	//ALBEDO = abs(a);
	ALBEDO = 
	(texture(Text, b.zy * scale + offect).xyz * abs(a).x) + 
	(texture(Text, b.zx * scale + offect).xyz * abs(a).y) + 
	(texture(Text, -b.xy * scale + offect).xyz * abs(a).z);
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
