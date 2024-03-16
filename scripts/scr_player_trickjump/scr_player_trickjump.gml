function scr_player_trickjump()
{
	hsp = movespeed * xscale;
	if sprite_index != spr_supertaunt1 && sprite_index != spr_supertaunt2 && sprite_index != spr_supertaunt3 && sprite_index != spr_supertaunt4
	{
		if ispeppino
			image_speed = 0.35;
		if (sprite_index == spr_player_rampjump && floor(image_index) == image_number - 1)
			image_index = image_number - 1;
	}
	else
	{
		if ispeppino
			image_speed = 0.5;
		if floor(image_index) == image_number - 1
			sprite_index = spr_player_rampjump;
	}
	if (scr_solid(x + xscale, y) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		state = states.bump;
		image_index = 0;
		fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y);
		sprite_index = spr_wallsplat;
	}
	if ramp_buffer > 0
		ramp_buffer--;
	if !ispeppino
		image_speed = Approach(image_speed, 0.4, 0.1);
	if grounded && ramp_buffer <= 0
	{
		image_speed = 0.5;
		if sprite_index == spr_rampjump
		{
			sprite_index = spr_rollgetup;
			if movespeed < 12
				state = states.mach2;
			else
				state = states.mach3;
		}
		else
		{
			ramp_points = 0;
			fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
			state = states.freefallland;
			sprite_index = spr_bodyslamland;
			image_index = 0;
		}
		global.collect += (ramp_points * 100);
		ramp = false;
	}
}
