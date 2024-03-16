if isgustavo && ispeppino
	draw_sprite(spr_lonebrick_wait, -1, xstart, ystart);
shader_set(global.Pal_Shader);
pal_swap_set(spr_palette, paletteselect, false);
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, patterntexture);
draw_self();
pattern_reset();
shader_reset();

if room == boss_pizzaface && instance_exists(obj_pizzaface_thunderdark) && !ispeppino
{
	shader_set(shd_supernoise);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, obj_player1.supernoisefade);
	shader_reset();
}
