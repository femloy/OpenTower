if obj_swapmodefollow.ispeppino
    draw_self()
else
{
    shader_set(global.Pal_Shader)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, obj_swapmodefollow.patterntexture)
    pal_swap_set(obj_swapmodefollow.spr_palette, obj_swapmodefollow.paletteselect, 0)
    draw_self()
    pattern_reset()
    shader_reset()
}
