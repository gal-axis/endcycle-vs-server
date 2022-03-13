#ifdef GL_ES
    precision mediump float;
#endif

varying vec4 v_color_add;
varying vec4 v_color_tint;
varying vec2 v_texCoords;
uniform sampler2D u_texture;

#define PI 3.1415926538

float apply (float a) {
	return acos(1.0 - 2.0 * a) / PI;
}

void main() {
	float shift = apply(v_texCoords.x);
	vec4 color = texture2D(u_texture, vec2(shift, v_texCoords.y));
	color.rgb = color.rgb * smoothstep(0.6, 0.1, abs(shift-0.5));
	gl_FragColor = v_color_tint * color + v_color_add * color.a;
}