shader_set(global.Pal_Shader);
var game = global.gameN[global.currentsavefile - 1];
var pal = game.palette_player2;
var tex = game.palettetexture_player2;
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, tex);
pal_swap_set(spr_peppalette, pal, false);
draw_self();
pattern_reset();
shader_reset();
