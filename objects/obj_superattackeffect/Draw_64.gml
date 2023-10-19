shader_set(global.Pal_Shader);
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, 1, 1, global.palettetexture);
pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
draw_sprite(sprite_index, image_index, x, y);
pattern_reset();
reset_shader_fix();
