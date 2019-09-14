#ifdef GL_ES
    precision mediump float;
#endif

varying vec4 v_color;
varying vec2 v_texCoords;
uniform sampler2D u_texture;

float toTint(float color){
	return min(color, 0.5) * 2.0;
}

void main() {
	vec4 color = texture2D(u_texture, v_texCoords);	
	gl_FragColor = vec4(toTint(v_color.r), toTint(v_color.g), toTint(v_color.b), color.a * toTint(v_color.a) * 254.0 / 244.0);
}