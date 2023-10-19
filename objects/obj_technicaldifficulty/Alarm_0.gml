use_static = true;
static_index = sprite_get_number(spr_tvstatic) - 1;
static_dir = -1;
fmod_event_one_shot("event:/sfx/ui/tvswitchback");
with (playerid)
{
	if (!isgustavo)
		state = states.normal;
	else
		state = states.ratmount;
	visible = true;
	x = roomstartx;
	y = roomstarty;
	landAnim = false;
}
with (obj_ghostfollow)
{
	x = xstart;
	y = ystart;
}
