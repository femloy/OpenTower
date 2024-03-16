if (!global.option_hud || (instance_exists(obj_debugcontroller) && !obj_debugcontroller.showhud))
	exit;
if (instance_exists(obj_ghostcollectibles))
	exit;

draw_self();
draw_sprite(spr_pizzaball_primoburg, 0, SCREEN_WIDTH - 120, y);
draw_set_font(global.bigfont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var tx = SCREEN_WIDTH - 120 + 43;
var ty = y - 58;

draw_text_color(x - 91, y - 117, hit, c_white, c_white, c_white, c_white, 1);
draw_text_color(tx, ty, primoburg, c_white, c_white, c_white, c_white, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if !obj_player1.ispeppino
{
	if hand_shake != 0
		draw_sprite(spr_noisearmgolfcloud, cloud_index, tx, ty);
	shader_set(global.Pal_Shader);
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	draw_sprite(spr_noisearmgolf, 0, tx + irandom_range(-hand_shake, hand_shake), ty + hand_yoffset + irandom_range(-hand_shake, hand_shake));
	pattern_reset();
	reset_shader_fix();
}
