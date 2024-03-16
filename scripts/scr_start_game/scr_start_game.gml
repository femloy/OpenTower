function scr_start_game(slot, peppino = true)
{
	instance_create(x, y, obj_fadeout);
	with obj_player
	{
		targetRoom = hub_loadingscreen;
		targetDoor = "A";
	}
	with obj_savesystem
		ispeppino = peppino;
	global.currentsavefile = slot;
	gamesave_async_load();
}
