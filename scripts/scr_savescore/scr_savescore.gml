function scr_savescore(level)
{
	if ((global.collect + global.collectN) >= global.srank)
	{
		global.rank = "s";
		if (scr_is_p_rank())
			global.rank = "p";
		if global.snickchallenge == 1
			global.SAGEsnicksrank = true;
	}
	else if ((global.collect + global.collectN) > global.arank)
		global.rank = "a";
	else if ((global.collect + global.collectN) > global.brank)
		global.rank = "b";
	else if ((global.collect + global.collectN) > global.crank)
		global.rank = "c";
	else
		global.rank = "d";
	scr_play_rank_music();
	ini_open_from_string(obj_savesystem.ini_str);
	ini_write_real("Attempts", level, ini_read_real("Attempts", level, 0) + global.levelattempts + 1);
	global.levelattempts = 0;
	if (ini_read_real("Highscore", level, 0) < global.collect)
		ini_write_real("Highscore", level, global.collect);
	if (ini_read_real("Treasure", level, 0) == 0)
		ini_write_real("Treasure", level, global.treasure);
	var _enemies = ini_read_real("Game", "enemies", 0);
	ini_write_real("Game", "enemies", _enemies + global.enemykilled);
	var _damage = ini_read_real("Game", "damage", 0);
	ini_write_real("Game", "damage", _damage + global.player_damage);
	if global.secretfound > 3
		global.secretfound = 3;
	if (ini_read_real("Secret", level, 0) < global.secretfound)
		ini_write_string("Secret", level, global.secretfound);
	global.newtoppin[0] = false;
	global.newtoppin[1] = false;
	global.newtoppin[2] = false;
	global.newtoppin[3] = false;
	global.newtoppin[4] = false;
	if (ini_read_real("Toppin", level + "1", false) == 0)
	{
		if global.shroomfollow
			global.newtoppin[0] = true;
		ini_write_real("Toppin", level + "1", global.shroomfollow);
	}
	if (ini_read_real("Toppin", level + "2", false) == 0)
	{
		if global.cheesefollow
			global.newtoppin[1] = true;
		ini_write_real("Toppin", level + "2", global.cheesefollow);
	}
	if (ini_read_real("Toppin", level + "3", false) == 0)
	{
		if global.tomatofollow
			global.newtoppin[2] = true;
		ini_write_real("Toppin", level + "3", global.tomatofollow);
	}
	if (ini_read_real("Toppin", level + "4", false) == 0)
	{
		if global.sausagefollow
			global.newtoppin[3] = true;
		ini_write_real("Toppin", level + "4", global.sausagefollow);
	}
	if (ini_read_real("Toppin", level + "5", false) == 0)
	{
		if global.pineapplefollow
			global.newtoppin[4] = true;
		ini_write_real("Toppin", level + "5", global.pineapplefollow);
	}
	scr_write_rank(level);
	obj_savesystem.ini_str = ini_close();
}
function scr_play_rank_music()
{
	var s = 4.5;
	if global.rank == "p"
		s = 5.5;
	if global.rank == "s"
		s = 0.5;
	if global.rank == "a"
		s = 1.5;
	if global.rank == "b"
		s = 2.5;
	if global.rank == "c"
		s = 3.5;
	if global.rank == "d"
		s = 4.5;
	if ((room != tower_entrancehall || global.exitrank) && room != tower_tutorial1 && room != tower_tutorial1N)
	{
		fmod_event_instance_play(global.snd_rank);
		fmod_event_instance_set_parameter(global.snd_rank, "rank", s, true);
	}
}
function scr_write_rank(level)
{
	var _rank = ini_read_string("Ranks", level, "d");
	var _map = ds_map_create();
	ds_map_set(_map, "d", 0);
	ds_map_set(_map, "c", 1);
	ds_map_set(_map, "b", 2);
	ds_map_set(_map, "a", 3);
	ds_map_set(_map, "s", 4);
	ds_map_set(_map, "p", 5);
	if (ds_map_find_value(_map, global.rank) >= ds_map_find_value(_map, _rank))
		ini_write_string("Ranks", level, global.rank);
	ds_map_destroy(_map);
}
