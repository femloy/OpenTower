if sprite_index != spr_playerN_animatronic
	draw_self();
else
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_noiseboss_palette, 1, false);
	draw_self();
	shader_reset();
}
