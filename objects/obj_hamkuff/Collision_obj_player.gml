if (state != states.stun)
{
	if (!other.isgustavo)
	{
		if (other.state != states.mach3 || !other.launched)
		{
			if (state != states.blockstance)
			{
				sprite_index = spr_hamkuff_chain1;
				state = states.blockstance;
				playerid = other.id;
			}
		}
		else
		{
			fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
			instance_destroy();
		}
	}
	else if (other.brick && state != states.blockstance)
	{
		other.brick = false;
		state = states.blockstance;
		sprite_index = spr_hamkuff_chain1;
		state = states.blockstance;
		with (other)
		{
			state = states.ratmounthurt;
			xscale = -other.image_xscale;
			movespeed = 6;
			vsp = -10;
		}
		with (instance_create(other.x, other.y, obj_brickcomeback))
		{
			trapped = true;
			baddieID = other.id;
			other.playerid = id;
		}
	}
	else if (other.state == states.ratmountpunch || other.ratmount_movespeed >= 12)
	{
		fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
		instance_destroy();
	}
	else
		scr_hurtplayer(other);
}
