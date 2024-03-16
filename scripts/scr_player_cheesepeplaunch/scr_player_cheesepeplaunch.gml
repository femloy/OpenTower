function scr_player_cheesepeplaunch()
{
	hsp = xscale * movespeed;
	if floor(image_index) == image_number - 1
	{
		if sprite_index == spr_cheesepepjumpstart
			sprite_index = spr_cheesepepjump;
		else if sprite_index == spr_cheesepepjump && vsp > 0
			sprite_index = spr_cheesepepfall;
	}
	if grounded
	{
		state = states.cheesepep;
		sprite_index = spr_cheesepepland;
		image_index = 0;
	}
	if (place_meeting(x + sign(xscale), y, obj_solid) && !place_meeting(x, y + 1, obj_slope))
	{
		state = states.cheesepepstick;
		wallspeed = movespeed;
		if vsp < 0
		{
			wallspeed = movespeed - 2;
			if wallspeed < 2
				wallspeed = 6;
			if wallspeed > 8
				wallspeed = 8;
		}
		else
			wallspeed = 0;
		movespeed = 0;
		sticktime = 10;
	}
}
