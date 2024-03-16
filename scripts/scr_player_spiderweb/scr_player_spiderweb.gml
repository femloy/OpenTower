function scr_player_spiderweb()
{
	hsp = 0;
	vsp = 0;
	movespeed = 0;
	move = key_left + key_right;
	sprite_index = spr_fall;
	image_speed = 0.35;
	if move != 0
		xscale = move;
	if (instance_exists(webID))
	{
		x = webID.x;
		y = webID.y;
	}
	if key_jump
	{
		if (instance_exists(webID))
		{
			with webID
				event_user(0);
		}
		state = states.jump;
		vsp = -11;
		jumpstop = false;
		sprite_index = spr_jump;
		image_index = 0;
		jumpAnim = true;
	}
}
