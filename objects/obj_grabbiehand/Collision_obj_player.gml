if state != states.grabbing && other.state != states.bombgrab && x == xstart && y == ystart
{
	with other
	{
		fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
		fmod_event_instance_play(other.snd);
		if state != states.chainsaw && state != states.backbreaker
		{
			tauntstoredmovespeed = movespeed;
			tauntstoredvsp = vsp;
			tauntstoredsprite = sprite_index;
			tauntstoredstate = state;
		}
		with (instance_create(x, y - 5, obj_parryeffect))
		{
			image_yscale = -1;
			sprite_index = spr_grabhangeffect;
			image_speed = 0.35;
		}
		state = states.actor;
		if boxxed == false
			sprite_index = spr_catched;
		else
			sprite_index = spr_boxxedpepair;
		other.playerid = id;
		other.state = states.grabbing;
		if tauntstoredstate != states.mach2 && tauntstoredstate != states.mach3
		{
			tauntstoredstate = states.jump;
			tauntstoredsprite = spr_jump;
			tauntstoredmovespeed = 0;
			tauntstoredvsp = 0;
		}
		else if tauntstoredstate == states.mach2
			sprite_index = spr_mach;
		else if tauntstoredstate == states.mach3
			sprite_index = spr_mach4;
	}
}
