if (!sprite_exists(sprite_index))
	exit;
if sprite_index == spr_towerending_swapmode
{
	shader_set(global.Pal_Shader);
	var pal_info = get_pep_palette_info();
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, pal_info.patterntexture);
	pal_swap_set(pal_info.spr_palette, pal_info.paletteselect, false);
	draw_self();
	pattern_reset();
	shader_reset();
}
else if sprite_index != spr_towerending_gustavo && sprite_index != spr_towerending_peppino && sprite_index != spr_towerending_bosses && sprite_index != spr_towerending_noise && sprite_index != spr_towerending_noisey
	draw_self();
else
{
	shader_set(global.Pal_Shader);
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	if sprite_index == spr_towerending_gustavo
		pal_swap_set(spr_ratmountpalette, obj_player1.paletteselect, false);
	else
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	draw_self();
	pattern_reset();
	shader_reset();
}
