shader_set(global.Pal_Shader);
var palinfo = get_pep_palette_info();
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, palinfo.patterntexture);
var ps = palinfo.paletteselect;
pal_swap_set(palinfo.spr_palette, ps, false);
draw_self();
pattern_reset();
shader_reset();
