function scr_player_shotgunfreefall()
{
	image_speed = 0.35;
	move = key_left + key_right;
	hsp = move * movespeed;
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	if (move != 0)
	{
		if (movespeed < 8)
			movespeed += 0.5;
	}
	else
		movespeed = 0;
	if (sprite_index == spr_shotgunjump1)
	{
		if (floor(image_index) == (image_number - 1))
		{
			sprite_index = spr_shotgunjump3;
			image_index = 0;
		}
	}
	if (sprite_index == spr_shotgunjump3)
	{
		if (grounded)
		{
			sprite_index = spr_shotgunjump2;
			image_index = 0;
			fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
			create_particle(x, y, particle.landcloud, 0);
			with (obj_camera)
			{
				shake_mag = 5;
				shake_mag_acc = 15 / room_speed;
			}
		}
	}
	if (sprite_index == spr_shotgunjump2)
	{
		hsp = 0;
		if (floor(image_index) == (image_number - 1))
		{
			state = states.shotgun;
			sprite_index = spr_shotgunland;
			image_index = 0;
			landAnim = true;
		}
	}
}
