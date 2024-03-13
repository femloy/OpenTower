if (!obj_player1.ispeppino || global.swapmode)
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_noiseboss_palette, 1, false);
	draw_self();
	shader_reset();
}
else
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_noiseboss_palette, 2, false);
	draw_self();
	shader_reset();
}
