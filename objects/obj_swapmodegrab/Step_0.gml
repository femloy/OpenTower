switch state
{
	case 0:
		vsp = 0;
		hsp = image_xscale * movespeed;
		if floor(image_index) == image_number - 1
		{
			state++
			sprite_index = spr_fall
		}
		if floor(image_index) >= image_number - 4 && vsp < 20
			vsp += grav;
		if !instance_exists(slidecloudID)
		{
			with instance_create(x, y, obj_slidecloud)
			{
				image_xscale = other.image_xscale;
				other.slidecloudID = id;
			}
		}
		break
	
	case 1:
		if vsp < 20
			vsp += grav;
		if y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 200
			instance_destroy();
		break
}

x += hsp;
y += vsp;
fmod_event_instance_set_3d_attributes(grab_snd, x, y);
