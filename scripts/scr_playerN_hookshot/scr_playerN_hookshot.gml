function scr_playerN_hookshot()
{
	move = key_left + key_right;
	hsp = movespeed * move;
	if (move != 0)
		xscale = move;
	if (key_jump)
	{
		vsp = -6;
		instance_create(x, y, obj_washingmachine);
		sprite_index = spr_jump;
		stompAnim = false;
		state = states.jump;
		jumpAnim = true;
		jumpstop = false;
		image_index = 0;
		freefallstart = 0;
	}
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	if (grounded)
	{
		with (obj_camera)
		{
			shake_mag = 5;
			shake_mag_acc = 10 / room_speed;
		}
		vsp = -5;
		with (instance_create(x, y + 35, obj_bangeffect))
			image_xscale = obj_player.image_xscale;
		instance_create(x, y, obj_landcloud);
		with (obj_baddie)
		{
			if (grounded && point_in_camera(x, y, view_camera[0]))
			{
				image_index = 0;
				state = states.idle;
				vsp = -7;
				hsp = 0;
			}
		}
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_hookshot1)
		sprite_index = spr_playerN_hookshot2;
	if (move != 0)
	{
		if (movespeed < 8)
			movespeed += 0.25;
		else if (movespeed == 8)
			movespeed = 8;
	}
	else
		movespeed = 0;
	image_speed = 0.35;
}
