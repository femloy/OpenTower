if do_rank
{
	with (instance_create(room_width / 2, room_height / 2, obj_rank))
	{
		toppinvisible = other.toppinvisible;
		if !toppinvisible && global.leveltosave != "exit" && global.leveltosave != "secretworld"
		{
			if !global.swapmode
				array_delete(text, 0, 1);
			else
				array_delete(text, 0, 3);
			array_pop(text);
		}
		depth = other.depth - 1;
		ini_open_from_string(obj_savesystem.ini_str);
		for (var i = 0; i < array_length(toppin); i++)
		{
			if global.newtoppin[i]
				toppin[i] = 1;
			else if (ini_read_real("Toppin", global.leveltosave + string(i + 1), false))
				toppin[i] = 2;
			else
				toppin[i] = 0;
		}
		ini_close();
	}
}
else
{
	instance_create(0, 0, obj_endgamefade);
	alarm[1] = 120;
}
if (instance_exists(obj_treasureviewer) || !do_rank)
	exit;
obj_player1.visible = false;
obj_player2.visible = false;
if global.collect >= global.collectN
{
	with (instance_create(obj_player2.x, obj_player2.y, obj_dashcloud))
		sprite_index = spr_bombexplosion;
	repeat 6
		instance_create(obj_player2.x, obj_player2.y, obj_baddiegibs);
}
if global.collectN > global.collect
{
	with (instance_create(obj_player1.x, obj_player1.y, obj_dashcloud))
		sprite_index = spr_bombexplosion;
	repeat 6
		instance_create(obj_player1.x, obj_player1.y, obj_baddiegibs);
	fmod_event_one_shot("event:/sfx/misc/explosion");
}
