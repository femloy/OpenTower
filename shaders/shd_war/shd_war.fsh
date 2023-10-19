//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec3 size; //width, height, radius

uniform float strength;

const int quality = 6;
const int directions = 12;
const float Pi = 6.28318530718;//pi * 2

void main()
{
	// blur
	vec2 radius = size.z/size.xy;
	vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
	
	//for(float d = 0.0; d < Pi; d+= Pi/float(directions)) {
	//	for(float i = 1.0/float(quality); i <= 1.0; i += 1.0/float(quality)) {
	//		color += texture2D(gm_BaseTexture, v_vTexcoord + vec2(cos(d), sin(d)) * radius * i);
	//	}
	//}
	//
	//color /= float(quality) * float(directions) + 1.0;
	
	//// saturation
	//float value = dot(color.rgb, vec3(0.299, 0.587, 0.114));
	gl_FragColor = color * v_vColour;
	gl_FragColor.r += strength;
	gl_FragColor.g -= strength;
	gl_FragColor.b -= strength;
}
