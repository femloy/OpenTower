function get_percentage()
{
	var levels = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "minigolf", "space", "sewer", "industrial", "street", "freezer", "chateau", "war", "kidsparty", "exit"];
	var bosses = ["w1stick", "w2stick", "w3stick", "w4stick", "w5stick"];
	var bossach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface"];
	var bossranks = ["b_pepperman", "b_vigilante", "b_noise", "b_fakepep"];
	var _basemax = ((array_length(bosses) + array_length(levels) + ((array_length(levels) - 1) * 5) + array_length(levels)) - 1) + array_length(levels) + array_length(levels) + array_length(levels) + array_length(levels) + array_length(bossranks) + array_length(bossranks) + array_length(bossranks) + array_length(bossranks) + ((array_length(levels) - 1) * 3);
	var _extramax = (array_length(bossach) + array_length(levels) + array_length(bossranks) + array_length(levels)) - 1;
	var count = 0;
	var extracount = 0;
	var _rank_map = ds_map_create();
	ds_map_set(_rank_map, "p", 4);
	ds_map_set(_rank_map, "s", 4);
	ds_map_set(_rank_map, "a", 3);
	ds_map_set(_rank_map, "b", 2);
	ds_map_set(_rank_map, "c", 1);
	ds_map_set(_rank_map, "d", 0);
	for (var i = 0; i < array_length(levels); i++)
	{
		var level = levels[i];
		if (ini_read_real("Highscore", level, 0) > 0)
			count++;
		if (ini_read_real("Treasure", level, false))
			count++;
		var tc = 0;
		for (var j = 0; j < 5; j++)
		{
			if (ini_read_real("Toppin", concat(level, j + 1), false))
				count++;
		}
		var r = ini_read_string("Ranks", level, "d");
		if (r == "p")
			extracount++;
		count += ds_map_find_value(_rank_map, r);
		count += ini_read_real("Secret", level, 0);
		var ac = 0;
		for (j = 0; j < 3; j++)
		{
			if (ini_read_real("achievements", concat(level, j + 1), false))
				ac++;
		}
		if (ac >= 3)
			extracount++;
	}
	for (i = 0; i < array_length(bosses); i++)
	{
		var boss = bosses[i];
		if (ini_read_real(boss, "bosskey", false))
			count++;
	}
	for (i = 0; i < array_length(bossranks); i++)
	{
		boss = bossranks[i];
		r = ini_read_string("Ranks", boss, "d");
		if (r == "p")
			extracount++;
		count += ds_map_find_value(_rank_map, r);
	}
	for (i = 0; i < array_length(bossach); i++)
	{
		if (ini_read_real("achievements", bossach[i], false))
			extracount++;
	}
	var per = floor((count / _basemax) * 100);
	if (per > 100)
		per = 100;
	var extraper = extracount >= _extramax;
	trace("Base count: ", count, " out of ", _basemax);
	trace("Extra count: ", extracount, " out of ", _extramax);
	trace("Percentage: ", per, " and ", extraper);
	return per + extraper;
}
function gamesave_async_load()
{
	with (obj_savesystem)
	{
		if (state == 0)
		{
			loadbuff = buffer_create(1, 1, 1);
			buffer_async_group_begin("saves");
			buffer_load_async(loadbuff, get_savefile_ini(), 0, -1);
			loadid = buffer_async_group_end();
			state = 2;
		}
	}
}
function gamesave_async_save()
{
	with (obj_savesystem)
	{
		dirty = true;
		savegame = true;
	}
}
function gamesave_async_save_options()
{
	with (obj_savesystem)
	{
		dirty = true;
		saveoptions = true;
	}
}
