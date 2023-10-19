if (global.ruincutscene == noone)
	global.ruincutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "ruin", false);
if (!global.ruincutscene)
	instance_destroy();
sprite_index = spr_pizzagoblin_idle;
dialog = -4;
pb_dialog[0] = [dialog_create("Welcome to the bomb store."), dialog_create("Would you like to purchase the only item in stock?"), dialog_create("It doesn't seem you have enough money though, come back later before you miss out in this explosive deal.")];
pb_dialog[1] = [dialog_create("Welcome to the bomb store."), dialog_create("Would you like to purchase the only item in stock?"), dialog_create("There you go buddy", -4, function()
{
	global.ruincutscene2 = true;
	quick_ini_write_real(get_savefile_ini(), "cutscene", "ruin2", true);
	if (!instance_exists(obj_baddiespawner))
	{
		with (instance_create(864, 960, obj_baddiespawner))
			content = obj_pizzagoblinbomb;
	}
})];
dialog_func = function()
{
	var no_money = false;
	if (no_money)
		do_dialog(pb_dialog[0]);
	else
		do_dialog(pb_dialog[1]);
};
