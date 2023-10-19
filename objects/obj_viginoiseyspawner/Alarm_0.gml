if (!instance_exists(obj_noisey))
{
	var _x = irandom_range(100, room_width - 100);
	with (instance_create(_x, room_height + 100, obj_gustavograbbable))
	{
		if (other.first)
		{
			other.first = false;
			with (instance_create(x, y, obj_grabmarker))
				ID = other.id;
		}
		sprite_index = spr_player_ratmountgroundpound;
		image_index = 0;
		state = states.pizzaheadjump;
		hsp = 0;
		vsp = -20;
		var b = -4;
		with (obj_baddie)
		{
			if (id != other.id)
				b = id;
		}
		if (b != -4)
		{
			if (b.x != x)
				image_xscale = sign(b.x - x);
		}
	}
}
