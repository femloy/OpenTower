if buffer == 0
{
	global.spaceblockswitch = !global.spaceblockswitch;
	if (sprite_index == spr_switchblock_happy || (sprite_index == spr_switchblock_gohappy && image_index > 0))
	{
		fmod_event_one_shot_3d("event:/sfx/misc/switchend", x, y);
		sprite_index = spr_switchblock_gosad;
		image_index = 0;
	}
	if (sprite_index == spr_switchblock_sad || (sprite_index == spr_switchblock_gosad && image_index > 0))
	{
		fmod_event_one_shot_3d("event:/sfx/misc/switchstart", x, y);
		sprite_index = spr_switchblock_gohappy;
		image_index = 0;
	}
	buffer = 60;
	instance_create(x, y, obj_bangeffect);
}
