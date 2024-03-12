//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 size;
uniform vec3 oColor;
uniform vec4 uvs;

const float rad_circle = 6.28319;

void main()
{
    vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(col.rgb * col.a, col.a);
    bool outline = false;
	float alpha = v_vColour.a;
	
	for(float i = 1.0; i <= 2.0; i++) {
	    //for(float d = 0.0; d < rad_circle; d += rad_circle / (7.0 - i)){
	    for(float d = 0.0; d < rad_circle; d += rad_circle / (4.0 + (i - 1.0))){
			vec2 check_pos = v_vTexcoord + vec2(cos(d) * size.x, -sin(d) * size.y);
			check_pos -= vec2(0, size.y * (i - 1.0));
			
		    vec4 datPixel = v_vColour * texture2D(gm_BaseTexture, check_pos);
            
			bool out_bound = check_pos.x < uvs.r || check_pos.y < uvs.g || check_pos.x > uvs.b || check_pos.y > uvs.a; 
			
		    if (datPixel.a > 0.0 && gl_FragColor.a <= 0.0 && !out_bound){
		        outline = true;
				alpha = datPixel.a;
		        break;
		    }
	    }
	}
    
    if (outline) gl_FragColor = vec4(oColor.r, oColor.g, oColor.b, alpha);
}


