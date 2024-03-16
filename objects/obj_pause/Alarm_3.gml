pause = false;
var rm = room;
if !hub
{
	obj_player1.targetRoom = Realtitlescreen;
	obj_player2.targetRoom = Realtitlescreen;
	room = Realtitlescreen;
	with obj_player1
	{
		character = "P";
		scr_characterspr();
	}
	global.leveltosave = -4;
	global.leveltorestart = -4;
	scr_playerreset();
	alarm[0] = 2;
	obj_player1.state = states.titlescreen;
	obj_player2.state = states.titlescreen;
	obj_player1.targetDoor = "A";
	if (instance_exists(obj_player2))
		obj_player2.targetDoor = "A";
	global.cowboyhat = false;
	global.coop = false;
}
else
{
	global.levelreset = false;
	scr_playerreset();
	with obj_player1
		swap_player();
	global.levelreset = true;
	obj_player1.targetDoor = "HUB";
	if (instance_exists(obj_player2))
		obj_player2.targetDoor = "HUB";
	global.leveltorestart = -4;
	global.leveltosave = -4;
	with (instance_create(0, 0, obj_backtohub_fadeout))
	{
		fadealpha = 1;
		fadein = false;
		reset = true;
		pos_player = false;
		obj_player1.targetRoom = obj_player1.backtohubroom;
		obj_player2.targetRoom = obj_player1.backtohubroom;
		room_goto(obj_player1.backtohubroom);
	}
}
if (rm == boss_pizzaface || rm == boss_noise || rm == boss_pepperman || rm == boss_fakepep || rm == boss_vigilante)
	global.bossintro = true;
