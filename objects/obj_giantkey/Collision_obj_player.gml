if picked == 0 && pickable == 1
{
	hsp = 0;
	vsp = 0;
	grav = 0;
	if other.object_index == obj_player1
		playerid = obj_player1;
	else
		playerid = obj_player2;
	alarm[0] = 150;
	y = playerid.y - 50;
	x = playerid.x;
	with playerid
	{
		state = states.gottreasure;
		fmod_event_one_shot("event:/sfx/misc/secretfound");
		global.giantkey = true;
	}
	obj_tv.showtext = true;
	obj_tv.message = "GOT THE GIANT KEY!!!";
	obj_tv.alarm[0] = 200;
	global.heattime = 60;
	picked = true;
}
