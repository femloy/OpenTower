function scr_player_ratmountclimbwall()
{
	image_speed = 0.5;
	hsp = 0;
	vsp = 0;
	if sprite_index != spr_player_ratmountbounceside
	{
		sprite_index = spr_player_ratmountbounceside;
		image_index = 0;
	}
	else if floor(image_index) == image_number - 1
		image_index = image_number - 1;
	if (!grounded && !place_meeting(x + 1, y, obj_solid) && !place_meeting(x - 1, y, obj_solid))
	{
		state = states.ratmountjump;
		jumpAnim = false;
		sprite_index = spr_player_ratmountfall;
	}
	if floor(image_index) == image_number - 1
	{
		if key_jump2 && input_buffer_jump_negative <= 0
		{
			state = states.ratmountbounce;
			xscale *= -1;
			vsp = -14;
			ratmount_fallingspeed = 0;
			movespeed = xscale * 10;
			fmod_event_one_shot_3d("event:/sfx/ratmount/walljump2", x, y);
			sprite_index = spr_player_ratmountwalljump;
		}
		else
		{
			state = states.ratmountjump;;
			sprite_index = spr_player_ratmountfall;
		}
	}
}
