with (other)
{
	if (state != states.gotoplayer && state != states.fireass)
	{
		image_index = 0;
		state = states.fireass;
		vsp = -21;
		sprite_index = spr_scaredjump1;
		scr_monster_activate();
	}
}
