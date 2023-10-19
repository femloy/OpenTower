if (state == states.normal && !instance_exists(obj_option))
{
	if (sprite_index != spr_titlepep_punch && sprite_index != spr_titlepep_angry)
	{
		savedsprite = sprite_index;
		savedindex = image_index;
	}
	vsp = -2;
	sprite_index = spr_titlepep_punch;
	image_index = irandom(sprite_get_number(sprite_index) - 1);
	image_speed = 0;
	alarm[1] = 20;
	fmod_event_one_shot_3d("event:/sfx/misc/cowkick", room_width / 2, room_height / 2);
	with (instance_create(punch_x, punch_y, obj_bangeffect))
		depth = other.depth - 1;
	repeat (2)
	{
		with (create_debris(punch_x, punch_y, spr_slapstar))
			vsp = -irandom_range(8, 11);
	}
}
