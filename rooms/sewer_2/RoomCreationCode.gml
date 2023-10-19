pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER ISLAND";
if (global.panic)
{
	var lay = layer_get_id("Backgrounds_1")
	layer_background_sprite(layer_background_get_id(lay), bg_sewer1escape)
	var lay2 = layer_get_id("Backgrounds_2")
	layer_background_sprite(layer_background_get_id(lay2), bg_sewer2escape)
	var layscroll = layer_get_id("Backgrounds_scroll")
	layer_background_visible(layer_background_get_id(layscroll), true)
	var layscroll2 = layer_get_id("Backgrounds_scroll2")
	layer_background_visible(layer_background_get_id(layscroll2), false)
	var zigzag = layer_get_id("Backgrounds_zigzag1")
	layer_background_visible(layer_background_get_id(zigzag), false)
}
