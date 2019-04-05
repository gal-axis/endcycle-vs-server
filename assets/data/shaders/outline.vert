#version 130

attribute vec4 a_position;
attribute vec4 a_color;
attribute vec2 a_texCoord0;

uniform mat4 u_projTrans;
uniform sampler2D u_texture;

uniform float u_outlineIntensity;
uniform vec4 u_outlineColor;

varying vec4 v_color;
varying vec2 v_texCoords;
varying vec2 u_seek;

void main() {
    v_color = a_color;
    v_texCoords = a_texCoord0;
    gl_Position = u_projTrans * a_position;
	ivec2 texSize = textureSize(u_texture, 0);
	u_seek = vec2(u_outlineIntensity / texSize.x, u_outlineIntensity / texSize.y);
}