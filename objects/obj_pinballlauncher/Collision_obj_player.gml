var _obj = id;
with (other)
{
	if (scr_transformationcheck() || state == states.tumble)
	{
		if ((state != states.bump || sprite_index != spr_player_catched) && (state != states.tumble || xscale != _obj.image_xscale) && state != states.knightpep && state != states.knightpepslopes && state != states.backbreaker && state != states.gotoplayer)
		{
			state = states.tumble;
			fmod_event_one_shot_3d("event:/sfx/misc/pepbotkick", x, y);
			xscale = sign(other.image_xscale);
			mask_index = spr_crouchmask;
			movespeed = 8;
			vsp = 0;
			sprite_index = spr_tumble;
			other.image_index = 0;
			other.sprite_index = spr_goblinbot_kick;
			var _max = 45;
			y = other.y - _max;
			if (place_meeting(x, y, obj_platform))
				y--;
			if (scr_solid(x, y))
			{
				var i = 0;
				while (i <= _max)
				{
					if (scr_solid(x, y))
					{
						x += xscale;
						i++;
					}
					else
						break;
				}
			}
			if (scr_solid(x, y))
			{
				i = 0;
				while (i <= _max)
				{
					if (scr_solid(x, y))
					{
						y--;
						i++;
					}
					else
						break;
				}
			}
		}
	}
}
