function scr_player_ladder()
{
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	turning = false;
	jumpstop = false;
	movespeed = 0;
	hsp = 0;
	if key_up && hooked == 0
	{
		sprite_index = spr_laddermove;
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
	else if key_down && hooked == 0
	{
		sprite_index = spr_ladderdown;
		vsp = 10;
		image_speed = -0.35;
	}
	else
	{
		sprite_index = spr_Ladder;
		vsp = 0;
	}
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;
	if (!place_meeting(x, y, obj_ladder) && !place_meeting(x, y, obj_stairs))
	{
		landAnim = false;
		jumpAnim = false;
		state = states.normal;
		image_index = 0;
		if !hooked && vsp < 0
		{
			var _y = y;
			var i = 0;
			while !scr_solid(x, y + 1)
			{
				y++;
				if scr_solid(x, y)
				{
					y--;
					break;
				}
				
				i++;
				if i > 32
				{
					y = _y;
					break;
				}
			}
		}
		vsp = 0;
		hooked = false;
		ladderbuffer = 5;
	}
	if input_buffer_jump > 0
	{
		input_buffer_jump = 0;
		hooked = false;
		sprite_index = spr_jump;
		ladderbuffer = 20;
		if (place_meeting(x, y, obj_hookup))
			ladderbuffer = 30;
		jumpAnim = true;
		state = states.jump;
		if key_down
			vsp = 5;
		else
			vsp = -9;
		image_index = 0;
	}
	if (key_down && grounded && !place_meeting(x, y, obj_platform))
	{
		state = states.normal;
		image_index = 0;
	}
}
