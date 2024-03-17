function scr_player_boxxedpepspin()
{
	image_speed = 0.5;
	hsp = xscale * movespeed;
	doublejump = true;
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
	}
	move = key_left + key_right;
	hsp = movespeed + (railmovespeed * raildir);
	if (abs(movespeed) > 0)
		movespeed = Approach(movespeed, 0, 0.1);
	instance_destroy(instance_place(x + hsp, y, obj_destructibles));
	if (scr_solid(x + hsp, y) && !place_meeting(x + hsp, y, obj_ratblock) && !place_meeting(x + hsp, y, obj_destructibles) && (!place_meeting(x + hsp, y, obj_slope) || scr_solid_slope(x + hsp, y)))
	{
		fmod_event_one_shot_3d("event:/sfx/boxxed/step", x, y);
		instance_create(x + hsp, y, obj_bangeffect);
		movespeed = -(sign(hsp) * 6);
		GamepadSetVibration(0, 0.4, 0.4, 0.65);
	}
	if ispeppino
	{
		if ((!key_slap || abs(movespeed) <= 3) && boxxedspinbuffer == 0)
		{
			target_vsp = 0;
			state = states.boxxedpepjump;
			sprite_index = spr_boxxedpepair;
		}
	}
	else if ((!key_slap || abs(movespeed) <= 3) && boxxedspinbuffer == 0)
	{
		target_vsp = 0;
		state = states.boxxedpep;
		sprite_index = spr_boxxedpepidle;
	}
	if ((sprite_index == spr_playerN_boxxeddashstart || sprite_index == spr_playerN_boxxedhit) && floor(image_index) == image_number - 1)
		sprite_index = spr_playerN_boxxeddash;
}
