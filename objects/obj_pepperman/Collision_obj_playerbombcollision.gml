/*
if wastedhits == 9 && phase == 1 && !pizzahead && state == states.contemplate
{
	with (instance_create(other.x, other.y, obj_explosioneffect))
		sprite_index = spr_bombexplosion;
	scr_boss_do_hurt_phase2(obj_player1);
	if x != other.x
		image_xscale = sign(other.x - x);
	instance_destroy(other.bombID, false);
	instance_destroy(other);
}
else if state == states.mini && ministate != 8
{
	with (instance_create(other.x, other.y, obj_explosioneffect))
		sprite_index = spr_bombexplosion;
	instance_destroy(other.bombID, false);
	instance_destroy(other);
	with obj_camera
	{
		shake_mag = 3;
		shake_mag_acc = 5 / room_speed;
	}
	var lay1 = layer_get_id("Backgrounds_scroll");
	var lay2 = layer_get_id("Backgrounds_2");
	var lay3 = layer_get_id("Backgrounds_1");
	layer_set_visible(lay3, true);
	var bg1 = layer_background_get_id(lay1);
	var bg2 = layer_background_get_id(lay2);
	layer_background_change(bg1, bg_peppermanbosscloud1);
	layer_background_change(bg2, bg_peppermanboss1);
	layer_hspeed(lay1, 1);
	obj_bosscontroller.alarm[1] = 5;
	scr_sleep(25);
	instance_destroy(obj_peppermanartdude);
	instance_destroy(obj_peppermanbowlingball);
	instance_destroy(obj_peppermanbowlingballspawner);
	instance_destroy(obj_peppermanGIANTbowlingball);
	destroyable = true;
	spr_dead = spr_pepperman_minifall;
	instance_destroy();
}
*/
