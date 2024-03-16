if active
{
	with obj_player
	{
		state = states.actor;
		hsp = 0;
		vsp = 0;
		visible = false;
	}
}
if floor(image_index) == image_number - 1
{
	switch sprite_index
	{
		case spr_pizzaportal_appear:
			fmod_event_one_shot_3d("event:/sfx/misc/secretexit", x, y);
			sprite_index = spr_pizzaportalentrancestart;
			if !obj_player1.ispeppino
				sprite_index = spr_pizzaportalentrancestartN;
			break;
		case spr_pizzaportalentrancestart:
		case spr_pizzaportalentrancestartN:
			sprite_index = spr_pizzaportal_disappear;
			with obj_player
			{
				state = states.normal;
				visible = true;
			}
			active = false;
			break;
		case spr_pizzaportal_disappear:
			instance_create_unique(0, 0, obj_lap2visual);
			instance_destroy();
			break;
	}
}
