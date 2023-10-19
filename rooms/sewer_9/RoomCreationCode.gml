pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER ISLAND";
if global.panic
{
	var lay = layer_get_id("Backgrounds_scroll");
	layer_background_visible(layer_background_get_id(lay), true);
}
