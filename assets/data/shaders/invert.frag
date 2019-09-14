#ifdef GL_ES
    precision mediump float;
#endif

varying vec4 v_color;
varying vec2 v_texCoords;
uniform sampler2D u_texture;

float toTint(float color){
	return (min(color, 0.5) * 2.0);
}

float toAdd(float color){
	return (max(color - 0.5, 0.0) * 2.0);
}

void main() {
	vec4 color = texture2D(u_texture, v_texCoords);		
	vec4 tint = vec4(toTint(v_color.r), toTint(v_color.g), toTint(v_color.b), toTint(v_color.a) * 254.0 / 244.0);
	vec4 addition = vec4(toAdd(v_color.r), toAdd(v_color.g), toAdd(v_color.b), 0.0) * toAdd(v_color.a);
	vec4 final_color = tint * color + addition * color.a;
	gl_FragColor = vec4(1.0 - final_color.rgb, final_color.a);
}