//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float u_speed;

vec3 hsv2rgb(vec3 c) {
	vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
	vec3 pp = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(pp - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
	vec4 texColor = texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 col = vec3((u_time * u_speed), 1.0, 1.0);
	vec4 finalCol = vec4(hsv2rgb(col), texColor.a);
	gl_FragColor = v_vColour *  finalCol;
}
