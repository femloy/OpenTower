if (!start && ds_list_find_index(global.saveroom, id) == -1)
{
	start = true;
	fmod_event_one_shot_3d("event:/sfx/misc/racestart", x, y);
	with obj_horsey
	{
		hsp = other.hsp * other.spd;
		vsp = other.vsp * other.spd;
		spd = other.spd;
		with (instance_create(x, y, obj_objecticontracker))
		{
			objectID = other.id;
			sprite_index = spr_icon_horsey;
		}
	}
	with obj_raceend
		start = true;
	sprite = spr_horsey_start2;
	start_index = 0;
	global.horse = true;
}
