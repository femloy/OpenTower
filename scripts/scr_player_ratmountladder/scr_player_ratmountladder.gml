function scr_player_ratmountladder()
{
	movespeed = 0;
	hsp = 0;
	if key_up
	{
		sprite_index = spr_lonegustavo_ladder;
		vsp = -6;
		if steppybuffer > 0
			steppybuffer--;
		else
		{
			create_particle(x, y + 43, particle.cloudeffect, 0);
			steppybuffer = 12;
			fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
		}
		image_speed = 0.35;
	}
	else if key_down
	{
		sprite_index = spr_lonegustavo_ladderdown;
		vsp = 10;
		image_speed = -0.35;
	}
	else
	{
		sprite_index = spr_lonegustavo_ladder;
		vsp = 0;
		image_speed = 0;
	}
	ladderbuffer = 20;
	if (!place_meeting(x, y, obj_ladder) && !place_meeting(x, y, obj_stairs))
	{
		state = states.ratmountjump;
		sprite_index = spr_player_ratmountgroundpoundfall;
		image_index = 0;
		vsp = 0;
	}
	if input_buffer_jump > 0
	{
		input_buffer_jump = 0;
		ladderbuffer = 20;
		state = states.ratmountjump;
		sprite_index = spr_player_ratmountgroundpound;
		if key_down
			vsp = 5;
		else
			vsp = -9;
		image_index = 0;
		jumpAnim = true;
		image_speed = 0.35;
	}
	if (key_down && grounded && !place_meeting(x, y, obj_platform))
	{
		image_speed = 0.35;
		sprite_index = spr_player_ratmountgroundpoundfall;
		state = states.ratmountjump;
		image_index = 0;
	}
}
