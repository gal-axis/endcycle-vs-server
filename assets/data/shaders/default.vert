attribute vec4 a_position;
attribute vec4 a_color;
attribute vec2 a_texCoord0;

uniform mat4 u_projTrans;

varying vec4 v_color_add;
varying vec4 v_color_tint;
varying vec2 v_texCoords;

float toTint(float color){
	return min(color, 0.5) * 2.0;
}

float toAdd(float color){
	return max(color - 0.5, 0.0) * 2.0;
}

void main() {
	v_color_tint = vec4(toTint(a_color.r), toTint(a_color.g), toTint(a_color.b), toTint(a_color.a) * 254.0 / 244.0);
	v_color_add = vec4(toAdd(a_color.r), toAdd(a_color.g), toAdd(a_color.b), 0.0) * toAdd(a_color.a);
    v_texCoords = a_texCoord0;
    gl_Position = u_projTrans * a_position;
}