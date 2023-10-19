y = Approach(y, obj_spaceshuttlestop.y, 40);
if (y > (obj_spaceshuttlestop.y - 18))
{
	with (obj_player)
	{
		if (check_player_coop())
		{
			xscale = obj_spaceshuttlestop.image_xscale;
			visible = true;
			pizzapepper = 0;
			sprite_index = spr_rockethitwall;
			fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
			fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
			with (obj_camera)
			{
				shake_mag = 50;
				shake_mag_acc = 80 / room_speed;
			}
			hsp = 0;
			image_speed = 0.35;
			with (obj_baddie)
			{
				if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
				{
					stun = true;
					alarm[0] = 200;
					ministun = false;
					vsp = -5;
					hsp = 0;
				}
			}
			flash = false;
			state = states.bump;
			hsp = 0;
			vsp = -11;
			mach2 = 0;
			image_index = 0;
			if (room == space_1)
			{
				repeat (4)
				{
					with (instance_create(x, y, obj_tinyslimedude))
					{
						vsp = random_range(-5, -10);
						image_xscale = choose(-1, 1);
						hsp = random_range(-5, 5);
					}
				}
				repeat (5)
					create_debris(x + random_range(-20, 20), y + 40, spr_spacedebris);
			}
			if (room == space_5)
			{
				repeat (5)
					create_debris(x + random_range(-20, 20), y + 40, spr_planetdebris);
			}
			if (room == space_9)
			{
				repeat (5)
					instance_create(x + random_range(-50, 50), y + random_range(-50, 50), obj_olivebubbledeco);
				repeat (5)
					create_debris(x + random_range(-20, 20), y + 40, spr_space3debris);
			}
			with (instance_create(x, y, obj_shuttleparts))
			{
				image_index = 3;
				vspeed = 20;
			}
			with (instance_create(x, y, obj_shuttleparts))
			{
				image_index = 2;
				vspeed = -20;
			}
			with (instance_create(x, y, obj_shuttleparts))
			{
				image_index = 1;
				hspeed = -20;
			}
			with (instance_create(x, y, obj_shuttleparts))
			{
				image_index = 0;
				hspeed = 20;
			}
			instance_create(x, y, obj_playerexplosion);
		}
	}
	instance_destroy();
}
