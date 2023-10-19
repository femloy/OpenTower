with (obj_bosskeyspawn)
{
	ini_open_from_string(obj_savesystem.ini_str);
	var _spawn = true;
	if (ini_read_real(save, "bosskey", false))
		_spawn = false;
	ini_close();
	if (_spawn)
	{
		with (obj_player1)
		{
			if (state == states.arenaintro)
			{
				state = states.normal;
				isgustavo = false;
			}
		}
		with (instance_create(x, -100, obj_bosskey))
		{
			save = other.save;
			y_to = other.y;
		}
	}
	else
	{
		with (other)
		{
			state = states.victory;
			with (obj_hpeffect)
				spd = 16;
		}
	}
}
