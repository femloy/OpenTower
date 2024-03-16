function scr_playerN_throwkick()
{
	hsp = -xscale * movespeed;
	move = key_left + key_right;
	movespeed = Approach(movespeed, 0, 0.2);
	if image_index > 4 && !bombthrow
	{
		with (instance_create(x + (xscale * 20), y, obj_playerbomb))
		{
			vsp = -5;
			movespeed = 14;
			image_xscale = other.xscale;
		}
		movespeed = 4;
		vsp = -4;
		with (instance_create(x + (xscale * 10), y, obj_noiseeffect))
			sprite_index = spr_noisewalljumpeffect;
		particle_set_scale(particle.jumpdust, -xscale, 1);
		create_particle(x, y, particle.jumpdust, 0);
		bombthrow = true;
	}
	image_speed = 0.35;
	if floor(image_index) == image_number - 1
		state = 0;
	if punch_afterimage > 0
		punch_afterimage--;
	else
	{
		punch_afterimage = 5;
		with (create_blur_afterimage(x, y, sprite_index, image_index, xscale))
			playerid = other.id;
	}
	if input_buffer_shoot > 0
		scr_bombshoot();
}
