switch state
{
	case states.idle:
		if (!instance_exists(blockinst))
		{
			blockinst = instance_create(x, y, obj_solid);
			blockinst.sprite_index = sprite_index;
			blockinst.mask_index = mask_index;
			blockinst.visible = false;
		}
		break;
	case states.walk:
		if (blockinst != -4 && instance_exists(blockinst))
		{
			instance_destroy(blockinst);
			blockinst = -4;
		}
		hsp = image_xscale * movespeed;
		movespeed = Approach(movespeed, 8, 0.5);
		with (instance_place(x + sign(hsp), y, obj_ratblock))
		{
			if sprite_index != spr_rattumbleblock && sprite_index != spr_rattumbleblock_big
				instance_destroy();
		}
		if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid(x + sign(hsp), y - 2)) && (!place_meeting(x + sign(hsp), y, obj_ratblock) || place_meeting(x + sign(hsp), y, obj_rattumble)))
			image_xscale *= -1;
		with (instance_place(x + hsp, y, obj_destructibles))
			instance_destroy();
		break;
}
scr_collide();
