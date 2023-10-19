function texture_set_interpolation_ext(sampler_id, linear)
{
	gpu_set_texfilter_ext(sampler_id, linear);
}
