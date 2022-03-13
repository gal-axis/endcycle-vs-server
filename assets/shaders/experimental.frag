#ifdef GL_ES
    precision mediump float;
#endif

varying vec4 v_color_add;
varying vec4 v_color_tint;
varying vec2 v_texCoords;
uniform sampler2D u_texture;

#define PI 3.1415926538
#define HORIZON 0.7

const float split = (1.0 - HORIZON) * 0.8;
const float top = 1.0 - split;


float apply (float a) {
	return 1.0 - sqrt(1 - a * a);
}

void main() {
	float shift = apply(v_texCoords.y);
	vec4 color = texture2D(u_texture, vec2(v_texCoords.x, shift));
	//color.a = color.a * step(v_texCoords.y, 0.996);
	gl_FragColor = v_color_tint * color + v_color_add * color.a;
}