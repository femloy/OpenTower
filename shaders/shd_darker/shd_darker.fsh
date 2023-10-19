varying vec2 v_texcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float strength;

#define DARKNESS 0.4

void main()
{ 
	vec4 colour = texture2D(gm_BaseTexture, v_texcoord);
	gl_FragColor.rgb = v_vColour.rgb * colour.rgb;
	gl_FragColor.r -= DARKNESS;
	gl_FragColor.g -= DARKNESS;
	gl_FragColor.b -= DARKNESS;
	gl_FragColor.a = v_vColour.a * colour.a;
}
