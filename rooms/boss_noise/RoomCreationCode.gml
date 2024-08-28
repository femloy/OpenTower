pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER ISLAND";
gameframe_caption_text = lang_get_value("caption_boss_noise");
if !obj_player1.ispeppino || global.swapmode
{
	doisebg_set_layer("Assets_2");
	doisebg_set_layer("Backgrounds_Ring2");
	layer_set_visible("Backgrounds_4", true);
	layer_set_visible("Backgrounds_5", true);
	instance_destroy(obj_micnoise, false);
}
else
{
	doisebg_set_layer("Assets_2");
	doisebg_set_layer("Backgrounds_Ring2");
}
