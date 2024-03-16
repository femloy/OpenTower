function pattern_enable(enable)
{
	shader_set_uniform_i(global.Pattern_Enable, enable);
	shader_set_uniform_i(global.N_Pattern_Enabled, enable);
}
