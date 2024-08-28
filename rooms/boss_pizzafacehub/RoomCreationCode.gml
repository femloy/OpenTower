pal_swap_init_system(shd_pal_swapper);
notification_push(notifs.boss_dead, [boss_pizzafacehub]);
gameframe_caption_text = lang_get_value("caption_boss_pizzafacehub");

ini_open_from_string(obj_savesystem.ini_str);
ini_write_real("w5stick", "bosskey", true);
obj_savesystem.ini_str = ini_close();
gamesave_async_save();

if obj_player1.ispeppino && !global.swapmode
{
	layer_set_visible("Backgrounds_Ring2", true);
	layer_set_visible("Backgrounds_Ring3", false);
}
else
{
	layer_set_visible("Backgrounds_Ring3", true);
	layer_set_visible("Backgrounds_Ring2", false);
}

with obj_player1
{
	tauntstoredstate = states.normal;
	landAnim = true;
	state = states.animation;
	buffer = 100;
	sprite_index = spr_slipbanan2;
	image_index = sprite_get_number(spr_slipbanan2) - 1;
	image_speed = 0.35;
	if !ispeppino
	{
		sprite_index = spr_playerN_bombend;
		image_index = 0;
	}
}
global.roommessage = "PIZZA TOWER ISLAND";
global.leveltorestart = tower_finalhallway;
