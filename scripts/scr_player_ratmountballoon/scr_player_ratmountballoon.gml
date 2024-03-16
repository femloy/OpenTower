function scr_player_ratmountballoon()
{
	sprite_index = spr_player_ratmountballoon;
	hsp = movespeed;
	move = key_left + key_right;
	if vsp < 2
		vsp += 0.1;
	else
		vsp = 2;
	image_speed = 0.35;
	if move != 0
		movespeed = Approach(movespeed, move * 8, 0.5);
	else
		movespeed = Approach(movespeed, 0, 0.5);
	var _jump = false;
	if balloonbuffer > 0
		balloonbuffer--;
	else
		_jump = true;
	if key_jump
		_jump = true;
	if _jump
	{
		input_buffer_jump = 0;
		input_buffer_jump_negative = 10;
		fmod_event_one_shot_3d("event:/sfx/rat/deflateeat", x, y);
		create_particle(x, y, particle.ratmountballooncloud, 0);
		state = states.ratmountjump;
		sprite_index = spr_player_ratmountballoonend1;
		image_index = 0;
		jumpAnim = true;
		vsp = -20;
		jumpstop = true;
	}
}
