if (sprite_index == spr_gustavoswitch2 && instance_exists(obj_charswitch_intro) && obj_charswitch_intro.state != states.fall)
	image_index = 0;
if (sprite_index == spr_gustavoswitch2 && floor(image_index) == (image_number - 1))
{
	with (obj_player1)
	{
		visible = true;
		create_particle(x, y, particle.genericpoofeffect);
		ratmount_movespeed = 8;
		gustavodash = 0;
		isgustavo = true;
		state = states.ratmount;
		jumpAnim = false;
		sprite_index = spr_player_ratmountidle;
		brick = true;
		x = obj_gustavoswitch.x;
		y = obj_gustavoswitch.y;
		global.switchbuffer = 100;
		fmod_event_instance_release(snd_voiceok);
		snd_voiceok = fmod_event_create_instance("event:/sfx/voice/gusok");
		if (room == street_jail)
		{
			with (obj_music)
			{
				if (music != -4)
					fmod_event_instance_set_parameter(music.event, "state", 1, true);
			}
		}
		else if (room == forest_G1)
		{
			with (obj_music)
			{
				if (music != -4)
					fmod_event_instance_set_parameter(music.event, "state", 2, true);
			}
		}
	}
	sprite_index = spr_pepsign;
}
if (sprite_index == spr_pepsign && global.panic != escape)
	visible = false;
else
	visible = true;
