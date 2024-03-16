pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER ISLAND"
var lay_id = layer_get_id("Assets_1")
var gus = layer_sprite_get_id(lay_id, "graphic_606CD6FF")
var noise = layer_sprite_get_id(lay_id, "graphic_1D834491")
if obj_player1.ispeppino
{
	layer_sprite_alpha(gus, 1)
	layer_sprite_alpha(noise, 0)
}
else
{
	layer_sprite_alpha(gus, 0)
	layer_sprite_alpha(noise, 1)
}
