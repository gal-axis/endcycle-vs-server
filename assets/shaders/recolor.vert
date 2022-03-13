attribute vec4 a_position;
attribute vec4 a_color;
attribute vec2 a_texCoord0;

uniform mat4 u_projTrans;

varying vec4 v_color;
varying vec2 v_texCoords;

float toTint(float color){
	return min(color, 0.5) * 2.0;
}

void main() {
    v_color = vec4(toTint(a_color.r), toTint(a_color.g), toTint(a_color.b), toTint(a_color.a) * 254.0 / 244.0);
    v_texCoords = a_texCoord0;
    gl_Position = u_projTrans * a_position;
}