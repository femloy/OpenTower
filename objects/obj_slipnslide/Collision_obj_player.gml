with other
{
	if state != states.trashroll && state != states.trashjump && state != states.cheeseball && state != states.chainsaw
	{
		notification_push(notifs.slipbanan, []);
		fmod_event_one_shot_3d("event:/sfx/pep/slip", x, y);
		sprite_index = spr_slipbanan1;
		other.drop = true;
		vsp = -11;
		if state == states.machcancel
		{
			if movespeed != 0
				xscale = sign(movespeed);
			else if move != 0
				xscale = move;
			movespeed = abs(movespeed);
		}
		movespeed += 2;
		if movespeed > 14
			movespeed = 14;
		hsp = movespeed * xscale;
		image_index = 0;
		state = states.slipbanan;
	}
	instance_destroy(other);
}
