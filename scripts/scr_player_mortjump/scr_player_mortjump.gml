function scr_player_mortjump()
{
	image_speed = 0.35;
	move = key_left + key_right;
	hsp = movespeed;
	if !key_jump2 && !jumpstop && vsp < 0.5
	{
		jumpstop = true;
		vsp /= 20;
	}
	if move != 0
	{
		if move == xscale
			movespeed = Approach(movespeed, xscale * 8, 0.5);
		else
			movespeed = Approach(movespeed, 0, 0.5);
		if movespeed <= 0
			xscale = move;
	}
	else
		movespeed = Approach(movespeed, 0, 0.5);
	if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
	{
		movespeed = 0;
		if sprite_index == spr_player_barrelmove
			sprite_index = spr_player_barrelidle;
	}
	if (floor(image_index) == image_number - 1)
	{
		if sprite_index == spr_playermortjumpstart
			sprite_index = spr_playermortjump;
		else if sprite_index == spr_mortdoublejumpstart
			sprite_index = spr_mortdoublejump;
	}
	var dj = true;
	if input_buffer_jump > 0 && can_jump
	{
		dj = false;
		input_buffer_jump = 0;
		state = states.mortjump;
		vsp = -11;
		sprite_index = spr_playermortjumpstart;
		image_index = 0;
		doublejump = false;
		jumpstop = false;
		scr_fmod_soundeffect(jumpsnd, x, y);
		create_particle(x, y, particle.jumpdust, 0);
	}
	if grounded && vsp > 0
	{
		state = states.mort;
		landAnim = true;
		sprite_index = spr_playermortland;
		image_index = 0;
	}
	else if !doublejump && key_jump && dj
	{
		scr_fmod_soundeffect(jumpsnd, x, y);
		fmod_event_one_shot_3d("event:/sfx/mort/doublejump", x, y);
		jumpstop = false;
		input_buffer_jump = 0;
		doublejump = true;
		state = states.mortjump;
		sprite_index = spr_mortdoublejumpstart;
		image_index = 0;
		vsp = -11;
		repeat 4
			create_debris(x, y, spr_feather);
	}
	mort_attack();
}
