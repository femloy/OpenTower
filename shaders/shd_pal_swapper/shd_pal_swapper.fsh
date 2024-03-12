varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palette_texture;
uniform vec2 texel_size;
uniform vec4 palette_UVs;
uniform float palette_index;

// pattern stuff
uniform sampler2D pattern_texture;
uniform int pattern_enabled;
uniform int pattern_solid_color;
uniform float color_array[2];
uniform vec4 pattern_tex_data; // (x, y) = trimmed l/t offset | (z, w) = texture size
uniform vec4 pattern_UVs;
uniform vec4 sprite_UVs;
uniform vec4 sprite_tex_data; // (x, y) = trimmed l/t offset | (z, w) = texture size
uniform vec2 sprite_scale; // (xscale, yscale)

void main()
{
	vec4 source = texture2D( gm_BaseTexture, v_vTexcoord );
    
	DoAlphaTest( source );
    
	for(float i = palette_UVs.y; i < palette_UVs.w; i += texel_size.y) {
		if (distance(source, texture2D(palette_texture, vec2(palette_UVs.x, i))) <= 0.004) {
			float palette_V = palette_UVs.x + texel_size.x * palette_index;
			source = texture2D(palette_texture, vec2(palette_V, i));
			
			if (pattern_enabled == 1) {
				for(int j = 0; j < 2; j += 1) {
					if (color_array[j] == floor((i - palette_UVs.y) * (1.0 / texel_size.y))) {
						// convert to (0,0) and convert to integer size in texture page
						vec2 pos = (v_vTexcoord - sprite_UVs.xy) * sprite_tex_data.zw;
						// get the edges of the palette sprite and convert to integer size in texture page
						vec2 edge = (pattern_UVs.zw - pattern_UVs.xy) * pattern_tex_data.zw;
		
						// wrap around the edges
						pos = mod(pos + sprite_tex_data.xy, edge + pattern_tex_data.xy);
		
						// convert the position back to texel size
						pos = pos / pattern_tex_data.zw;
		
						// set the tex coordinate
						vec2 texcoord = vec2(0, 0);
		
						// check sprite xscale
						if (sprite_scale.x >= 0.0)
							texcoord.x = pattern_UVs.x + pos.x;
						else
							texcoord.x = pattern_UVs.z - pos.x;
			
						// check sprite yscale
						if (sprite_scale.y >= 0.0)
							texcoord.y = pattern_UVs.y + pos.y;
						else
							texcoord.y = pattern_UVs.w - pos.y;
							
						if (pattern_solid_color == 1)
							texcoord = vec2(pattern_UVs.x, pattern_UVs.y);
						
						// mix the pattern and the palette colors
						vec4 pat = texture2D(pattern_texture, texcoord);
						vec3 m = mix(pat.rgb, source.rgb, source.a);
						
						source = vec4(m.rgb, pat.a);
						break;
					}
				}
				
			}
			break;
		}
	}

	gl_FragColor = source * v_vColour;
}
