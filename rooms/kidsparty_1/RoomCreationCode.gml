pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER WITH THE DEAD";
global.pepanimatronic = true;
gameframe_caption_text = lang_get_value("caption_kidsparty");
if (global.panic == true)
{
	var lay = layer_get_id("Backgrounds_still1");
	layer_background_sprite(layer_background_get_id(lay), bg_kidsparty_empty)
}
