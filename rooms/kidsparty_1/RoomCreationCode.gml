pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER WITH THE DEAD";
global.pepanimatronic = true;
global.gameframe_caption_text = "Shhh... Pizza Tower...";
if (global.panic == true)
{
	var lay = layer_get_id("Backgrounds_still1");
	layer_background_sprite(layer_background_get_id(lay), bg_kidsparty_empty)
}
