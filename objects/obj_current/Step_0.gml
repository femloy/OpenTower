instance_destroy(instance_place(x, y - 1, obj_baddie));
if (place_meeting(x, y - 1, obj_player))
{
	with obj_player
	{
		if state != states.golf && state != states.tackle && state != states.gotoplayer && state != states.stringfall && state != states.stringjump && state != states.stringfling
		{
			if (place_meeting(x, y + 1, other))
			{
				if (state != states.trashjump && state != states.trashroll) || !ispeppino
				{
					if (!instance_exists(obj_surfback) || ispeppino)
					{
						if state != states.barrel && state != states.barreljump && state != states.barrelslide && state != states.barrelclimbwall
						{
							if (state != states.slipnslide || sprite_index != spr_currentplayer)
								fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
							state = states.slipnslide;
							sprite_index = spr_currentplayer;
						}
						else
						{
							state = states.barrelslide;
							if sprite_index != spr_barrelslipnslide
								sprite_index = spr_barrelroll;
						}
						xscale = sign(other.image_xscale);
						movespeed = 20;
					}
					else if state != states.slipnslide
					{
						fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
						movespeed = 15;
						state = states.slipnslide;
					}
				}
				else
				{
					fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
					with (instance_create(x, y, obj_slidecloud))
					{
						image_xscale = other.xscale;
						sprite_index = spr_watereffect;
					}
					vsp = -6;
					image_index = 0;
					if state == states.trashjump
					{
						state = states.trashroll;
						movespeed = abs(movespeed);
						dir = xscale;
						movespeed += 3;
						instance_create(x, y, obj_jumpdust);
						sprite_index = spr_player_trashslide;
					}
				}
			}
		}
	}
}
