if spawn_buffer > 0
	spawn_buffer--;
else if content != -4
{
	var _collidewithplayer = false;
	with obj_player
	{
		var _oldmask = mask_index;
		mask_index = spr_player_mask;
		if (place_meeting(x, y, other))
			_collidewithplayer = true;
		mask_index = _oldmask;
	}
	if (!_collidewithplayer && !place_meeting(x, y, obj_haystack))
	{
		with (instance_create(x, y, content))
		{
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
			sprite_index = other.sprite_index;
			create_particle(x, y, particle.genericpoofeffect, 0);
		}
		instance_destroy();
	}
}
