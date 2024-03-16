image_speed = 0.35;
depth = 20;
switch state
{
	case states.titlescreen:
		x = camera_get_view_x(view_camera[0]) - 100;
		y = camera_get_view_y(view_camera[0]) - 100;
		var dx = 350;
		var dy = 400;
		if room == space_11b
		{
			dx = 200;
			dy = 220;
		}
		if (global.panic && distance_to_pos(xstart, ystart, obj_player1.x, obj_player1.y, dx, dy))
		{
			state = states.fall;
			vsp = 20;
			x = xstart;
			y = camera_get_view_y(view_camera[0]) - 100;
			if sprite_index != spr_noiseyexit_fall && sprite_index != spr_noisette_fall
			{
				sprite_index = spr_lonegustavo_groundpound;
				if room == space_11b
					sprite_index = spr_gustavo_exitshuttle;
				else if (string_letters(room_get_name(room)) == "freezer")
					sprite_index = spr_gustavo_exitsignfreezer;
				else if (string_letters(room_get_name(room)) == "chateau")
					sprite_index = spr_gustavorat_fall;
				if stick
					sprite_index = spr_stick_fall;
			}
		}
		break;
	case states.fall:
		y += vsp;
		if vsp < 20
			vsp += 0.5;
		with (instance_place(x, y, obj_baddiecollisionbox))
		{
			instance_destroy(baddieID);
			instance_destroy();
		}
		if y >= ystart
		{
			y = ystart;
			instance_destroy(instance_place(x, y, obj_ramp));
			create_particle(x, y, particle.landcloud);
			state = states.normal;
			if sprite_index == spr_gustavo_exitshuttle
			{
				with (instance_create(x, y, obj_shuttleparts))
				{
					image_index = 3;
					vspeed = 10;
				}
				with (instance_create(x, y, obj_shuttleparts))
				{
					image_index = 2;
					vspeed = -10;
				}
				with (instance_create(x, y, obj_shuttleparts))
				{
					image_index = 1;
					hspeed = -10;
				}
				with (instance_create(x, y, obj_shuttleparts))
				{
					image_index = 0;
					hspeed = 10;
				}
				instance_create(x, y, obj_playerexplosion);
			}
			if sprite_index != spr_noiseyexit_fall && sprite_index != spr_noisette_fall
			{
				if (string_letters(room_get_name(room)) == "freezer")
					sprite_index = spr_gustavo_exitsignfreezer;
				else if (room == saloon_5 || room == saloon_4 || room == saloon_3 || room == saloon_2 || room == saloon_1)
					sprite_index = spr_gustavo_exitsigndrunk;
				else if (string_letters(room_get_name(room)) == "chateau")
					sprite_index = spr_gustavorat_exitsign;
				else
					sprite_index = spr_gustavo_exitsign;
				if stick
					sprite_index = spr_stick_exit;
			}
			else if sprite_index == spr_noiseyexit_fall
				sprite_index = spr_noiseyexit_idle;
			else
				sprite_index = spr_noisette_exit;
			image_index = 0;
		}
		break;
	case states.land:
		if floor(image_index) == image_number - 1
		{
			sprite_index = spr_gustavo_exitsign;
			if stick
				sprite_index = spr_stick_exit;
			state = states.normal;
		}
		break;
}
if state == states.titlescreen
	visible = false;
else
	visible = true;
