if (state == states.normal)
{
	with (other)
	{
		fmod_event_one_shot("event:/sfx/misc/bosskey");
		state = states.gottreasure;
		sprite_index = spr_gottreasure;
	}
	state = states.gottreasure;
	x = other.x;
	y = other.y - 50;
	if (!instance_exists(obj_bosscontroller))
		alarm[0] = 150;
	depth = -20;
	with (obj_bosscontroller)
	{
		state = states.victory;
		with (obj_hpeffect)
			spd = 16;
	}
	ini_open_from_string(obj_savesystem.ini_str);
	ini_write_real(save, "bosskey", true);
	obj_savesystem.ini_str = ini_close();
}
