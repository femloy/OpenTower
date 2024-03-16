if state == states.shoulderbash && hsp != 0
{
	if other.flash
		other.flash = false;
	var s = other.state;
	scr_hurtplayer(other);
	if other.state != s && other.state == states.hurt
	{
		state = states.stun;
		hsp = -image_xscale * 5;
		vsp = -8;
		stunned = 220;
		sprite_index = spr_pepperman_shoulderhurtstart;
		image_index = 0;
		image_speed = 0.35;
		with obj_camera
		{
			shake_mag = 3;
			shake_mag_acc = 5 / room_speed;
		}
		repeat 4
			create_debris(x, y, spr_slapstar);
	}
}
else if (wastedhits == 9 && phase == 1 && !pizzahead && (other.instakillmove || other.state == states.handstandjump) && state == states.contemplate)
	scr_boss_do_hurt_phase2(other);
else if (state == states.mini && ministate != states.transition && (other.instakillmove || other.state == states.handstandjump))
{
	with other
		scr_pummel();
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
	layer_background_change(bg1, bg_peppermanbosscloud1)
	layer_background_change(bg2, bg_peppermanboss1)
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
