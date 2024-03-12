varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palette_texture;
uniform vec2 texel_size;
uniform vec4 palette_UVs;
uniform float palette_index;
uniform float palette_y;

// pattern stuff
uniform sampler2D pattern_texture;
uniform int pattern_enabled;
uniform vec4 pattern_UVs;

void main()
{
	vec4 source = texture2D( gm_BaseTexture, v_vTexcoord );
	
	DoAlphaTest( source );
	
	if (source.a > 0.0) {
		if (pattern_enabled == 1) {
			source = texture2D(pattern_texture, vec2(pattern_UVs.x, pattern_UVs.y));
		}
		else {
			float palette_V = palette_UVs.x + (texel_size.x * palette_index);
			source = texture2D(palette_texture, vec2(palette_V, palette_UVs.y + (texel_size.y * palette_y)));
		}
	}
	
	gl_FragColor = source * v_vColour;
}
