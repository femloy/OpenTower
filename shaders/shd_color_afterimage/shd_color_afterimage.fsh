varying vec2 v_texcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float strength;

uniform float red;
uniform float green;
uniform float blue;

void main()
{ 
	vec4 colour = texture2D(gm_BaseTexture, v_texcoord);
	gl_FragColor.rgb = vec3(red,green,blue);
	gl_FragColor.a = v_vColour.a * colour.a;
}
