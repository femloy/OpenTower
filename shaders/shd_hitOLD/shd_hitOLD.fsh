varying vec2 v_texcoord;

uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float strength;

void main()
{ 
	vec4 colour = texture2D(gm_BaseTexture, v_texcoord);
	gl_FragColor.rgb = vec3(1,0.9,0.9);
	gl_FragColor.a = colour.a;
}
