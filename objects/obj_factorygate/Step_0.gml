image_speed = 0.35;
switch state
{
	case states.normal:
		if sprite_index == spr_arenagate_opened
		{
			if (blockinst != -4 && instance_exists(blockinst))
			{
				blockinst = -4;
				instance_destroy(blockinst);
			}
		}
		else if sprite_index == spr_arenagate_close
			image_index = image_number - 1;
		break;
	case states.transition:
		if (sprite_index == spr_arenagate_open && floor(image_index) == image_number - 1)
		{
			state = states.normal;
			sprite_index = spr_arenagate_opened;
			instance_destroy(blockinst);
		}
		else if (sprite_index == spr_arenagate_close && floor(image_index) == image_number - 1)
		{
			image_index = image_number - 1;
			state = states.normal;
			with (instance_create(x, y, obj_solid))
			{
				visible = false;
				sprite_index = other.sprite_index;
				mask_index = other.mask_index;
				other.blockinst = id;
			}
		}
		break;
}
