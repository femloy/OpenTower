function cutscene_entrance_start()
{
	with obj_player
	{
		state = states.actor;
		sprite_index = spr_walkfront;
		image_speed = 0.35;
		other.xscale = xscale;
		other.spr_idle = spr_idle;
	}
	cutscene_end_action();
}
