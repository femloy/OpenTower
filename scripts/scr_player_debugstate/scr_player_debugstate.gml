function scr_player_debugstate()
{
	visible = true;
	image_blend = c_white;
	var _spd = 6;
	if (key_attack)
		_spd = 10;
	hsp = (key_left + key_right) * _spd;
	vsp = -(key_up - key_down) * _spd;
	image_speed = 1;
	sprite_index = spr_idle;
	if (key_jump || key_slap2)
	{
		image_speed = 0.35;
		state = states.normal;
	}
}
