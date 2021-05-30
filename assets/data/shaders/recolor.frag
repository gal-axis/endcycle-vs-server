#ifdef GL_ES
    precision mediump float;
#endif

varying vec4 v_color;
varying vec2 v_texCoords;
uniform sampler2D u_texture;

void main() {
	vec4 color = texture2D(u_texture, v_texCoords);	
	float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
	gl_FragColor = v_color * vec4((gray + color.r) * 0.5, (gray + color.g) * 0.5, (gray + color.b) * 0.5, color.a);
}