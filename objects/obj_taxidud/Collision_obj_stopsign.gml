if playerid.visible == 0
{
	jumpbuffer = 15;
	start = true;
	with obj_player1
	{
		fmod_event_one_shot("event:/sfx/misc/taxibeep");
		if isgustavo
		{
			state = states.ratmount;
			sprite_index = spr_player_ratmountidle;
		}
		else
			state = states.normal;
		instance_create(x, y, obj_genericpoofeffect);
		movespeed = 0;
		ratmount_movespeed = 0;
		cutscene = false;
	}
	if global.coop == 1
	{
		with obj_player2
		{
			state = states.normal;
			cutscene = false;
		}
	}
	obj_player1.visible = true;
	obj_player2.visible = true;
}
