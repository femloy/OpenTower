draw_self();
if flash
{
	shader_set(shd_hit);
	draw_self();
	shader_reset();
}
