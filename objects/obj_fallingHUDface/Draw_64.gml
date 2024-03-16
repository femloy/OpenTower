shader_set(global.Pal_Shader);
if obj_player1.spotlight == 0
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
if obj_player1.spotlight == 1
	pal_swap_set(obj_player2.spr_palette, obj_player2.paletteselect, false);
draw_sprite(sprite, -1, X, Y);
shader_reset();
