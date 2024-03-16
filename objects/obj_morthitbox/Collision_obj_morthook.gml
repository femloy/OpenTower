var mh_id = other.id;
other.projectilebuffer = 20;
if (instance_exists(obj_parryeffect))
{
	with obj_parryeffect
	{
		if follow == 1
			instance_destroy();
	}
}
with playerid
{
	if state != states.morthook
	{
		fmod_event_one_shot_3d("event:/sfx/mort/hook", other.x, other.y);
		state = states.morthook;
		morthookID = mh_id;
		tauntstoredmovespeed = movespeed;
		movespeed = 12;
		if !ispeppino
			movespeed = 20;
		jumpstop = false;
		instance_destroy(other);
	}
}
with (instance_create(other.x, other.y + 10, obj_parryeffect))
	sprite_index = spr_morthookgrabeffect;
instance_destroy();
