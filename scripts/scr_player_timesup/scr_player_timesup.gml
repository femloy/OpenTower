function scr_player_timesup()
{
	xscale = 1;
	inv_frames = false;
	movespeed = 0;
	if sprite_index != spr_player_ratmounttimesup
		sprite_index = spr_Timesup;
	alarm[7] = -1;
	alarm[8] = -1;
	alarm[5] = -1;
	if (place_meeting(x, y, obj_timesup))
	{
		state = states.dead;
		if sprite_index != spr_player_ratmounttimesup
			sprite_index = spr_deathend;
		else
		{
			sprite_index = spr_player_ratmountgameover;
			with (create_debris(x, y, spr_ratblock_dead))
			{
				hsp = 4;
				vsp = -8;
			}
		}
		alarm[10] = 5;
		vsp = -8;
		hsp = -4;
	}
	if room == timesuproom
	{
		obj_player1.x = 480;
		obj_player1.y = 270;
		obj_player2.x = -100;
		obj_player2.y = -100;
	}
	if (floor(image_index) == 9)
		image_speed = 0;
}
