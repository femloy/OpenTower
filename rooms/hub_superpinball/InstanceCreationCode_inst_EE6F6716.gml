sprite_index = spr_ufogrounded_walk;
dialog[0] = dialog_create("Go ahead!", -4, function()
{
	if (global.superpinballcutscene == noone || !global.superpinballcutscene)
	{
		global.superpinballcutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "superpinball", true);
		with (obj_door)
			locked = false;
	}
});
