pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER ISLAND";
if (global.panic)
{
	var lay = layer_get_id("Backgrounds_stillH1")
	layer_background_sprite(layer_background_get_id(lay), bg_cityfire2)
	var lay2 = layer_get_id("Backgrounds_stillH2")
	layer_background_sprite(layer_background_get_id(lay2), bg_cityfire1)
	var lay3 = layer_get_id("Backgrounds_stillscroll")
	layer_background_sprite(layer_background_get_id(lay3), bg_cityfire3)
	var lay4 = layer_get_id("Backgrounds_scroll")
	layer_background_sprite(layer_background_get_id(lay4), bg_cityfiresmoke)
	var lay5 = layer_get_id("Foreground_2")
	layer_background_visible(layer_background_get_id(lay5), true)
}
