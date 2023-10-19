//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 source = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 color = vec4(0, 0, 0, 0);
	vec4 black = vec4(80, 0, 0, 255);
	vec4 brown = vec4(216, 144, 96, 255);
	black = black / vec4(255, 255, 255, 255);
	brown = brown / vec4(255, 255, 255, 255);
	
	black.a = source.a;
	brown.a = source.a;
	
	if (distance(source, vec4(0, 0, 0, 1)) <= 0.004)
		color = black;
	else
		color = brown;
	
	gl_FragColor.rgb = vec3(color.r, color.g, color.b);
	gl_FragColor.a = source.a;
	
	if (distance(vec4(0, 0, 0, source.a), vec4(0, 0, 0, 0)) <= 0.004)
		gl_FragColor = source;
}
