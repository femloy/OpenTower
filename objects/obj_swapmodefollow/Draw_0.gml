shader_set(global.Pal_Shader);
var spr_pal = spr_palette;
if !ispeppino && room == boss_pizzaface && instance_exists(obj_pizzaface_thunderdark)
	spr_pal = spr_noisepalette_rage;
pal_swap_set(spr_pal, paletteselect, false);
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, patterntexture);
event_inherited();
pattern_reset();
shader_reset();

if room == boss_pizzaface && instance_exists(obj_pizzaface_thunderdark) && !ispeppino
{
	shader_set(shd_supernoise);
	draw_sprite_ext(sprite_index, image_index, x, y + yoffset, image_xscale, image_yscale, image_angle, image_blend, obj_player1.supernoisefade);
	shader_reset();
}
