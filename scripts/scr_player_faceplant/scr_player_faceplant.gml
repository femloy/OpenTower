function scr_player_faceplant()
{
	hsp = xscale * movespeed;
	move = key_right + key_left;
	if movespeed < 10 && grounded
		movespeed += 0.5;
	else if !grounded
		movespeed = 10;
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles))
	{
		sprite_index = spr_hitwall;
		with obj_camera
		{
			shake_mag = 20;
			shake_mag_acc = 40 / room_speed;
		}
		hsp = 0;
		image_speed = 0.35;
		with obj_baddie
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded)
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
		hsp = -2.5;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create(x + 10, y + 10, obj_bumpeffect);
	}
	if (floor(image_index) == image_number - 1 && !key_attack)
	{
		image_speed = 0.35;
		state = states.normal;
		grav = 0.5;
	}
	if (floor(image_index) == image_number - 1 && key_attack)
	{
		image_speed = 0.35;
		state = states.mach2;
		grav = 0.5;
	}
	if key_down && grounded && vsp > 0
	{
		grav = 0.5;
		sprite_index = spr_crouchslip;
		machhitAnim = false;
		state = states.crouchslide;
		movespeed = 15;
	}
	if (!instance_exists(obj_dashcloud2) && grounded && movespeed > 5)
	{
		with (instance_create(x, y, obj_dashcloud2))
			image_xscale = other.xscale;
	}
}
