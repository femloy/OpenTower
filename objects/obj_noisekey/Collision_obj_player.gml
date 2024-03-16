if (other.instakillmove || other.state == states.handstandjump)
{
	with other
	{
		hsp = 0;
		vsp = 0;
		flash = true;
		fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
		state = states.gottreasure;
		with (instance_create(x, y - 50, obj_noisebigkey))
			alarm[0] = 150;
	}
	with obj_camera
	{
		shake_mag = 5;
		shake_mag_acc = 10 / room_speed;
	}
	repeat 2
	{
		with (create_debris(x, y, spr_slapstar))
			vsp = -irandom_range(5, 11);
	}
	repeat 2
	{
		with (create_debris(x, y, spr_baddiegibs))
			vsp = -irandom_range(5, 11);
	}
	fmod_event_one_shot("event:/sfx/misc/secretfound");
	instance_destroy();
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = spr_playerN_hurtjump;
	ini_open_from_string(obj_savesystem.ini_str);
	ini_write_real("w3stick", "noisekey", true);
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
}
