switch state
{
	case states.gottreasure:
		if cutscenebuffer > 0
			cutscenebuffer--;
		else
		{
			state = states.fall;
			instance_destroy(effectid);
		}
		break;
	case states.fall:
		var ty = playerid.y + 30;
		y = Approach(y, ty, movespeed);
		if (abs(y - ty) <= 50)
			movespeed = Approach(movespeed, 0, 0.1);
		if (y == ty || movespeed <= 0)
		{
			create_particle(x, y, particle.genericpoofeffect);
			scr_sound_multiple("event:/sfx/misc/collect", x, y);
			state = states.transition;
			cutscenebuffer = 70;
			flamebuffer = 0;
			orangealpha = 1.5;
		}
		break;
	case states.transition:
		if orangealpha > 0
			orangealpha -= 0.08;
		if flamebuffer > 0
			flamebuffer--;
		else
		{
			flamebuffer = 8;
			repeat 3
				instance_create(x, y, obj_firemouthflame);
		}
		if cutscenebuffer > 0
			cutscenebuffer--;
		else
		{
			with obj_music
			{
				if music != -4
					fmod_event_instance_set_parameter(music.event, "state", 2, true);
			}
			global.noisejetpack = true;
			global.combotime = 60;
			with playerid
			{
				state = states.actor;
				sprite_index = spr_player_poweredup;
				image_index = 0;
				image_speed = 0.35;
				if !ispeppino
				{
					noisepizzapepper = true;
					sprite_index = spr_playerN_pizzapepper;
				}
			}
			repeat 20
			{
				with obj_firemouthflame
				{
					hsp = 24;
					vsp = 24;
				}
			}
			cutscenebuffer = 100;
			state = states.actor;
		}
		break;
	case states.actor:
		if flamebuffer > 0
			flamebuffer--;
		else
		{
			flamebuffer = 8;
			repeat 3
			{
				with (instance_create(x, y, obj_firemouthflame))
				{
					hsp *= 1.5;
					vsp *= 1.5;
				}
			}
		}
		if cutscenebuffer > 0
			cutscenebuffer--;
		else
		{
			with obj_music
			{
				if music != -4
					fmod_event_instance_set_parameter(music.event, "state", 1, true);
			}
			playerid.state = states.normal;
			playerid.landAnim = false;
			playerid.flash = true;
			instance_destroy();
			create_transformation_tip(lang_get_value("jetpack2tip"), "jetpack2");
		}
		break;
}
