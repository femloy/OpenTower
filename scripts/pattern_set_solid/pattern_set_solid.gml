function pattern_set_solid(enable)
{
	// use only one solid color representing the pattern?
	shader_set_uniform_i(global.Pattern_Solid_Color, enable);
}
