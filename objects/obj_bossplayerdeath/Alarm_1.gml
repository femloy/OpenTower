with obj_player1
{
	global.player_damage = 0;
	global.swap_damage[0] = 0;
	global.swap_damage[1] = 0;
	global.peppino_damage = 0;
	global.swap_boss_damage = 0;
	global.bossplayerhurt = false;
	global.pistol = false;
	global.leveltorestart = -4;
	global.leveltosave = -4;
	global.startgate = false;
	ds_list_clear(global.saveroom);
	ds_list_clear(global.baddieroom);
	pistolanim = -4;
	targetDoor = "HUB";
	targetRoom = backtohubroom;
	room = backtohubroom;
	x = backtohubstartx;
	y = backtohubstarty;
	x = backtohubstartx;
	y = backtohubstarty - (SCREEN_HEIGHT * 2);
	state = states.backtohub;
	sprite_index = spr_slipbanan1;
	image_index = 10;
}
global.level_minutes = 0;
global.level_seconds = 0;
with obj_screensizer
	camzoom = 1;
with (instance_create(0, 0, obj_backtohub_fadeout))
{
	fadealpha = 1;
	fadein = false;
	pos_player = true;
}
