if visible == 1
{
	GamepadSetVibration(0, 0.9, 0.9, 0.8);
	fmod_event_one_shot_3d("event:/sfx/pep/jetpackjump", x, y);
	visible = false;
	gotowardsplayer = false;
	repeat 6
	{
		with (instance_create(x + random_range(-40, 40), y + random_range(-40, 40), obj_parryeffect))
			sprite_index = spr_heatpuff;
	}
	timetovisible = 100;
	if other.ispeppino
	{
		with other
		{
			if state == states.jetpackjump
			{
				if sprite_index != spr_jetpackstart2
				{
					with (instance_create(x, y, obj_rocketdead))
						sprite_index = spr_jetpackdebris;
				}
			}
			else
				state = states.jetpackjump;
			vsp = -14;
			sprite_index = spr_player_jetpackstart;
			doublejump = false;
			with (instance_create(x, y, obj_highjumpcloud2))
				sprite_index = spr_player_firemouthjumpdust;
			with (instance_place(x, y + (vsp * 2), obj_iceblock_breakable))
			{
				instance_destroy();
				if other.vsp < 0
					other.vsp = -14;
				else if other.vsp > -11
					other.vsp = -11;
				jumpstop = false;
			}
		}
	}
	else
	{
		with other
		{
			if state != states.jetpackjump
			{
				fmod_event_instance_play(pizzapeppersnd);
				scr_fmod_soundeffect(jumpsnd, x, y);
				fmod_event_instance_set_parameter(pizzapeppersnd, "state", 0, true);
				vsp = -11;
				if move != 0
				{
					if movespeed < 10
						movespeed = 10;
				}
				with (instance_create(x, y, obj_highjumpcloud2))
					sprite_index = spr_player_firemouthjumpdust;
				scr_do_pepperpizzajump();
			}
			else
				vsp = -11;
			jumpstop = true;
		}
	}
}
