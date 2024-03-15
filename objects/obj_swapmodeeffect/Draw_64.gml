draw_sprite_ext(sprite, 0, 0, 0, 1, 1, 0, c_gray, 1);
shader_set(global.Pal_Shader);
pal_swap_set(spr_palette, paletteselect, false);
pattern_set(global.Base_Pattern_Color, playersprite, playerindex, image_xscale, image_yscale, patterntexture);
draw_sprite_ext(playersprite, playerindex, playerx, playery, image_xscale, image_yscale, 0, c_white, 1);
pattern_reset();
reset_shader_fix();
