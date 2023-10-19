if (floor(image_index) == 2 && canthrowbomb == 1)
{
	with (instance_create(x + (image_xscale * 10), y - 20, obj_bomb))
	{
		hsp = other.image_xscale * 4;
		drop = true;
		vsp = -5;
	}
	canthrowbomb = false;
}
if (floor(image_index) == (image_number - 1) && canthrowbomb == 0)
	image_speed = 0;
else
	image_speed = 0.35;
if (!instance_exists(obj_bomb) && obj_player.state != states.bombpep)
	canthrowbomb = true;
else
	canthrowbomb = false;
