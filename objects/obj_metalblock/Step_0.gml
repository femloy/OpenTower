with obj_player1
{
	if character != "V"
	{
		if ((place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other)) && (obj_player1.state == states.mach3 || obj_player1.state == states.mach3 || (obj_player1.ghostdash == 1 && obj_player1.ghostpepper >= 3) || obj_player1.ratmount_movespeed >= 12 || obj_player1.state == states.rocket || obj_player1.state == states.knightpepslopes || obj_player1.state == states.shoulderbash))
		{
			playerindex = 0;
			instance_destroy(other);
		}
	}
}
if (place_meeting(x, y + 1, obj_player1) || place_meeting(x, y - 1, obj_player1) || place_meeting(x - 1, y, obj_player1) || place_meeting(x + 1, y, obj_player1))
{
	if obj_player1.ghostdash == 1 && obj_player1.ghostpepper >= 3
		instance_destroy();
	if (place_meeting(x, y - 1, obj_player1) && ((obj_player1.state == states.freefall || obj_player1.state == states.superslam) && obj_player1.freefallsmash >= 10))
	{
		with (instance_place(x, y - 1, obj_player1))
		{
			if character == "M"
			{
				state = states.jump;
				vsp = -7;
				sprite_index = spr_jump;
			}
		}
		playerindex = 0;
		instance_destroy();
	}
	if (place_meeting(x, y - 1, obj_player1) && (((obj_player1.state == states.ratmountbounce || obj_player1.state == states.noisecrusher) && obj_player1.vsp > 0) || obj_player1.state == states.knightpep || obj_player1.state == states.hookshot))
	{
		playerindex = 0;
		instance_destroy();
	}
}

with obj_player2
{
	if ((place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other)) && (obj_player2.state == states.mach3 || obj_player2.state == states.machcancel || obj_player2.state == states.knightpepslopes || obj_player2.state == states.shoulderbash))
	{
		playerindex = 1;
		instance_destroy(other);
	}
}
if (place_meeting(x, y + 1, obj_player2) || place_meeting(x, y - 1, obj_player2) || place_meeting(x - 1, y, obj_player2) || place_meeting(x + 1, y, obj_player2))
{
	if (place_meeting(x, y - 1, obj_player2) && ((obj_player2.state == states.freefall || obj_player2.state == states.superslam) && obj_player2.freefallsmash >= 10))
	{
		playerindex = 1;
		instance_destroy();
	}
	if (place_meeting(x, y - 1, obj_player2) && (obj_player2.state == states.knightpep || obj_player2.state == states.hookshot))
	{
		playerindex = 1;
		instance_destroy();
	}
}
