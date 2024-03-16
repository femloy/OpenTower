with obj_player1
{
	taunttimer = 0;
	scr_player_backbreaker();
	
	if tauntstoredstate == states.mach2
	{
		state = states.mach2;
		movespeed = tauntstoredmovespeed;
		if movespeed < 6
			movespeed = 6;
		sprite_index = spr_mach;
		image_index = 0;
	}
	else if tauntstoredstate == states.mach3
	{
		state = states.mach3;
		movespeed = tauntstoredmovespeed;
		if movespeed < 12
			movespeed = 12;
		sprite_index = spr_mach4;
		image_index = 0;
	}
	else if tauntstoredstate == states.ratmount && tauntstoredratmount_movespeed >= 12 && !ispeppino
	{
		state = states.mach3;
		movespeed = tauntstoredratmount_movespeed;
		if movespeed < 12
			movespeed = 12;
		sprite_index = spr_mach4;
		image_index = 0;
	}
	if ispeppino && isgustavo
	{
		if state == states.mach2 || state == states.mach3
		{
			if state == states.mach3
			{
				ratmount_movespeed = 12;
				gusdashpadbuffer = 10;
			}
			else
				ratmount_movespeed = 6;
			state = states.ratmount;
			movespeed = ratmount_movespeed * xscale;
			if tauntstoredhsp != 0
				xscale = sign(tauntstoredhsp);
			sprite_index = spr_player_ratmountattack;
			image_index = 0;
		}
	}
	event_perform(ev_step, ev_step_end);
	create_particle(x, y, particle.genericpoofeffect);
}
instance_destroy();
