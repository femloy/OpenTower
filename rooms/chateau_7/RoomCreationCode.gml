pal_swap_init_system(shd_pal_swapper)
global.roommessage = "YOU CANNOT ESCAPE..."
if global.panic
{
    var lay2 = layer_get_id("Backgrounds_stillH1")
    layer_background_sprite(layer_background_get_id(lay2), spr_chateaudarkbg_escape)
}
