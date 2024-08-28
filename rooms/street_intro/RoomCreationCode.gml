pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER ISLAND"
gameframe_caption_text = lang_get_value("caption_street")
with (obj_secretbigblock)
	particlespr = spr_streetdebris

var lay_id = layer_get_id("Assets_1")
var pep = layer_sprite_get_id(lay_id, "peppinotv")
var noise = layer_sprite_get_id(lay_id, "noisetv")
if obj_player1.ispeppino
{
	layer_sprite_alpha(pep, 1)
	layer_sprite_alpha(noise, 0)
}
else
{
	layer_sprite_alpha(pep, 0)
	layer_sprite_alpha(noise, 1)
}

if (!obj_secretmanager.init)
{
	obj_secretmanager.init = true;
	secret_add(function()
	{
		touchedtriggers = 0
	}, function()
	{
		if (touchedtriggers >= 6)
			secret_open_portal(0)
	})
	secret_add(-4, function()
	{
		secret_open_portal(1)
	})
	secret_add(-4, function()
	{
		if secret_check_trigger(2)
			secret_open_portal(2)
	})
}
