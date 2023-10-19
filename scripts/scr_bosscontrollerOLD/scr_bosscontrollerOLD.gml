function noise_start_round()
{
	if (round_count == 6 || (round_count == 3 && extrarounds))
	{
		with (instance_create(256, 416, obj_baddiespawner))
		{
			create_particle(x, y, particle.genericpoofeffect, 0);
			content = obj_noisey;
		}
		with (instance_create(672, 416, obj_baddiespawner))
		{
			create_particle(x, y, particle.genericpoofeffect, 0);
			content = obj_noisey;
			image_xscale = -1;
		}
	}
}
function mrstick_start_round()
{
	with (obj_mrstickboss)
	{
		var b = boss_array[phase - 1];
		if (b != -4)
		{
			var tx = (x > (room_width / 2)) ? 1 : -1;
			var xx = tx * 32;
			with (instance_create(x + xx, y, b[0]))
			{
				if (object_index == obj_vigilanteboss)
					honor = false;
				create_particle(x, y, particle.genericpoofeffect, 0);
				important = false;
				phase = b[1];
				state = states.stun;
				stunned = 50;
			}
		}
	}
}
function mrstick_end_round()
{
	with (par_boss)
	{
		if (object_index != obj_mrstickboss)
		{
			create_particle(x, y, particle.genericpoofeffect, 0);
			instance_destroy();
		}
	}
	instance_destroy(obj_mrstickcardboard);
}
