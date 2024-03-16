function scr_player_backtohub()
{
	global.leveltorestart = -4;
	global.noisejetpack = false;
	hsp = 0;
	movespeed = 0;
	if sprite_index != spr_rockethitwall
		vsp = 0;
	image_speed = 0.35;
	if sprite_index == spr_slipbanan1
	{
		if y < backtohubstarty
		{
			y += 20;
			if y >= backtohubstarty
			{
				fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
				create_particle(x, y, particle.landcloud);
				y = backtohubstarty;
				sprite_index = spr_rockethitwall;
				vsp = -14;
				instance_create(x, y + 39, obj_bangeffect);
				image_index = 0;
				with obj_camera
				{
					shake_mag = 3;
					shake_mag_acc = 5 / room_speed;
				}
			}
		}
	}
	else if sprite_index == spr_rockethitwall
	{
		y += vsp;
		if vsp < 20
			vsp += grav;
		if y >= backtohubstarty && vsp > 0
		{
			y = backtohubstarty;
			sprite_index = spr_slipbanan2;
			image_index = 0;
			vsp = 0;
			backtohubbuffer = 25;
		}
	}
	else if (sprite_index == spr_slipbanan2 && floor(image_index) == image_number - 1)
	{
		image_index = image_number - 1;
		if backtohubbuffer > 0
			backtohubbuffer--;
		else
		{
			state = states.normal;
			landAnim = false;
			facestompAnim = true;
		}
	}
}
